package com.zerofarm.email;

import java.util.Properties;
import java.util.Random;

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

public class MailAuthenticDeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	     HttpSession mailsession = request.getSession();
	     //기존에 메일 인증 세션에 값이 있으면 삭제
	     mailsession.removeAttribute("authentic");
		 Random rd = new Random();
		 int random_int = rd.nextInt(899999) + 100000;
		 String authentic = random_int + "";
		 
		 // SMTP 서버 주소
		 String smtpHost = "smtp.gmail.com";


		 //받는 사람의 정보
		 String toEmail = request.getParameter("email_front")+request.getParameter("selbox");

		 
		 //보내는 사람의 정보
		 String fromName = "인증번호 발송";
		 String fromEmail = "rnswk31@gmail.com";
		 
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
		  msg.setSubject(MimeUtility.encodeText("제로팜 인증번호입니다.", "utf-8","B"));
		  msg.setContent(authentic, "text/html;charset=utf-8");
		  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));


		  Transport.send(msg);
			

		 } catch (Exception e) {
		  e.printStackTrace();
		  System.out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>" + e);
		  
		 }
		 
		 System.out.println("<script>alert('메일이 전송되었습니다.');<script>");
		 ActionForward forward = null;
		 
		 //방금 보낸 인증번호 세션에 저장
		 mailsession.setAttribute("authentic", authentic);
		
		 
		 forward = new ActionForward(false, "/app/user/delete_mailauthentic.jsp?toEmail"+toEmail);
		 return forward;
	}
	
}
