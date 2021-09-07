package com.zerofarm.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.review.dao.ReviewDAO;
import com.zerofarm.app.review.dao.ReviewDTO;
import com.zerofarm.app.user.dao.UserDTO;


public class ReviewWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ReviewDAO rdao = new ReviewDAO();
		int fundnum = Integer.parseInt(request.getParameter("fundnum"));
		String content = request.getParameter("message");
		HttpSession session = request.getSession();
		String email = ((UserDTO)session.getAttribute("user")).getEmail();
		ReviewDTO review = new ReviewDTO();
		review.setEmail(email);
		review.setContent(content);		
		review.setFundnum(fundnum);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(rdao.insertReview(review)) {
													//경로에 맞춰 수정 필요.(임의로 작성)
			forward.setPath(request.getContextPath()+"/funding/funding-single.fd?fundnum="+fundnum);
		}else {
														//경로에 맞춰 수정 필요.(임의로 작성)
			forward.setPath(request.getContextPath()+"/funding/funding-single.fd?fundnum="+fundnum+"flag=false");
		}
		return forward;
	}
}
