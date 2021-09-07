package com.zerofarm.app.funding;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.funding.dao.FundingDAO;
import com.zerofarm.app.funding.dao.FundingDTO;

public class FundListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		FundingDAO fdao = new FundingDAO();
		FundingDTO fdto = new FundingDTO();
		
		String temp = request.getParameter("page");
		int page = temp == null?1:Integer.parseInt(temp);
		int pageSize = 12;
		int totalCnt = fdao.getFundCnt();
		int endRow = page*pageSize;
		int startRow = endRow-(pageSize-1);
		
		int startPage = ((page-1)/pageSize)*pageSize+1;
		int endPage = startPage+9;
		int totalPage = (totalCnt-1)/pageSize+1;
		endPage = endPage>totalPage?totalPage:endPage;	
		

		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("page", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("fundingList", fdao.getFundList(startRow,endRow));
		request.setAttribute("fundImgList", fdao.getFundImgList(startRow, endRow));
		ActionForward forward = new ActionForward(false,"/app/funding/fundingList.jsp");
		return forward;
		
	}
}
