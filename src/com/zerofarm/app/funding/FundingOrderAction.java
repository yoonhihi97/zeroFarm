package com.zerofarm.app.funding;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.funding.dao.FundImgDTO;
import com.zerofarm.app.funding.dao.FundingDAO;
import com.zerofarm.app.funding.dao.FundingDTO;
import com.zerofarm.app.review.dao.ReviewDAO;

public class FundingOrderAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int fundnum = Integer.parseInt(request.getParameter("fundNum"));
		String fundcnt = request.getParameter("fundCnt");  
		String fundprice = request.getParameter("fundPrice");  
		FundingDAO fdao = new FundingDAO();
		FundingDTO fdto = new FundingDTO();
		fdto = fdao.getDetail(fundnum);
		request.setAttribute("funding", fdto);
		request.setAttribute("fundnum", fundnum);	
		request.setAttribute("fundcnt", fundcnt);	
		request.setAttribute("fundprice", fundprice);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/funding/funding-order.jsp");		
		return forward;
	}

}
