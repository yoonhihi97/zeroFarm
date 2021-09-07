package com.zerofarm.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator { 
	//발신자 아이디 비밀번호
	  PasswordAuthentication pa;
	  public MyAuthentication(){
	    pa=new PasswordAuthentication("rnswk31@gmail.com","Tjdgns00@");        
	  }
	  @Override
	  protected PasswordAuthentication getPasswordAuthentication() {
	    return pa;
	  }
	}