package com.zerofarm.app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.zerofarm.app.coupon.dao.CouponDTO;
import com.zerofarm.app.user.dao.UserDTO;
import com.zerofarm.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public UserDAO() {
		//true : 오토커밋
		sqlsession = factory.openSession(true);
	}
	
	// 아이디 중복검사
	public boolean checkId(String email) {
		int result = 0;
		result = sqlsession.selectOne("User.checkEmail", email);
		return result == 0;
	}

	// 회원가입
	public boolean join(UserDTO user) {
		//sqlsession.insert() 는 수정된 행의 개수가 리턴된다.
		return 1==sqlsession.insert("User.join",user);
	}
	
	//로그인 
	public boolean login(String email, String password) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("email", email);
		datas.put("password", password);
		
		return 1==(Integer)sqlsession.selectOne("User.login",datas);
	}
	
	//이 사람의 타입을 파악하기 위함
	public String user_type(String email) {
		return (String)sqlsession.selectOne("User.user_type",email);
	}
	// 유저 정보 세션에 담기 위함
	public UserDTO my_info(String email) {
		return sqlsession.selectOne("User.select_all",email);
	}
	// 비밀번호 체크
	public boolean pwCheck(String email) {
		return 1==(Integer)sqlsession.selectOne("User.pwcheck", email);
	}
	public void minusUserPoint(UserDTO user) {
		sqlsession.update("User.minusUserPoint",user);
	}
	public void plusUserPoint(UserDTO user) {
		sqlsession.update("User.plusUserPoint",user);
	}
	//비밀번호 변경
	public boolean changepw(String email, String password) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("email", email);
		datas.put("password", password);
		// 수정된 값이 들어감
		return 1==sqlsession.insert("User.pwchange",datas);
	}
	//유저 삭제
	public boolean delete(String email) {
		return 1==sqlsession.insert("User.delete", email);
	}


}
