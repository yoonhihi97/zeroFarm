package com.zerofarm.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.seller.dao.SellerDAO;
import com.zerofarm.app.seller.dao.SellerDTO;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class UserDeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		SellerDAO sdao = new SellerDAO();
		SellerDTO sdto = new SellerDTO();
		HttpSession session = request.getSession();
		
		String email = ((UserDTO)session.getAttribute("user")).getEmail();
		ActionForward forward = null;
		if(udao.delete(email)) {
			//회원탈퇴에 성공했으면 세션 삭제 후 인덱스로 되돌려보낸다.
			session.removeAttribute("user");
			session.removeAttribute("seller");
			session.removeAttribute("authentic");
			forward = new ActionForward(true, request.getContextPath()+"/app/user/del_complete.jsp");
		} else {
			//회원탈퇴 실패했으면
			forward = new ActionForward(true, request.getContextPath()+"/app/user/del_complete.jsp?flag=false");
		}
		return forward;
	}
	

}
