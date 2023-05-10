package mini;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;

import java.sql.*;

public class ForgetPassword {
	public static void main(HttpServletRequest request) {
        // email ID of Recipient.
        String recipient = request.getParameter("email");

        // Sender's email ID and password.
        final String sender = "0201mcsd008@niet.co.in";
        final String password = "niet@123";

        // Outlook SMTP server settings.
        String host = "smtp.office365.com";
        int port = 587;

        // Getting system properties.
        Properties properties = System.getProperties();

        // Setting up mail server.
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);

        // Creating session object to get properties.
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });

        try {
            // generate a 6-digit OTP
            int otp = (int) (Math.random() * 900000) + 100000;

            // store the OTP in the database
            String url = "jdbc:mysql://localhost:3306/lab_app";
            String user = "root";
            String dbPassword = "root";

            Connection conn = DriverManager.getConnection(url, user, dbPassword);

            String query = "UPDATE students SET otp = ? WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, otp);
            ps.setString(2, recipient);

            ps.executeUpdate();

            // MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From Field: adding sender's email to from field.
            message.setFrom(new InternetAddress(sender));

            // Set To Field: adding recipient's email to from field.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

            // Set Subject: subject of the email.
            message.setSubject("Password Reset OTP");

            // Set body of the email.
            message.setText("Your password reset OTP is: " + otp);

            // Send email.
            Transport.send(message);
            System.out.println("Password reset OTP sent successfully");
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


}

