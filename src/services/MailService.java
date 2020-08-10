package services;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailService {

    private String TITLE = "Mail Title";
    private String FORM = "Mail  Form";

    private boolean naverMailSend(String to) {
        String host = "smtp.naver.com";
        // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String user = "asszxc@naver.com";
        // 패스워드
        String password = "dbqudwns1977";
        // SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 메일 제목
            message.setSubject(TITLE);
            // 메일 내용
            message.setText(FORM);
            // send the message
            Transport.send(message);
            System.out.println("Success Message Send");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean MailSender(String to) {
        if (naverMailSend(to)) {
            return true;
        } else {
            /*TODO DB Transaction Delete Work*/
            return false;
        }
    }
}
