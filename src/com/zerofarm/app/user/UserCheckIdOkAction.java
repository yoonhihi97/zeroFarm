package com.zerofarm.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.user.dao.UserDAO;

public class UserCheckIdOkAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      UserDAO udao = new UserDAO();
      String email = request.getParameter("email");
      email = email.trim();
      PrintWriter out = response.getWriter();
      String user_type = (udao.user_type(email));


         if (udao.checkId(email)) {
            // 중복 안되는 아이디
            out.write("O");
         } else {
            // 중복된 아이디
            // 중복된 아이디중 찾는 아이디가 이미 탈퇴자면
            if(udao.user_type(email).equals("탈퇴자")) {
               out.write("D");
            } else {
               out.write("X");   
            }
         }
      out.close();
      return null;
   }

}
