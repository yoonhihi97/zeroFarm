package com.zerofarm.app.funding;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.funding.dao.FundImgDTO;
import com.zerofarm.app.funding.dao.FundingDAO;
import com.zerofarm.app.funding.dao.FundingDTO;
import com.zerofarm.app.review.dao.ReviewDAO;

public class FundingSingleAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FundingDAO fdao = new FundingDAO();
		FundingDTO fdto = new FundingDTO();
		FundImgDTO fidto = new FundImgDTO();
		ReviewDAO rdao = new ReviewDAO();
		int fundnum = Integer.parseInt(request.getParameter("fundnum"));
		fdto = fdao.getDetail(fundnum);
		fidto = fdao.getFundImg(fundnum);
		String[] fidto_arr = {fidto.getImg1(), fidto.getImg2(), fidto.getImg3(), fidto.getImg4(), fidto.getImg5()};
		ArrayList<String> ar_img = new ArrayList<String>();
		for(int i = 0; i<5; i++) {
			if(fidto_arr[i] != null) ar_img.add(fidto_arr[i]);
			else ar_img.add(null);
		}
		
		request.setAttribute("review", rdao.getReview(fundnum));
		request.setAttribute("funding", fdto);
		request.setAttribute("fundImg", ar_img);
		request.setAttribute("fundnum", fundnum);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/funding/funding-single.jsp?fundnum="+fundnum);
		
		return forward;
	}
}
