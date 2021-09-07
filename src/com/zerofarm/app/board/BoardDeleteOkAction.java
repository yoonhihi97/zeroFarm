package com.zerofarm.app.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.board.dao.BoardDAO;
import com.zerofarm.app.board.dao.BoardFileDAO;
import com.zerofarm.app.board.dao.BoardFileDTO;

public class BoardDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("확인용");
		BoardDAO bdao = new BoardDAO();
		System.out.println("확인용");
		BoardFileDAO fdao = new BoardFileDAO();
		System.out.println("확인용");
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		System.out.println("확인용");

		boolean flag = false;
		boolean fflag = false;
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		System.out.println(boardnum);
		String saveFolder = request.getServletContext().getRealPath("app/file");
		System.out.println("확인용");
		//해당 게시글에 올라와 있는 파일들의 정보를 담은 DTO들 다 검색해오기
		List<BoardFileDTO> files = fdao.getFiles(boardnum);
		System.out.println("확인용");
		
		if(files.size()>0) {
			System.out.println("확인용");
			//검색된 무언가가 있다면
			for(BoardFileDTO f : files) {
				//해당 DTO들 하나씩 꺼내오면서, 실존하는 파일 객체 만들기
				System.out.println("확인용");
				File file = new File(saveFolder, f.getSystemname());
				
				if(file.exists()) {
					//실제 파일이 있다면 지워주기
					file.delete();
					System.out.println(file.delete());
				}
				//꺼내온 DTO의 실존파일은 삭제되었으므로 DB에서도 삭제해주기
				fflag = fdao.deleteFileByName(f.getSystemname());
				
			
			}
		}
	
		if(bdao.deleteBoard(boardnum)) {
			forward.setPath(request.getContextPath()+"/board/EventBoardList.bo");
		}else {
			forward.setPath(request.getContextPath()+"/board/EventBoardList.bo?delete=false");
		}
		return forward;
	}
}





