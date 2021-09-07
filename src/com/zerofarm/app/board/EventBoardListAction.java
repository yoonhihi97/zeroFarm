package com.zerofarm.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.board.dao.BoardDAO;

public class EventBoardListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String temp = request.getParameter("page");
		String value = request.getParameter("value");

		System.out.println(value);

		BoardDAO bdao = new BoardDAO();

		// 리스트에서 보여달라고 요청한 페이지
		int page = temp == null ? 1 : Integer.parseInt(temp);
		// 한 페이지에 보여질 게시글의 개수
		int pageSize = 10;
		// 전체 게시글 개수
		int totalCnt = bdao.getBoardCnt();
		// 보여줘야되는 마지막 게시글의 rownum
		int eventCnt = totalCnt-bdao.getNoticeBoardCnt();
		
		int endRow = page * pageSize;
		// 보여줘야되는 첫번째 게시글의 rownum
		int startRow = endRow - (pageSize - 1);
		// 아래쪽 페이징처리의 보여지는 첫번째 페이지 번호
		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		// 아래쪽 페이징처리의 보여지는 마지막 페이지 번호
		int endPage = startPage + 9;
		// 가장 마지막 페이지 번호
		int totalPage = (eventCnt - 1) / pageSize + 1;
		// 가장 마지막 페이지 번호보다 연산으로 구해진 endPage가 더 큰 경우도 있다.
		// 그때는 endPage를 가장 마지막 페이지로 바꾸어준다.
		endPage = endPage > totalPage ? totalPage : endPage;
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("noticeCnt", eventCnt);
		request.setAttribute("page", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("eventboardlist", bdao.getEventboardList(startRow, endRow));
	

		ActionForward forward = new ActionForward(false, "/app/board/eventboardlist.jsp");
		
		return forward;
	}
}
