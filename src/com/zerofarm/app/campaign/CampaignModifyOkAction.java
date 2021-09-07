package com.zerofarm.app.campaign;

import java.io.File;
import java.util.List;

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

public class CampaignModifyOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		CampaignDAO cdao = new CampaignDAO();
		FileDAO fdao = new FileDAO();
		String saveFolder = request.getServletContext().getRealPath("app/file");
		int size = 5*1100*1100;
		MultipartRequest multi = new MultipartRequest(request, saveFolder,size,"UTF-8",new DefaultFileRenamePolicy());
		
		String camname = multi.getParameter("camname");
		String camcontent = multi.getParameter("camcontent");
		int camnum = Integer.parseInt(multi.getParameter("camnum"));
		String enddate = multi.getParameter("enddate");
		String sumimage = multi.getOriginalFileName("file1");
		String inimage = multi.getOriginalFileName("file2");
		String[] filenames = multi.getParameterValues("filename");
		if(sumimage == null) {
			sumimage = filenames[0];
		}
		if(inimage == null) {
			inimage = filenames[1];
		}
		
		CampaignDTO campaign = new CampaignDTO();
		campaign.setCamname(camname);
		campaign.setCamcontent(camcontent);
		campaign.setCamnum(camnum);
		campaign.setEnddate(enddate);
		campaign.setSumimage(sumimage);
		campaign.setInimage(inimage);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(cdao.updateCampaign(campaign)) {
			//방금 수정을 통해서 올린 파일의 시스템네임 배열
			String[] filename= {multi.getFilesystemName("file1"),multi.getFilesystemName("file2")};
			//방금 수정을 통해서 올린 파일의 원래 이름 배열
			String[] orgname = {multi.getOriginalFileName("file1"),multi.getOriginalFileName("file2")};
			//원래 이 글에 등록되어있던 파일들의 정보들
			List<FileDTO> files = fdao.getFiles(camnum);
			//새롭게올린(혹은 수정이 안된) 파일들의 원래 이름 배열
			filenames = multi.getParameterValues("filename");
			
			//올린 파일들의 개수를 파악하기 위한 로직
			int cnt=0;
			for(int i=0;i<filenames.length;i++) {
				if(filenames[i] != null && !filenames[i].equals("")) {
					cnt++;
				}
			}
			//올린 파일들의 개수만큼 반복하면서
			for (int i = 0; i < cnt; i++) {
				if(filename[i] == null) {
				}else {
					if(files.size()>=cnt) {
						//기존에 존재하던 파일을 객체로 불러오기
						File file = new File(saveFolder,files.get(i).getSystemname());
						//실제 위치에 그 파일이 존재한다면
						if(file.exists()) {
							//해당 파일 삭제
							file.delete();
						}
						//실제 파일이 삭제되었으므로 DB상에서도 정보를 지워줘야 한다.
						fdao.deleteFileByName(files.get(i).getSystemname());
					}
					//DB에 새롭게 올린 파일의 정보를 등록하는 과정
					FileDTO fdto = new FileDTO();
					fdto.setCamnum(camnum);
					fdto.setSystemname(filename[i]);
					fdto.setOrgname(orgname[i]);
					fdao.insertFile(fdto);
				}
			}
			forward.setPath(request.getContextPath()+"/campaign/CampaignView.ca?camnum="+camnum);
		}else {
			forward.setPath(request.getContextPath()+"/campaign/CampaignList.ca?update=false");
		}
		return forward;
	}
}














