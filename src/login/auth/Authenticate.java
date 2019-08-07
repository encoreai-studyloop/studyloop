package login.auth;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;


public class Authenticate {
	
	public void sendMail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "회원 인증";
		String fromName = "관리자";
		String from = "Manager";
		String to1 = email;
		String content = "인증번호는  [" + authNum + "] 입니다.";
		String userName = "encore.aistudy@gmail.com";
		String password = "encore123!@#";
		
		try {
			Properties props = new Properties(); 
			
			props.put("mail.smtp.host", host); 
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true"); 
			props.put("mail.smtp.starttls.enable", "true"); 
			props.put("mail.transport.protocol", "smtp");
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(userName, password);
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO,  address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=utf-8");
		
			Transport.send(msg);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String randnum() {
		StringBuffer buffer = new StringBuffer();
		for(int i =0; i<=4; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
}
