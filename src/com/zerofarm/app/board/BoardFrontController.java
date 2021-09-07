package com.zerofarm.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.app.board.BoardModifyAction;
import com.zerofarm.app.board.BoardDeleteOkAction;
import com.zerofarm.app.board.BoardModifyOkAction;
import com.zerofarm.app.board.FileDownloadAction;
import com.zerofarm.action.ActionForward;

public class BoardFrontController extends HttpServlet {
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
		// 길 나누는 코드
		String requestURI = req.getRequestURI(); // 요청한 URI localhost:9090/user/UserJoin.us
		String contextPath = req.getContextPath(); // 최상위 경로 localhost:9090
		String command = requestURI.substring(contextPath.length());// /user/UserJoin.us
		System.out.println(command);
		ActionForward forward = null;
		
		switch (command) {
		case "/board/NoticeBoardList.bo":
			try {
				forward = new NoticeBoardListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("BoardList : " + e);
			}
			break;
		case "/board/EventBoardList.bo":
			try {
				forward = new EventBoardListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("BoardList : " + e);
			}
			break;
		case "/board/BoardWrite.bo":
			forward = new ActionForward(false, "/app/board/writeview.jsp");
			req.setAttribute("page", req.getParameter("page"));
			break;
		case "/board/BoardWriteOk.bo":
			try {
				forward = new BoardWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("BoardWriteOk : " + e);
			}
			break;
		case "/board/BoardModify.bo":
			try {
				forward = new BoardModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("BoardModify : " + e);
			}
			break;
		case "/board/BoardModifyOk.bo":
			try {
				forward = new BoardModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("BoardModifyOk : " + e);
			}
			break;
		case "/board/BoardView.bo":
			try {
				forward = new BoardViewAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("BoardView : " + e);
			}
			break;

		case "/board/BoardDeleteOk.bo":
			try {
				forward = new BoardDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("BoardDeleteOk : " + e);
			}
			break;
		case "/board/FileDownload.bo":
			try {
				new FileDownloadAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("FileDownload : " + e);
			}
			break;
			
		case "/FAQ/faq.bo":
			try {
				forward = new ActionForward(false, "/app/FAQ/FAQ.jsp");
			} catch (Exception e) {
				System.out.println("FAQ : " + e);
			}
			break;
			
		case "/company_info/contact.bo":
			try {
				forward = new ActionForward(false, "/app/company_info/contact.jsp");
			} catch (Exception e) {
				System.out.println("FAQ : " + e);
			}	
			break;
		
		case "/company_info/bestfunding.bo":
			try {
				forward = new ActionForward(false, "/app/company_info/bestfunding.jsp");
			} catch (Exception e) {
				System.out.println("FAQ : " + e);
			}	
			break;
		}
		// 일괄처리
		// 어디인지, 어떤 방식인지는 몰라도 담겨있는대로 페이지 이동시키는 코드
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
