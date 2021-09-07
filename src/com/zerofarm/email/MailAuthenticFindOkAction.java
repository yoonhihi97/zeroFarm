package com.zerofarm.email;

import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zerofarm.action.Action;
import com.zerofarm.action.ActionForward;
import com.zerofarm.app.user.dao.UserDAO;

public class MailAuthenticFindOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession mailsession = request.getSession();		 
		UserDAO udao = new UserDAO();
		//임시 비밀번호 생성
		 String password = UUID.randomUUID().toString().replaceAll("-", "");
		 password = password.substring(0, 10); //

		 
		 // SMTP 서버 주소
		 String smtpHost = "smtp.gmail.com";


		 //받는 사람의 정보
		 String toEmail = request.getParameter("email_front")+request.getParameter("selbox");

		 
		 //보내는 사람의 정보
		 String fromName = "인증번호 발송";
		 String fromEmail = "rnswk31@gmail.com";
		 
		 
		 ActionForward forward = null;
		 try {
		  Properties props = new Properties();
		props.put("mail.smtp.user", fromEmail);
		props.put("mail.smtp.host", "smtp.googlemail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");

		  // 메일 인증
		  Authenticator myauth=new MyAuthentication(); 
		  Session sess=Session.getInstance(props, myauth);
		  
		  InternetAddress addr = new InternetAddress();
		  addr.setPersonal(fromName,"UTF-8");
		  addr.setAddress(fromEmail);


		  Message msg = new MimeMessage(sess);
		  msg.setFrom(addr);         
		  msg.setSubject(MimeUtility.encodeText("새로 설정된 비밀번호입니다.", "utf-8","B"));
		  msg.setContent(password, "text/html;charset=utf-8");
		  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));


		  Transport.send(msg);
			
		 } catch (Exception e) {
		//메일 인증에 실패했을때
		  e.printStackTrace();
		  System.out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>" + e);
		  forward = new ActionForward(false, "/app/user/find_complete.jsp?flag=false");
		  return forward;
		 }
		 
		 System.out.println("<script>alert('메일이 전송되었습니다.');<script>");
		 
		 if(udao.changepw(toEmail, password)){
			 //이 바뀐 비밀번호로 로그인한 아이디는 비밀번호 변경창으로 보내주기 위함
			 //성공하면 얘가 비밀번호를 무조건 바꾸게 만들어준다.
		 mailsession.setAttribute("mail", password);
		 forward = new ActionForward(false, "/app/user/find_complete.jsp?flag=false");
		 }
		 return forward;
	}
	
}
