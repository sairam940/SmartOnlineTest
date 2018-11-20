package controllers;

import entities.Faculty;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
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
import javax.servlet.http.HttpSession;
import models.FacultyModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

@WebServlet(name = "FacultyController", urlPatterns = {"/FacultyController"})
public class FacultyController extends HttpServlet {

    PrintWriter out = null;
    HttpSession sessions;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            sessions = request.getSession();
            if (request.getParameter("signup") != null) {
                try {
                    System.out.println("in faculty signup");
                    String fname = request.getParameter("fname");
                    String lname = request.getParameter("lname");
                    String faculty_name = fname + " " + lname;
                    String email = request.getParameter("email");
                    String qualification = request.getParameter("qualification");
                    String phone = request.getParameter("phone");
                    boolean status1 = FacultyModel.getFacultyCount(email, phone);
                    if (status1) {
                        sessions.setAttribute("exist", "exist");
                        response.sendRedirect("add-faculty");
                    } else {
                        System.out.println("phone: " + phone);
                        String pass = request.getParameter("pass");
                        String cpass = request.getParameter("cpass");

                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String addedDate = sdf.format(new Date());
                        System.out.println(fname + " " + lname + " " + email + " " + phone + " " + qualification + " " + pass + " " + cpass + " " + addedDate);
                        Faculty fclty = new Faculty();
                        fclty.setFname(fname);
                        fclty.setLname(lname);
                        fclty.setEmail(email);
                        fclty.setQualification(qualification);
                        fclty.setPhone(phone);
                        fclty.setPass(pass);
                        fclty.setCpass(cpass);
                        fclty.setAddedDate(addedDate);
                        boolean status = FacultyModel.saveFaculty(fclty);
                        System.out.println("status: " + status);
                        if (status) {
                            final String username = "sairam.vgf1@gmail.com";//your email
                            final String password = "pullabhotla1992";//your password
                            Properties props = new Properties();
                            props.put("mail.smtp.auth", true);
                            props.put("mail.smtp.starttls.enable", true);
                            props.put("mail.smtp.host", "smtp.gmail.com");
                            props.put("mail.smtp.port", "587");
                            javax.mail.Session session = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
                                @Override
                                protected PasswordAuthentication getPasswordAuthentication() {
                                    return new PasswordAuthentication(username, password);
                                }
                            });
                            try {
                                Message message = new MimeMessage(session);
                                message.setFrom(new InternetAddress(username));
                                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                                MimeBodyPart textPart = new MimeBodyPart();
                                MimeBodyPart htmlPart = new MimeBodyPart();
                                MimeBodyPart htmlPart1 = new MimeBodyPart();
                                MimeBodyPart htmlPart2 = new MimeBodyPart();
                                Multipart multipart = new MimeMultipart();
                                String final_Text = "";//try now, what you want in bold?
                                textPart.setText(final_Text);
                                //htmlPart.setContent("<a href='mailto:" + email + "'>Reply</a><br>", "text/html");

                                htmlPart.setContent("Dear<strong> " + faculty_name + " </strong>, your faculty account has been created successfully. <br>Below are the <b>Faculty Login</b> details.<br>", "text/html");
                                htmlPart2.setContent("Password: " + pass + "<br>", "text/html");
                                htmlPart1.setContent("Email: " + email + "<br>", "text/html");
                                multipart.addBodyPart(textPart);
                                multipart.addBodyPart(htmlPart);
                                multipart.addBodyPart(htmlPart1);
                                multipart.addBodyPart(htmlPart2);
                                message.setSubject("Regarding Faculty Account");
                                message.setContent(multipart);
                                //out.println("Sending");
                                Transport.send(message);
                            } catch (MessagingException e) {
                                out.println(e);
                            }
                            //response.sendRedirect("index");
                            System.out.println("in if fclty");
                            String facultyName = fname + " " + lname;
                            sessions.setAttribute("facultyName", facultyName);
                            sessions.setAttribute("femail", email);
                            out.println("added");
                        } else {
                            System.out.println("in else fclty");
                        }
                    }
                } catch (IOException e) {
                    System.out.println(e);
                }
            } else if (request.getParameter("signin") != null) {
                String email = request.getParameter("email");
                String pass = request.getParameter("password");
                System.out.println(email + "  " + pass);
                ArrayList<Faculty> list = FacultyModel.validateFaculty(email, pass);
                System.out.println("size=" + list.size());
                if (list != null && !list.isEmpty()) {
                    Iterator itr = list.iterator();
                    if (itr.hasNext()) {
                        ArrayList<Faculty> al = FacultyModel.getFacultyProfile(email);
                        Iterator itr1 = al.iterator();
                        if (itr1.hasNext()) {
                            System.out.println("in if email");
                            Faculty a = (Faculty) itr1.next();
                            String fname = a.getFname();
                            String lname = a.getLname();
                            String femail = a.getEmail();
                            String phone = a.getPhone();
                            sessions.setAttribute("phone", phone);
                            sessions.setAttribute("name", fname + " " + lname);
                            sessions.setAttribute("femail", femail);
                            response.sendRedirect("faculty-home");
                        }
                    }

                } else {
                    sessions.setAttribute("error", "error");
                    response.sendRedirect("faculty-login");
                }
            } else if (request.getParameter("act") != null) {

                String trdata = request.getParameter("all");
                String[] data = trdata.split(",");
                for (int i = 0; i < data.length; i++) {
                    System.out.println(data[i] + " ");
                }
                int id = Integer.parseInt(data[0]);
                String fname = data[1];
                String lname = data[2];
                String email = data[3];
                String qualification = data[4];
                String phone = data[5];
                System.out.println(id + " " + fname + " " + lname + " " + email + " " + qualification + " " + phone);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql1 = "UPDATE Faculty SET fname='" + fname + "',lname='" + lname + "',email='" + email + "',qualification='" + qualification + "',phone='" + phone + "' WHERE id=" + id + "";
                Query query = s.createQuery(hql1);
                int result = query.executeUpdate();
                System.out.println("Rows affected: " + result);
                if (result > 0) {
                    out.print("updated");
                }
            } else if (request.getParameter("forgot") != null) {
                try {
                    String ApplicationName = ((HttpServletRequest) request).getContextPath().replace("/", "");
                    //String ApplicationName1 =request.getContextPath();
                    String serverHostName = request.getServerName();
                    int port = request.getLocalPort();
                    out = response.getWriter();
                    sessions = request.getSession();
                    String email = request.getParameter("email");
                    System.out.println("in controller:" + email);
                    ArrayList<Faculty> list = FacultyModel.findFacultyPassword(email);
                    Iterator itr = list.iterator();
                    if (itr.hasNext()) {
                        Faculty st = (Faculty) itr.next();
                        String pwd = st.getPass();
                        final String username = "sairam.vgf1@gmail.com";//your email
                        final String password = "pullabhotla1992";//your password
                        Properties props = new Properties();
                        props.put("mail.smtp.auth", true);
                        props.put("mail.smtp.starttls.enable", true);
                        props.put("mail.smtp.host", "smtp.gmail.com");
                        props.put("mail.smtp.port", "587");
                        javax.mail.Session session = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
                            @Override
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, password);
                            }
                        });
                        try {
                            Message message = new MimeMessage(session);
                            message.setFrom(new InternetAddress(username));
                            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                            MimeBodyPart textPart = new MimeBodyPart();
                            MimeBodyPart htmlPart = new MimeBodyPart();
                            Multipart multipart = new MimeMultipart();
                            String final_Text = "Your Password is: " + pwd;
                            textPart.setText(final_Text);
                            htmlPart.setContent("<br><a href='http://" + serverHostName + ":" + port + "/" + ApplicationName + "/faculty-login'>Login Now</a><br>", "text/html");
                            multipart.addBodyPart(textPart);
                            multipart.addBodyPart(htmlPart);
                            message.setSubject("Regarding Faculty Password");
                            message.setContent(multipart);
                            //out.println("Sending");
                            System.out.println("sending done..");
                            Transport.send(message);
                            HttpSession sessions = request.getSession();
                            String msg1 = "Your Password is sent to your email. &nbsp; <a style='text-decoration:underline;' href='mailto:" + pwd + "'>Click Here</a>&nbsp; to check it.";
                            sessions.setAttribute("msg1", msg1);
                            response.sendRedirect("faculty-forgot");
                        } catch (MessagingException | IOException e) {
                            out.println(e);
                        }
                    } else {
                        String msg = "Sorry! Faculty Name or Faculty Email does not match.";
                        //HttpSession sessions = request.getSession();
                        sessions.setAttribute("msg", msg);
                        response.sendRedirect("faculty-forgot");
                    }
                } catch (IOException e) {
                    out.println(e);
                }
            }

        } catch (IOException | NumberFormatException | HibernateException er) {
            out.println(er);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            if (request.getParameter("actio") != null) {
                String id = request.getParameter("id");
                //out.println(id);
                int ids = Integer.parseInt(id);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql = "DELETE FROM Faculty where id=:id";
                Query query = s.createQuery(hql);
                query.setParameter("id", ids);
                int result = query.executeUpdate();
                s.getTransaction().commit();
                if (result > 0) {
                    HttpSession ses = request.getSession();
                    ses.setAttribute("deleted", "deleted");
                    response.sendRedirect("faculty-list");
                }
            }

        } catch (IOException | NumberFormatException | HibernateException er) {
            out.println(er);
        }
    }

}
