package com.zerofarm.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.zerofarm.app.user.UserLoginOkAction;
import com.zerofarm.email.CheckEmailAuthOkAction;
import com.zerofarm.email.MailAuthenticDeleteOkAction;
import com.zerofarm.email.MailAuthenticFindOkAction;
import com.zerofarm.email.MailAuthenticJoinOkAction;
import com.zerofarm.action.ActionForward;

public class UserFrontController extends HttpServlet {

	private static final long serialVersionUID = -1;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;

		switch (command) {
		case "/user/CheckIdOk.us":
			// 아이디 중복체크
			try {
				forward = new UserCheckIdOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("CheckIdOk : " + e);
			}
			break;
		// 회원가입
		case "/user/UserJoinOk.us":
			try {
				forward = new UserJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserJoinOk : " + e);
			}
			break;

		// 회원가입 하기 누르면
		case "/user/UserJoin.us":
			forward = new ActionForward(true, "/zerofarm/app/user/joinview.jsp");
			break;
		case "/user/UserDel.us" :
			forward = new ActionForward(false, "/app/user/delete_view.jsp");
			break;
		// 로그인 해주기
		case "/user/UserLoginOk.us":
			try {
				forward = new UserLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserLoginOk : " + e);
			}
			break;
		case "/user/ChangepwOk.us" :
			try {
				forward = new ChangepwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ChangepwOk : " + e);
			}
			break;
			//로그 아웃
		case "/user/UserLogout.us" :
			try {
				forward = new UserLogoutOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserLogOut : " + e);
			}
			break;
		//로그인 실패 없이 로그인창으로 가기
		case "/user/UserLoginGo.us":
			//최소한 로그인창 으로 온거면 req, resp는 필요가없다
			//redirect
			forward = new ActionForward(true, "/zerofarm/app/user/loginview.jsp");
			break;
		// 로그인후 인덱스 가기
		case "/user/Index.us":
			forward = new ActionForward(true, "/zerofarm/app/user/index.jsp");
			break;
		// 로그인 실패
		case "/user/UserLogin.us":
			forward = new ActionForward(false, "/app/user/loginview.jsp?flag=false");
			break;
			
		case "/user/UserLogin2.us":
			forward = new ActionForward(false, "/app/user/loginview.jsp?flag=true");
			break;

		//메일 인증(회원가입)
		case "/user/mailAuthentic_join.us":
			try {
				forward = new MailAuthenticJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("mailAuthentic_join : " + e);
			}
			break;
			//메일 인증(비밀번호 찾기)
		case "/user/mailAuthentic_find.us" :
			try {
				forward = new MailAuthenticFindOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("mailAuthentic_find : " + e);
			}
			break;
			//회원탈퇴시 아이디 검증
		case "/user/DeleteIdCheck.us" :
			try {
				forward = new DeleteIdCheckAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DeleteIdCheck : " + e);
			}
			break;
			//메일 인증(회원탈퇴)
		case "/user/mailAuthentic_delete.us" :
			try {
				forward = new MailAuthenticDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("mailAuthentic_delete : " + e);
			}
			break;
		case "/user/userDeleteOkAction.us" :
			try {
				forward = new UserDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserDeleteOkAction : " + e);
			}
			break;
			//이메일 인증 확인
		case "/user/CheckEmailAuth.us" :
			try {
				forward = new CheckEmailAuthOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("CheckEmailAuthOkAction : " + e);
			}
			break;
		//마이페이지
		case "/user/Mypage.us" :
			forward = new ActionForward(false, "/app/user/mypage_info.jsp");
			break;
			//비밀번호 변경창으로 가기
		case "/user/ChangePw.us" :
			forward = new ActionForward(false, "/app/user/mypage_pw.jsp");
			break; 		
		}
			

		if (forward != null) {
			if (forward.isRedirect()) {
				// Redirect
				resp.sendRedirect(forward.getPath());
			} else {
				// Forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}