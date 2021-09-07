package com.zerofarm.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.review.dao.ReviewDAO;



public class ReviewModifyOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO rdao = new ReviewDAO();
		request.setCharacterEncoding("UTF-8");
		int fundnum = Integer.parseInt(request.getParameter("fundnum"));
		String num = request.getParameter("num");
		String content = request.getParameter("review"+num);
		int reviewnumber = Integer.parseInt(request.getParameter("reviewnumber"));
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(rdao.modifyReview(reviewnumber,content)) {
			forward.setPath(request.getContextPath()+"/funding/funding-single.fd?fundnum="+fundnum);
		}else {
			forward.setPath(request.getContextPath()+"/funding/funding-single.fd?update=false&fundnum="+fundnum);
		}
		return forward;
	}
}
