package com.zerofarm.app.campaign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.campaign.dao.CampaignDAO;
import com.zerofarm.app.campaign.dao.CampaignDTO;
import com.zerofarm.app.campaign.dao.FileDAO;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class CampaignViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CampaignDAO cdao = new CampaignDAO();
		FileDAO fdao = new FileDAO();
		UserDAO udao = new UserDAO();
		int camnum = Integer.parseInt(request.getParameter("camnum"));
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		CampaignDTO campaign = cdao.getDetail(camnum);
		int userpoint = ((UserDTO)session.getAttribute("user")).getPoint();
		if(!campaign.getid().equals(userid)) {
			campaign = cdao.getDetail(camnum);
		}		
		request.setAttribute("files", fdao.getFiles(camnum));
		request.setAttribute("campaign", campaign);
		request.setAttribute("userpoint", userpoint);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/campaign/campaignview.jsp");
		return forward;
	}
}














