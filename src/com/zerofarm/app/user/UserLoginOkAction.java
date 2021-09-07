package com.zerofarm.app.user;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.seller.dao.SellerDAO;
import com.zerofarm.app.seller.dao.SellerDTO;
import com.zerofarm.app.user.dao.UserDAO;
import com.zerofarm.app.user.dao.UserDTO;

public class UserLoginOkAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      UserDAO udao = new UserDAO();
      UserDTO udto = new UserDTO();
      SellerDAO sdao = new SellerDAO();
      SellerDTO sdto = new SellerDTO();
      
      String email = request.getParameter("name");
      String password = request.getParameter("password");
      
      
      HttpSession session = request.getSession();
      ActionForward forward = null;
      
      //select문
      //redirect 방식
      
      
      
      if(udao.login(email, password)) {
         //유저의 모든 정보를 dto 타입으로 세션에 담기위해 sql을 돌린다.
         //세션에 로그인한 유저의 정보 담기
         udto = udao.my_info(email);
         session.setAttribute("user", udto);
         
         //하지만 로그인하는 user가 탈퇴자일 경우에는
         if(((UserDTO)session.getAttribute("user")).getUser_type().equals("탈퇴자")){
               session.removeAttribute("user");
               System.out.println("탈퇴한 회원");
               // ?
               forward = new ActionForward(true, request.getContextPath()+"/user/UserLogin2.us?flag=true");
               return forward;
         }
         
         // 로그인한 유저가 판매자면 session에 "판매자"라고 등록한다.
         if(udao.user_type(email).equals("판매자")) {
            //판매자라면 판매자의 모든 세션을 등록
            sdto = sdao.seller_info(email);
            session.setAttribute("seller", sdto);
         } else if (udao.user_type(email).equals("관리자")) {

				session.setAttribute("admin", "관리자");
         }
         forward = new ActionForward(true, request.getContextPath()+"/user/Index.us");
      } else {
         forward = new ActionForward(true, request.getContextPath()+"/user/UserLogin.us?flag=false");
      }
      return forward;
   }

   

}