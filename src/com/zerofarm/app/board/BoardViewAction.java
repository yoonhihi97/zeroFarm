package com.zerofarm.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.board.dao.BoardDAO;
import com.zerofarm.app.board.dao.BoardDTO;
import com.zerofarm.app.board.dao.BoardFileDAO;
import com.zerofarm.app.campaign.dao.CampaignDAO;
import com.zerofarm.app.campaign.dao.FileDAO;
import com.zerofarm.app.user.dao.UserDAO;

public class BoardViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO bdao = new BoardDAO();
		BoardFileDAO fdao = new BoardFileDAO();
		
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		BoardDTO bdto = bdao.getDetail(boardnum);
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");	
		
		if(!bdto.getEmail().equals(email)) {
			bdao.updateReadCount(boardnum);
			bdto = bdao.getDetail(boardnum);
		}
		request.setAttribute("files", fdao.getFiles(boardnum));
		request.setAttribute("board", bdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/boardview.jsp");
		return forward;
	}
}














