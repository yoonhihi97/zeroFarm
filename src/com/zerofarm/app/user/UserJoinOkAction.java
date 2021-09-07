package com.zerofarm.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class UserJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		String address = request.getParameter("useraddr")+" "+request.getParameter("useraddrdetail") + " " +request.getParameter("useraddretc");
		
		user.setEmail(request.getParameter("email"));
		
		System.out.println(request.getParameter("email"));
		
		user.setPassword(request.getParameter("password"));
		user.setPhonenum(request.getParameter("phonenum"));
		user.setAddress(address);
		user.setName(request.getParameter("name"));
		user.setUser_type("고객");
		System.out.println(user.getAddress());
		ActionForward forward = null;
		
		//insert문 redirect 방식
		if(udao.join(user)) {
			System.out.println(request.getContextPath());
			forward = new ActionForward(true, request.getContextPath()+"/app/user/index.jsp");
		}
		return forward;
	}

	
	

}
