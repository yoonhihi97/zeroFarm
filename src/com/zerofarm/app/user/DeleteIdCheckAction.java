package com.zerofarm.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class DeleteIdCheckAction implements Action{


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String email_check  = ((UserDTO)session.getAttribute("user")).getEmail();
		System.out.println(email);
		System.out.println(email_check);
		email = email.trim();
		email_check = email_check.trim();
		PrintWriter out = response.getWriter();
		if (!email.equals(email_check)) {
			//현재 로그인한 아이디와 인증받으려는 아이디가 일치하지 않음
			out.write("O");
		} else {
			//현재 로그인한 아이디와 인증받으려는 아이디가 일치함
			out.write("X");
		}
		out.close();
		return null;
	}

}
