package com.zerofarm.app.campaign;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.ActionForward;

public class CampaignFrontController extends HttpServlet {
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
		//길 나누는 코드
		String requestURI = req.getRequestURI(); //요청한 URI	localhost:9090/user/UserJoin.us
		String contextPath = req.getContextPath(); //최상위 경로 localhost:9090
		String command = requestURI.substring(contextPath.length());// /user/UserJoin.us
		System.out.println(command);
		ActionForward forward = null;
		switch(command) {
		case "/campaign/CampaignList.ca":
			try {
				forward = new CampaignListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CampaignList : "+e);
			}
			break;
		case "/campaign/CampaignWrite.ca":
			forward = new ActionForward(false,"/app/campaign/campaignWriteView.jsp");
			req.setAttribute("page", req.getParameter("page"));
			break;
		case "/campaign/CampaignWriteOk.ca":
			try {
				forward = new CampaignWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardWriteOk : "+e);
			}
			break;
		case "/campaign/CampaignView.ca":
			try {
				forward = new CampaignViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardView : "+e);
			}
			break;
		case "/campaign/CampaignModify.ca":
			try {
				forward = new CampaignModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardModify : "+e);
			}
			break;
		case "/campaign/CampaignModifyOk.ca":
			try {
				forward = new CampaignModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardModifyOk : "+e);
			}
			break;
		case "/campaign/CampaignDeleteOk.ca":
			try {
				forward = new CampaignDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardDeleteOk : "+e);
			}
			break;
		case "/campaign/FileDownload.ca":
			try {
				new FileDownloadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FileDownload : "+e);
			}
		case "/campaign/CampaignOk.ca":
			try {
				forward = new CampaignOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReplyModifyOk : "+e);
			}
			break;
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
