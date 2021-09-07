package com.zerofarm.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.funding.dao.FundingDTO;
import com.zerofarm.app.review.dao.ReviewDAO;



public class ReviewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO rdao = new ReviewDAO();
		int fundnum = Integer.parseInt(request.getParameter("fundnum"));
		FundingDTO funding = rdao.getDetail(fundnum);
		request.setAttribute("review", rdao.getReview(fundnum));
		request.setAttribute("funding", funding);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/funding/funding-single.jsp");
		return forward;
		
		
	}
}
