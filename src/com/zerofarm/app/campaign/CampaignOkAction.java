package com.zerofarm.app.campaign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.campaign.dao.CampaignDAO;
import com.zerofarm.app.campaign.dao.CampaignDTO;
import com.zerofarm.app.campaign.dao.CampaignUserDAO;
import com.zerofarm.app.campaign.dao.CampaignUserDTO;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class CampaignOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		CampaignDAO cdao = new CampaignDAO();
		CampaignDTO campaign = new CampaignDTO();
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		CampaignUserDAO ucdao = new CampaignUserDAO();
		CampaignUserDTO campaignuser = new CampaignUserDTO();
		int camnum =  Integer.parseInt(request.getParameter("camnum"));
		int campoint = Integer.parseInt(request.getParameter("campoint"));
		int camtotalpoint = Integer.parseInt(request.getParameter("camtotalpoint"));
		HttpSession session = request.getSession();
		String userid = ((UserDTO)session.getAttribute("user")).getEmail();
		int point = ((UserDTO)session.getAttribute("user")).getPoint();
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(point >= campoint) {
			campaign.setCamnum(camnum);
			campaign.setCamtotalpoint(camtotalpoint+campoint);
			cdao.updateCamtotalpoint(campaign);
			user.setPoint(point-campoint);
			UserDTO temp = (UserDTO)session.getAttribute("user");
			temp.setPoint(point-campoint);
			session.setAttribute("user", temp);
			user.setEmail(userid);
			udao.minusUserPoint(user);
			campaignuser.setCamnum(camnum);
			campaignuser.setCampoint(campoint);
			campaignuser.setEmail(userid);
			ucdao.insertCampaignUser(campaignuser);
			forward.setPath(request.getContextPath()+"/campaign/CampaignList.ca");
		}else {
			forward.setPath(request.getContextPath()+"/campaign/CampaignView.ca?camnum="+camnum);
		}
		
		
		return forward;
	}

}
