package Mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
   PasswordAuthentication pa;
    
    public MailAuth(String id, String pw) {
        String mail_id = id;
        String mail_pw = pw;
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }

}