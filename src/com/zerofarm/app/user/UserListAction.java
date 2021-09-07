package com.zerofarm.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class UserListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("login_id");
		int point = ((UserDTO)session.getAttribute("user")).getPoint();
	
		System.out.println(email+": "+point);

		request.setAttribute("email", email);
		request.setAttribute("point", point);
		
		
		ActionForward forward = new ActionForward(false,"/app/campaign/campaignlist.jsp");
		
		return forward;
	}
	
}
