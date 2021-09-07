package com.zerofarm.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.review.dao.LikeReviewDTO;
import com.zerofarm.app.review.dao.ReviewDAO;
import com.zerofarm.app.user.dao.UserDTO;



public class LikeUpOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ReviewDAO rdao = new ReviewDAO();
		UserDTO user = new UserDTO();
		int fundnum = Integer.parseInt(request.getParameter("fundnum"));
		int reviewnumber = Integer.parseInt(request.getParameter("reviewnumber"));
		HttpSession session = request.getSession();
		String email = ((UserDTO)session.getAttribute("user")).getEmail();
		
		LikeReviewDTO lrdto = new LikeReviewDTO(); 
		lrdto.setEmail(email);
		lrdto.setReviewnumber(reviewnumber);
		lrdto.setFundnum(fundnum);

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		System.out.println(1);
		System.out.println(email);
		System.out.println(reviewnumber);
		System.out.println(fundnum);
		if(rdao.likeReviewSelect(lrdto)) {
			System.out.println(2);
			if(rdao.likeReview(lrdto)) {	
				System.out.println(3);
				if(rdao.likeUp(reviewnumber)) {
					forward.setPath(request.getContextPath()+"/funding/funding-single.fd?fundnum="+fundnum);
				} else {
					forward.setPath(request.getContextPath()+"/funding/funding-single.fd?update1=false&fundnum="+fundnum);
				};
			} else {
				forward.setPath(request.getContextPath()+"/funding/funding-single.fd?update2=false&fundnum="+fundnum);
			};
		} else {
			forward.setPath(request.getContextPath()+"/funding/funding-single.fd?like=false&fundnum="+fundnum);
		}
		return forward;
	}
}
