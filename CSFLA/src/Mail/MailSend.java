package Mail;

import java.io.UnsupportedEncodingException;
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
   public MailSend() {}
   public void MailSend(String id, String pw, String receiveId, String title, String content) {
      Properties prop = System.getProperties();
      prop.put("mail.smtp.starttls.enable", "true");   // TLS
      prop.put("mail.smtp.host", "smtp.gmail.com");
      prop.put("mail.smtp.auth", "true");
      prop.put("mail.smtp.port", "587");   // TLS : 587 / SSL : 465

      Authenticator auth = new MailAuth(id, pw);

      Session session = Session.getDefaultInstance(prop, auth);

      MimeMessage msg = new MimeMessage(session);

      try {
         msg.setSentDate(new Date());   // 보내는 날짜

         msg.setFrom(new InternetAddress(id, "CSFLA"));   // 발송자 지정
         InternetAddress to = new InternetAddress(receiveId);     // 수신자 지정       
         msg.setRecipient(Message.RecipientType.TO, to);            
         msg.setSubject(title, "EUC-KR");   // 제목
         msg.setText(content, "EUC-KR");   // 내용            

         Transport.send(msg);

      } catch(AddressException ae) {            
         System.out.println("AddressException : " + ae.getMessage());           
      } catch(MessagingException me) {            
         System.out.println("MessagingException : " + me.getMessage());
      } catch(UnsupportedEncodingException e) {
         System.out.println("UnsupportedEncodingException : " + e.getMessage());         
      }

   }

}