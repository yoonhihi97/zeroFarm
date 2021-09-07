package com.zerofarm.app.campaign;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.campaign.dao.CampaignDAO;
import com.zerofarm.app.campaign.dao.FileDAO;
import com.zerofarm.app.campaign.dao.FileDTO;

public class CampaignDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CampaignDAO cdao = new CampaignDAO();
		FileDAO fdao = new FileDAO();
		int camnum = Integer.parseInt(request.getParameter("camnum"));
		boolean flag = true;
		boolean fflag = false;
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		String saveFolder = request.getServletContext().getRealPath("app/file");
		//해당 게시글에 올라와 있는 파일들의 정보를 담은 DTO들 다 검색해오기
		List<FileDTO> files = fdao.getFiles(camnum);
		if(files.size()>0) {
			//검색된 무언가가 있다면
			for(FileDTO f : files) {
				//해당 DTO들 하나씩 꺼내오면서, 실존하는 파일 객체 만들기
				File file = new File(saveFolder, f.getSystemname());
				if(file.exists()) {
					//실제 파일이 있다면 지워주기
					file.delete();
				}
				//꺼내온 DTO의 실존파일은 삭제되었으므로 DB에서도 삭제해주기
				fflag = fdao.deleteFileByName(f.getSystemname());
				System.out.println("fflag: "+fflag);
				if(!fflag) {
					//DB에서 File정보 지우기 실패했다면 for문 탈출 후 삭제 진행 멈추기
					break;
				}
			}
		}
		if(!fflag) {
	         fflag = true;
	      }
		if(!flag || !fflag) {
			forward.setPath(request.getContextPath()+"/campaign/CampaignList.ca?delete=false");
			System.out.println("실패1");
			return forward;
		}
		if(cdao.deleteCampaign(camnum)) {
			forward.setPath(request.getContextPath()+"/campaign/CampaignList.ca");
			System.out.println("실패2");

		}else {
			forward.setPath(request.getContextPath()+"/campaign/CampaignList.ca?delete=false");
			System.out.println("실패3");

		}
		return forward;
	}
}







