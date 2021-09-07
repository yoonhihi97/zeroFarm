package com.zerofarm.app.coupon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.ActionForward;
import com.zerofarm.app.coupon.CouponListAction;

public class CouponFrontController extends HttpServlet {
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
		// 湲� �굹�늻�뒗 肄붾뱶
		String requestURI = req.getRequestURI(); // �슂泥��븳 URI localhost:9090/user/UserJoin.us
		String contextPath = req.getContextPath(); // 理쒖긽�쐞 寃쎈줈 localhost:9090
		String command = requestURI.substring(contextPath.length());// /user/UserJoin.us
		System.out.println(command);
		ActionForward forward = null;

		switch (command) {
		case "/coupon/CouponList.co":
			try {
				forward = new CouponListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("CouponList : " + e);
			}
			break;
		case "/coupon/CouponWrite.co":
			try {
				forward = new CouponWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("CouponWrite : " + e);
			}
			break;
		case "/coupon/CouponUse.co":
			try {
				forward = new CouponUseAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("CouponUse : " + e);
			}
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
