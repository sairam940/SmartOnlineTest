/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user2
 */
@WebServlet(name = "MultipleAtt", urlPatterns = {"/MultipleAtt"})
public class MultipleAtt extends HttpServlet {

    @Override
    @SuppressWarnings("empty-statement")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            final String eusername = "";//your email
            final String epassword = "";//your  password

            Properties props = new Properties();
            props.put("mail.smtp.auth", true);
            props.put("mail.smtp.starttls.enable", true);
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            // creating session object to get properties
            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(eusername, epassword);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(eusername));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("vinayit986@gmail.com"));//specify receiver id
            message.setSubject("");
            message.setText("Your Password is");
            System.out.println("Sending");

            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();

            // Fill the message
            messageBodyPart.setText("This is message body");

            // Create a multipar message
            Multipart multipart = new MimeMultipart();

            // Set text message part
            multipart.addBodyPart(messageBodyPart);

            String[] att = {"C:\\ajax.war", "C:\\crew1.sql"};

            for (int i = 0; i < att.length; i++) {

                // Part two is attachment
                messageBodyPart = new MimeBodyPart();
                String filename = att[i];
                DataSource source = new FileDataSource(filename);
                messageBodyPart.setDataHandler(new DataHandler(source));
                messageBodyPart.setFileName(filename);
                multipart.addBodyPart(messageBodyPart);

                // Send the complete message parts
                message.setContent(multipart);
            }

            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
            System.out.println("Done");

        } catch (Exception er) {
            System.out.print(er);
        }
    }
}
