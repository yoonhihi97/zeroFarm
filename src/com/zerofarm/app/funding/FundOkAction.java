package com.zerofarm.app.funding;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.bcel.internal.generic.FNEG;
import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.funding.dao.FundingDAO;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class FundOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		FundingDAO fdao = new FundingDAO();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		UserDTO user = (UserDTO)session.getAttribute("user");
		int fundPrice = Integer.parseInt(request.getParameter("fundPrice"));
		int fundCnt = Integer.parseInt(request.getParameter("fundCnt"));
		int point= user.getPoint()+(fundPrice*fundCnt)/100;
		int fundNum = Integer.parseInt(request.getParameter("fundNum"));
		fdao.addPrice(fundPrice*fundCnt, fundNum);
		user.setPoint(point);
		
		udao.minusUserPoint(user);
		session.setAttribute("user", user);
		forward.setPath("/funding/fundList.fd?page=1");
		forward.setRedirect(false);
		return forward;
	}
}
