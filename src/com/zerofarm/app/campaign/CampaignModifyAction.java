  package com.zerofarm.app.campaign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.campaign.dao.CampaignDAO;
import com.zerofarm.app.campaign.dao.CampaignDTO;
import com.zerofarm.app.campaign.dao.FileDAO;

public class CampaignModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CampaignDAO cdao = new CampaignDAO();
		FileDAO fdao = new FileDAO();
		int camnum = Integer.parseInt(request.getParameter("camnum"));
		CampaignDTO campaign = cdao.getDetail(camnum);
		request.setAttribute("campaign", campaign);
		request.setAttribute("files", fdao.getFiles(camnum));
		ActionForward forward = new ActionForward(false, "/app/campaign/campaignModifyView.jsp");
		return forward;
	}
}











