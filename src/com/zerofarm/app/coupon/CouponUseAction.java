package com.zerofarm.app.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.coupon.dao.CouponDAO;
import com.zerofarm.app.coupon.dao.CouponDTO;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;


public class CouponUseAction implements Action  {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CouponDAO cdao = new CouponDAO();
		CouponDTO coupon = new CouponDTO();
		CouponDTO coupon2 = new CouponDTO();
		UserDTO user = new UserDTO();
		UserDAO udao = new UserDAO();

		
		String email = ((UserDTO)session.getAttribute("user")).getEmail();			
		
		
		
		int couponcode = Integer.parseInt(request.getParameter("couponcode"));
		int coupondiscount = cdao.getCoupondiscount(couponcode);
	

		

		ActionForward forward = new ActionForward();
		
		coupon.setCouponcode(couponcode);
		
		coupon2.setCoupondiscount(coupondiscount);
		coupon2.setEmail(email);
		
		cdao.updatePoint(coupon2);
		cdao.updateCoupon(coupon);
		session.removeAttribute("user");
		user = udao.my_info(email);
		session.setAttribute("user", user);
		
		
		
		
		forward.setPath("/coupon/CouponList.co");
		
		return forward;
	
		
		
	}
}