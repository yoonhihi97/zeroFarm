package com.zerofarm.app.coupon.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.app.board.dao.BoardDTO;
import com.zerofarm.app.coupon.dao.CouponDTO;
import com.zerofarm.mybatis.SqlMapConfig;

public class CouponDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public CouponDAO() {
		sqlsession = factory.openSession(true);
	}
	public int getCouponCnt(String email) {
		return sqlsession.selectOne("Coupon.getCouponCnt",email);
	}
	public int getusedCouponCnt(String coupon) {
		return sqlsession.selectOne("Coupon.getusedCouponCnt");
	}
	
	public List<CouponDTO> getCouponList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();	
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<CouponDTO> CouponList = sqlsession.selectList("Coupon.getCouponList",datas);
		return CouponList;
	}
	public boolean updateCoupon(CouponDTO coupon) {
		return 1 == sqlsession.update("Coupon.UpdateCoupon",coupon);
	}

	public boolean insertCoupon(CouponDTO coupon) {
		return 1==sqlsession.insert("Coupon.InsertCoupon",coupon);
	}
	public boolean getEmail(CouponDTO coupon) {
		return 1==sqlsession.insert("Coupon.GetEmail",coupon);
	}
	public int getCoupondiscount(int couponcode) {
		
		return sqlsession.selectOne("Coupon.getCouponDiscount",couponcode);
	}
	public boolean updatePoint(CouponDTO coupon2) {
		return 1 == sqlsession.update("Coupon.UpdatePoint",coupon2);
	}

	
}













