package com.zerofarm.app.review.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.app.funding.dao.FundImgDTO;
import com.zerofarm.app.funding.dao.FundingDTO;

import com.zerofarm.mybatis.SqlMapConfig;

public class ReviewDAO {
	SqlSessionFactory factory = com.zerofarm.mybatis.SqlMapConfig.getFactory();
	SqlSession sqlsession;
		
	public ReviewDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public int getFundingCnt() {
		return sqlsession.selectOne("review.getFundingCnt");
	}
	
	public boolean insertReview(ReviewDTO review) {
		return 1 == sqlsession.insert("review.insertReview", review);
	}

	public List<ReviewDTO> getReview(int fundnum) {
		List<ReviewDTO> review = sqlsession.selectList("review.getReview", fundnum);
		return review;
	}

	public List<FundImgDTO> getFundingList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<FundImgDTO> fundingList = sqlsession.selectList("review.getFundingList", datas);
		return fundingList;
	}

	public boolean insertFunding(FundingDTO funding) {
		return 1==sqlsession.insert("review.insertFunding", funding);
		
	}

	public int getSeq(String fundinfo) {
		return (Integer)sqlsession.selectList("review.getSeq", fundinfo).get(0);
	}

	public FundingDTO getDetail(int fundnum) {
		return sqlsession.selectOne("review.getDetail",fundnum);
	}

	public boolean modifyReview(int reviewnumber, String content) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("reviewnumber", reviewnumber);
		datas.put("content", content);
		return 1==sqlsession.update("review.modifyReview", datas);
	}

	public boolean deleteReview(int reviewnumber) {
		return 1 == sqlsession.delete("review.deleteReview",reviewnumber);
	}

	public boolean likeUp(int reviewnumber) {
		return 1 == sqlsession.update("review.likeUp",reviewnumber);
	}

	public boolean likeReview(LikeReviewDTO lrdto) {
		return 1==sqlsession.insert("review.likeReview", lrdto);
	}

	public boolean likeReviewSelect(LikeReviewDTO lrdto) {
		int result = 0;
		result = sqlsession.selectOne("review.likeReviewSelect", lrdto);
		return result == 0;
	}
}
