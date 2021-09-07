package com.zerofarm.app.seller.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.mybatis.SqlMapConfig;

public class SellerDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public SellerDAO() {
		//true : 오토커밋
		sqlsession = factory.openSession(true);
	}

	//판매자 등록 sql
	public boolean join(SellerDTO sdto) {
		//sqlsession.insert() 는 수정된 행의 개수가 리턴된다.
		return 1==sqlsession.insert("Seller.join",sdto);
	}

	//판매자 등록하면서 유저타입을 판매자로 바꾼다.
	public boolean type_update(SellerDTO sdto) {
		return 1==sqlsession.insert("Seller.type_update",sdto);
	}
	
	//팬마자 세션을 전부 담기위해서 정보를 dto타입을 반환받는 sql
	public SellerDTO seller_info(String email) {
		return sqlsession.selectOne("Seller.select_all",email);
	}
	
	
	
}
