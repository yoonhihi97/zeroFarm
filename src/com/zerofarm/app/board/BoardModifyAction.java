package com.zerofarm.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.app.board.dao.BoardFileDAO;
import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.board.dao.BoardDAO;
import com.zerofarm.app.board.dao.BoardDTO;


public class BoardModifyAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO bdao = new BoardDAO();
		BoardFileDAO fdao = new BoardFileDAO();
		
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		BoardDTO board = bdao.getDetail(boardnum);
		request.setAttribute("board", board);
		request.setAttribute("files", fdao.getFiles(boardnum));
		ActionForward forward = new ActionForward(false, "/app/board/modifyview.jsp");
		return forward;
	}
}











