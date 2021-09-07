package com.zerofarm.app.seller;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.seller.dao.SellerDAO;
import com.zerofarm.app.seller.dao.SellerDTO;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class SellerJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SellerDAO sdao = new SellerDAO();
		SellerDTO sdto = new SellerDTO();
		UserDTO udto = new UserDTO();
		UserDAO udao = new UserDAO();
		System.out.println("여기 들어옴");
		request.setCharacterEncoding("UTF-8");
		
		sdto.setCeo_email(request.getParameter("ceo_email"));
		
		sdto.setCompany_num(request.getParameter("company_num"));
		
		sdto.setCompany_name(request.getParameter("company_name"));
		
		sdto.setCeo_phonenum(request.getParameter("ceo_phonenum"));
		
		sdto.setBanktype(request.getParameter("banktype"));
		
		sdto.setAccount_holder(request.getParameter("account_holder")); 
		
		sdto.setAccount_num(request.getParameter("account_num"));
		
		HttpSession session = request.getSession();
			
		String email = ((UserDTO)session.getAttribute("user")).getEmail();
		sdto.setEmail(email);
		
		System.out.println(email);
		
		//등록에 성공하면 바로 판매자 전용 뷰를 보여주기 위함
		
		ActionForward forward = null;
		
		if(sdao.join(sdto)) {
			if(sdao.type_update(sdto)) {
				//판매자 등록과 동시에 판매자 세션에 등록
				sdto = sdao.seller_info(email);
				session.setAttribute("seller", sdto);
			System.out.println(request.getContextPath());
			forward = new ActionForward(true, request.getContextPath()+"/app/user/index.jsp");
			}
		}		
		return forward;
	}

}
