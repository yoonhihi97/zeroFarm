package com.zerofarm.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.review.dao.ReviewDAO;



public class ReviewDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO rdao = new ReviewDAO();
		int reviewnumber = Integer.parseInt(request.getParameter("reviewnumber"));
		String fundnum = request.getParameter("fundnum");
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(rdao.deleteReview(reviewnumber)) {
			forward.setPath(request.getContextPath()+"/funding/funding-single.fd?fundnum="+fundnum);
		}else {
			forward.setPath(request.getContextPath()+"/funding/funding-single.fd?delete=false&fundnum="+fundnum);
		}
		return forward;
	}
}
