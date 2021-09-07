package com.zerofarm.app.funding;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.funding.dao.FundingDAO;
import com.zerofarm.app.funding.dao.OrderDTO;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class FundingOrderOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 해야할것
		// 주문내역 테이블 생성해서 데이터 누적0
		// 펀딩된 금액 증가 0
		// 포인트 사용했으면 잔여 포인트 마이너스 0
		// 결제금액의 일부분 포인트 적립 0
		// 주문완료 페이지 만들어서 주문 완료 되면 주문완료 페이지로 가게하기 
		
		UserDAO udao = new UserDAO();
		FundingDAO fdao = new FundingDAO();
		OrderDTO order = new OrderDTO();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		UserDTO user = (UserDTO)session.getAttribute("user");
		int fundprice = Integer.parseInt(request.getParameter("fundPrice"));
		int fundcnt = Integer.parseInt(request.getParameter("fundCnt"));
		int usepoint = Integer.parseInt(request.getParameter("point_input"));
		int point= (user.getPoint()+(fundprice*fundcnt)/100)-usepoint;
		int fundnum = Integer.parseInt(request.getParameter("fundNum"));
		int price = fundprice*fundcnt;
		String fundtitle = request.getParameter("fundtitle");
		String email = ((UserDTO)session.getAttribute("user")).getEmail();
		String ordernow = "배송전";
		
		order.setEmail(email);
		order.setFundtitle(fundtitle);
		order.setFundcnt(fundcnt);
		order.setPrice(price);
		order.setOrdernow(ordernow);
		
		if(fdao.addOrderList(order)) {
			fdao.addPrice(fundprice*fundcnt, fundnum);
			user.setPoint(point);
			udao.minusUserPoint(user);
			session.setAttribute("user", user);
			session.setAttribute("price", price);
			session.setAttribute("fundtitle", fundtitle);
			forward = new ActionForward(true, request.getContextPath()+"/funding/fundOk.fd");
			System.out.println("결제 성공");
		}else {
			forward = new ActionForward(true, request.getContextPath()+"/funding/fundList.fd?page=1");
			System.out.println("결제 실패");
		}
		
		return forward;
		
	}

}
