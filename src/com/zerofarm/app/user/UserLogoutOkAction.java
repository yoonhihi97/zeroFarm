package com.zerofarm.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;

public class UserLogoutOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		session.removeAttribute("user");
		session.removeAttribute("seller");
		session.removeAttribute("mail");
		session.removeAttribute("authentic");
		session.removeAttribute("admin");
		
		System.out.println("세션 삭제댐");
		forward = new ActionForward(true, request.getContextPath()+"/user/Index.us");
		return forward;
	}
	
	
}
