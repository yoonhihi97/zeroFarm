package com.zerofarm.app.campaign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.campaign.dao.CampaignDAO;
import com.zerofarm.app.campaign.dao.CampaignDTO;
import com.zerofarm.app.campaign.dao.FileDAO;
import com.zerofarm.app.campaign.dao.FileDTO;

public class CampaignWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CampaignDAO cdao = new CampaignDAO();
		FileDAO fdao = new FileDAO();
		request.setCharacterEncoding("UTF-8");
		
		//파일이 저장될 경로
		String saveFolder = request.getServletContext().getRealPath("app/file");
		int size = 5*1100*1100;


		//form에서 enctype을 multipart/form-data 로 보냈다면 필요한 객체
		MultipartRequest multi = new MultipartRequest(request, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		//파일을 올렸을 때 실제 서버에 저장되어 있는 파일의 이름
		String sumimage = multi.getFilesystemName("file1");
		if(sumimage == null) {
			//file1 태그에 아무 파일도 업로드 하지 않은경우
			fcheck1 = true;
		}
		//파일을 올릴 때 사용자가 올렸던 이름(다운로드시에는 이 이름으로 다운로드 되게 해야함)
		String orgname1 = multi.getOriginalFileName("file1");
		
		String inimage = multi.getFilesystemName("file2");
		if(inimage == null) {
			//file2 태그에 아무 파일도 업로드 하지 않은경우
			fcheck2 = true;
		}
		String orgname2 = multi.getOriginalFileName("file2");
		
		//fcheck1이나 fcheck2가 false로 남아있다면 어떤 파일을 올렸다는 뜻
		//multipart/form-data 로 보냈다면 request가 아니라 위에서 만들어준 MultipartRequest 객체로
		//보내준 데이터들을 받아야 한다.
		String camname = multi.getParameter("camname");
		String camcontent = multi.getParameter("camcontent");
		String enddate = multi.getParameter("enddate");
		String id = multi.getParameter("id");
		CampaignDTO board = new CampaignDTO();
		board.setCamname(camname);
		board.setCamcontent(camcontent);
		board.setEnddate(enddate);
		board.setid(id);
		board.setSumimage(sumimage);
		board.setInimage(inimage);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		
		if(cdao.insertCampaign(board)) {
//			//현재 추가된 보드 번호(해당 파일들이 올라가있는 게시글 번호)
			int camnum = cdao.getSeq(id);
			
			if(!fcheck1) {
				FileDTO file = new FileDTO();
				file.setCamnum(camnum);
				file.setSystemname(sumimage);
				file.setOrgname(orgname1);
				//DB에다가 파일 정보 추가
				//파일 정보를 디비에 추가 시도(실패했다면 fcheck1이 false로 남아있음 / 성공이라면 true로 바뀜)
				fcheck1 = fdao.insertFile(file);
			}
			if(!fcheck2) {
				FileDTO file = new FileDTO();
				file.setCamnum(camnum);
				file.setSystemname(inimage);
				file.setOrgname(orgname2);
				//DB에다가 파일 정보 추가
				fcheck2 = fdao.insertFile(file);
			}
			
			//fcheck1과 fcheck2가 둘다 true라는 뜻은 아무 파일도 안올렸거나, 파일 업로드를 성공한 경우
			if(fcheck1 && fcheck2) {
				forward.setPath(request.getContextPath()+"/campaign/CampaignView.ca?camnum="+camnum);
			}else {
				forward.setPath(request.getContextPath()+"/campaign/CampaignList.ca?flag=false");
				cdao.deleteCampaign(camnum);
			}
//		forward.setPath(request.getContextPath()+"/campaign/CampaignView.ca?camnum="+camnum);
//		}else {
//			forward.setPath(request.getContextPath()+"/campaign/CampaignList.ca?flag=false");
//		}
		
		}
		return forward;
	}		
}	












