package com.zerofarm.app.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.ActionForward;

public class ReviewFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//길나누는 코드
		String requestURI = req.getRequestURI();	//요청한 URI
		String contextPath = req.getContextPath();	//최상위 경로
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;
		
		switch(command) {
		case "/funding/startOk.re" :
			try {
				forward = new StartOkAction().execute(req, resp);
			} catch (Exception e2) {
				System.out.println("startOk : "+e2);
			}
			break;
		case "/funding/fundingWrite.re" :
			forward = new ActionForward(false, "/writeview.jsp");
			req.setAttribute("page", req.getParameter("page"));
			break;
		
		case "/funding/review.re" :
			try {
				forward = new ReviewAction().execute(req, resp);
			} catch (Exception e1) {
				System.out.println("review "+e1);
			}
			break;
		case "/review/ReviewWriteOk.re" :
			//리뷰 작성
			try {
				forward = new ReviewWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ReviewWriteOk : "+e);
			}
			break;
		case "/funding/ReviewModifyOk.re" :
			try {
				forward = new ReviewModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReviewModifyOk" +e);
			}
			break;
		case "/funding/ReviewDeleteOk.re" :
			try {
				forward = new ReviewDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReviewDeleteOk : " +e);
			}
			break;
		case "/funding/LikeUpOk.re" :
			try {
				forward = new LikeUpOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("LikeUpOk.re : " +e);
			}
		}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				//Redirect
				resp.sendRedirect(forward.getPath());
			}else {
				//Forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
