package com.zerofarm.app.funding.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.mybatis.SqlMapConfig;

public class FundingDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public FundingDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public boolean insertFund(FundingDTO fdto) {
		return 1==sqlsession.insert("Funding.newFunding", fdto);
	}
	public boolean insertFundImg(FundImgDTO fidto) {
		return 1==sqlsession.insert("Funding.newFundImg", fidto);
	}

	public int getFundCnt() {
		return sqlsession.selectOne("Funding.getFundCnt");
	}

	public List<FundingDTO> getFundList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<FundingDTO> boardList = sqlsession.selectList("Funding.getFundList",datas);
		return boardList;
	}
	public List<FundingDTO> getFundList_fruit(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<FundingDTO> boardList = sqlsession.selectList("Funding.getFundList_fruit",datas);
		return boardList;
	}
	public List<FundingDTO> getFundList_vegetable(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<FundingDTO> boardList = sqlsession.selectList("Funding.getFundList_vegetable",datas);
		return boardList;
	}
	public List<FundingDTO> getFundList_plants(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<FundingDTO> boardList = sqlsession.selectList("Funding.getFundList_plants",datas);
		return boardList;
	}

	public FundingDTO getDetail(int fundnum) {
		return sqlsession.selectOne("Funding.getDetail", fundnum);
	}
	
	public FundImgDTO getFundImg(int fundnum) {
		return sqlsession.selectOne("Funding.getImg", fundnum);
	}

	public List<FundImgDTO> getFundImgList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<FundImgDTO> ImgList = sqlsession.selectList("Funding.getFundImgList",datas);
		return ImgList;
	}

	public boolean addPrice(int price, int fundNum) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("price", price);
		datas.put("fundnum", fundNum);
		
		return 1==sqlsession.update("Funding.addPrice", datas);
	}
	
	public boolean addOrderList(OrderDTO odto) {
		return 1==sqlsession.insert("Funding.addOrderList", odto);
	}
}
