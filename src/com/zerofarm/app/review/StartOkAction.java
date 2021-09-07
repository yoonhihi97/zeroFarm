package com.zerofarm.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;


public class StartOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		
		ActionForward forward = null;
		
		session.setAttribute("email", email);
		forward = new ActionForward(true,request.getContextPath()+"/funding/fundingList.re");
		
		return forward;
	} 
}
