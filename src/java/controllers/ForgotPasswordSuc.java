package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ForgotPasswordSuc", urlPatterns = {"/ForgotPasswordSuc"})
public class ForgotPasswordSuc extends HttpServlet {

    PrintWriter out = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            String to = request.getParameter("email");
            String password = request.getParameter("password");
            System.out.print(to + "" + password);

            final String eusername = "sairam.vgf1@gmail.com";//your email
            final String epassword = "pullabhotla1992";//your password

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
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));//specify receiver id
            message.setSubject("Your Password is given in below");
            message.setText("Your Password is   " + password);
            System.out.println("Sending");

            Transport.send(message);
            HttpSession msend = request.getSession();
            msend.setAttribute("msend", "msend");
            System.out.println("Done");

            response.sendRedirect("forgot");

        } catch (IOException | MessagingException er) {
            System.out.print(er);
        }
    }

}
