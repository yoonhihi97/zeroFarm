package com.zerofarm.app.campaign.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.mybatis.SqlMapConfig;

public class CampaignUserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public CampaignUserDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public boolean insertCampaignUser(CampaignUserDTO campaignuser) {
		return 1==sqlsession.insert("Campaign.insertCampaignUser",campaignuser);
	}
}
