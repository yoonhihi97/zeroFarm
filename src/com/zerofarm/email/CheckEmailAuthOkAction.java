package com.zerofarm.email;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.user.dao.UserDAO;

public class CheckEmailAuthOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		HttpSession session = request.getSession();
		// 입력한 인증번호
		String auth_check = request.getParameter("auth_check");
		System.out.println(auth_check);
		//실제 인증번호
		String auth_num = (String)session.getAttribute("authentic");
		System.out.println(auth_num);
		
		PrintWriter out = response.getWriter();
		if (auth_num.equals(auth_check)) {
			// 이메일 인증 성공
			session.removeAttribute("authentic");
			out.write("O");
		} else {
			// 이메일 인증 실패
			out.write("X");
		}
		out.close();
		return null;
	}
}
