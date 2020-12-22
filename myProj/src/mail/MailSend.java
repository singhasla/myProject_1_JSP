package mail;

import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
    
    public MailSend(String id, String f, String t, String subject, String content) {

    	Properties props = new Properties();    
    	props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP

    	props.put("mail.smtp.port", "465");
    	props.put("mail.smtp.starttls.enable", "true");
    	props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.debug", "true");
    	props.put("mail.smtp.socketFactory.port", "465");
    	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    	props.put("mail.smtp.socketFactory.fallback", "false");
		
    	// SMTP 서버에 접속하기 위한 정보들
        /*props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", "smtp.naver.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");
     
        props.put("mail.smtp.quitwait", "false");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");*/
        
        try {

        	Authenticator auth = new MailAuth();

        	Session session = Session.getDefaultInstance(props, auth);
        	MimeMessage msg = new MimeMessage(session);
        
            msg.setSentDate(new Date());

            //송신
            msg.setFrom(new InternetAddress(t));	// 이메일 계정 Auth없이는 전송불가하므로 나에게로 메일보내기
            System.out.println("MailSend.java의 보내는 사람="+t);
            //수신
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(t));
            System.out.println("MailSend.java의 받는 사람="+t);
            msg.setSubject(subject, "UTF-8");
            msg.setContent(content, "text/html;charset=UTF-8");
            
            Transport.send(msg);
            
        } catch(AddressException ae) {            
            System.out.println("MailSend.java의 AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MailSend.java의 MessagingException : " + me.getMessage());
        } 
                
    }
}