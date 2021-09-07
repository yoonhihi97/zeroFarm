package com.zerofarm.app.campaign.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.mybatis.SqlMapConfig;

public class CampaignDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public CampaignDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public int getCampaignCnt() {
		return sqlsession.selectOne("Campaign.getCampaignCnt");
	}

	public List<CampaignDTO> getCampaignList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<CampaignDTO> boardList = sqlsession.selectList("Campaign.getCampaignList",datas);
		return boardList;
	}

	public boolean insertCampaign(CampaignDTO campaign) {
		return 1==sqlsession.insert("Campaign.insertCampaign",campaign);
	}

	public int getSeq(String userid) {
		return (Integer)sqlsession.selectList("Campaign.getSeq",userid).get(0);
	}

	public CampaignDTO getDetail(int camnum) {
		return sqlsession.selectOne("Campaign.getDetail",camnum);
	}

	public boolean updateCampaign(CampaignDTO campaign) {
		return 1 == sqlsession.update("Campaign.updateCampaign",campaign);
	}


	public boolean deleteCampaign(int camnum) {
		return 1==sqlsession.delete("Campaign.deleteCampaign",camnum);
	}
	
	public void updateCamtotalpoint(CampaignDTO board) {
		sqlsession.update("Campaign.updateCamtotalpoint",board);
	}
	
}













