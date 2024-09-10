package util;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
    /** 메일 HOST **/
    private static final String HOST = "smtp.naver.com";
    /** 메일 PORT **/
    private static final String PORT = "587";
    /** 메일 ID **/
    private static final String MAIL_ID = "ccccssung@naver.com";
    /** 메일 PW **/
    private static final String MAIL_PW = "tjd801399";

    public static String send(String receiveEmail) {
        try {
            InternetAddress[] receiverList = new InternetAddress[1];
            receiverList[0] = new InternetAddress(receiveEmail);




            Properties props = new Properties();
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", MailUtil.HOST);
            props.put("mail.smtp.port", MailUtil.PORT);
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl.trust", MailUtil.HOST);
            props.put("mail.smtp.ssl.enable", MailUtil.HOST);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");
            


            Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
                protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                    return new javax.mail.PasswordAuthentication(MailUtil.MAIL_ID, MailUtil.MAIL_PW);
                }
            });


            Message mimeMessage = new MimeMessage(mailSession);
            mimeMessage.setFrom(new InternetAddress(MailUtil.MAIL_ID));
            mimeMessage.setRecipients(Message.RecipientType.TO, receiverList);

            mimeMessage.setSubject("----인증 메일입니다----");
            String certification = UUID.randomUUID().toString().substring(0,4);
            String body = "<center><h2>인증 번호</h2></center>\n" + "<center><h3 style = \"font-weight: bolder\">"+certification+"</h3></center>";
            mimeMessage.setContent(body, "text/html; charset=UTF-8");


            Transport.send(mimeMessage);
            return certification;

        } catch(Exception e) {
            System.out.println("error 발생!!");
            e.printStackTrace();
            return null;
        }
    }
    
    


 
}
