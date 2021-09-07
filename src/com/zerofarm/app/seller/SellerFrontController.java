package com.zerofarm.app.seller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.ActionForward;

public class SellerFrontController extends HttpServlet {
	

	
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
		case "/seller/SellerJoin.sl" :
			forward = new ActionForward(false, "/app/seller/sellerjoinview.jsp");
			break;
	
		// 판매자 등록
		case "/user/SellerJoinOk.sl" :
			try {
				forward = new SellerJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("SellerjoinOk :" + e);
			}
		//판매자가 자기 정보 보기
		case "/seller/SellerMypage.sl" :
			forward = new ActionForward(false, "/app/seller/sellermypage.jsp");
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