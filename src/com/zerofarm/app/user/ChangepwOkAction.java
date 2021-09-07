package com.zerofarm.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class ChangepwOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		HttpSession session = request.getSession();

		String email = ((UserDTO) session.getAttribute("user")).getEmail();
		String nowpw = ((UserDTO) session.getAttribute("user")).getPassword();
		String pw_check = request.getParameter("pw");
		String password = request.getParameter("pw_ch");
		System.out.println();
		System.out.println(nowpw);
		ActionForward forward = null;
		if (!nowpw.equals(pw_check)) {
			//아이디 비밀번호와 입력한 비밀번호가 틀리면
			forward = new ActionForward(false, "/user/ChangePw.us?flag=false");
		} else {
			// 같으면
			if(udao.changepw(email, password)) {
				// 비밀번호 변경을 일으킨다.
				forward = new ActionForward(false, "/user/ChangePw.us?flag=true");
				//기존 세션 삭제
				session.removeAttribute("user");
				session.removeAttribute("mail");
				//세션 재부여
				udto = udao.my_info(email);
				session.setAttribute("user", udto);
			}
		}
		return forward;
	}

}
