package com.zerofarm.app.funding;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.ActionForward;



public class FundingFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);	
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		switch(command) {

		case "/funding/fundInsert.fd":
			try {
				forward = new ActionForward(false, "/app/funding/fundInsert.jsp");
			} catch (Exception e) {
				System.out.println("fundInsert : "+e);
			}
			break;
		
		
		case "/funding/fundInsertOk.fd":
			try {
				forward = new FundInsertOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("fundInsert : "+e);
			}
			break;
			
		case "/funding/fundList.fd":
			try {
				forward = new FundListAction().execute(req,resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("fundList : "+e);
			}
			break;
		
		case "/funding/funding-single.fd":
			try {
				forward = new FundingSingleAction().execute(req,resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("funding-single : "+e);
			}break;
		case "/funding/funding-order.fd":
			try {
				forward = new FundingOrderAction().execute(req,resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("funding-order : "+e);
			}break;
		case "/funding/fundingOrderOk.fd":
			try {
				forward = new FundingOrderOkAction().execute(req,resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("fundingOrderOk : "+e);
			}break;	
		case "/funding/fundOk.fd":
			try {
				forward = new ActionForward(false, "/app/funding/funding-orderOk.jsp");
			} catch (Exception e) {
				System.out.println("fundOk : "+e);
			}break;

	}		
		
		//일괄처리
		//어디인지, 어떤 방식인지는 몰라도 담겨있는대로 페이지 이동시키는 코드
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
