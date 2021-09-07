package com.zerofarm.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.app.board.dao.BoardDTO;
import com.zerofarm.mybatis.SqlMapConfig;

public class BoardDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public BoardDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public int getBoardCnt() {
		return sqlsession.selectOne("Board.getBoardCnt");
	}
	public int getNoticeBoardCnt() {
		return sqlsession.selectOne("Board.getNoticeBoardCnt");
	}
	public int getEventBoardCnt() {
		return sqlsession.selectOne("Board.getEventBoardCnt");
	}
	public List<BoardDTO> getNoticeboardList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<BoardDTO> NoticeboardList = sqlsession.selectList("Board.getNoticeboardList",datas);
		return NoticeboardList;
	}
	public List<BoardDTO> getEventboardList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<BoardDTO> EventboardList = sqlsession.selectList("Board.getEventboardList",datas);
		return EventboardList;
	}

	public boolean updateBoard(BoardDTO board) {
		return 1 == sqlsession.update("Board.updateBoard",board);
	}

	public boolean insertBoard(BoardDTO board) {
		return 1==sqlsession.insert("Board.insertBoard",board);
	}

	public int getSeq(String email) {
		return (Integer)sqlsession.selectList("Board.getSeq",email).get(0);
	}

	public BoardDTO getDetail(int boardnum) {
		return sqlsession.selectOne("Board.getDetail",boardnum);
	}

	public void updateReadCount(int boardnum) {
		sqlsession.update("Board.updateReadCount",boardnum);
	}
	public boolean deleteBoard(int boardnum) {
		return 1==sqlsession.delete("Board.deleteBoard",boardnum);
	}
}













