package com.zerofarm.app.coupon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.coupon.dao.CouponDAO;
import com.zerofarm.app.coupon.dao.CouponDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CouponWriteOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CouponDAO cdao = new CouponDAO();
		CouponDTO coupon = new CouponDTO();
		request.setCharacterEncoding("UTF-8");

	
		int coupondiscount = Integer.parseInt(request.getParameter("coupondiscount"));
		String couponname = request.getParameter("couponname");
		String email = request.getParameter("email");
		
		
	
		coupon.setCoupondiscount(coupondiscount);
		coupon.setEmail(email);
		coupon.setCouponname(couponname);
		
		System.out.println(coupondiscount);
		System.out.println(email);
		System.out.println(couponname);
		
		// form에서 enctype을 multipart/form-data 로 보냈다면 필요한 객체
	
		cdao.insertCoupon(coupon);
	
		ActionForward forward = new ActionForward(false, "/app/coupon/couponwrite.jsp");
		return forward;

	}
}