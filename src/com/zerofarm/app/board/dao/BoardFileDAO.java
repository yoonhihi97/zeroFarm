package com.zerofarm.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.mybatis.SqlMapConfig;

public class BoardFileDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public BoardFileDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public boolean insertFile(BoardFileDTO file) {
		return 1 == sqlsession.insert("BoardFile.insertFile",file);
	}

	public List<BoardFileDTO> getFiles(int boardnum) {
		List<BoardFileDTO> files = sqlsession.selectList("BoardFile.getFiles",boardnum);
		return files;
	}

	public boolean deleteFileByName(String systemname) {
		return 1==sqlsession.delete("BoardFile.deleteFileByName",systemname);
	}
}








