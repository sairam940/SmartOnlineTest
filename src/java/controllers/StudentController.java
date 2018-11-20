package controllers;

import entities.Contact;
import entities.Student;
import java.io.File;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.ContactModel;
import models.StudentModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

@WebServlet(name = "StudentController", urlPatterns = {"/student"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 20, // 20 MB
        maxFileSize = 1024 * 1024 * 1000, // 1GB
        maxRequestSize = 1024 * 1024 * 1000)      // 1GB

public class StudentController extends HttpServlet {

    public static final String UPLOAD_DIR = "resources";
    PrintWriter out;
    HttpSession session;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession();
            if (request.getParameter("signup") != null) {

                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                boolean status = StudentModel.getStudentCount(email, phone);
                if (status) {
                    System.out.println("Student Exist");
                    session.setAttribute("exist", "exist");
                    response.sendRedirect("student-signup");
                } else {
                    Part part = request.getPart("photo");
                    String photo = extractFileName(part);
                    String path = UPLOAD_DIR + "/" + photo;
                    System.out.println("photo: " + photo);
                    System.out.println("path: " + path);
                    String applicationPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    System.out.println("applicationPath: " + applicationPath);
                    File fileUploadDirectory = new File(applicationPath);
                    if (!fileUploadDirectory.exists()) {
                        fileUploadDirectory.mkdirs();
                    }
                    String savePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + photo;
                    File fileSaveDir = new File(savePath);
                    part.write(savePath + File.separator);
                    System.out.println("savePath: " + savePath);

                    String gender = request.getParameter("gender");
                    String dob = request.getParameter("dob");
                    String age = request.getParameter("age");
                    String pass = request.getParameter("pass");
                    String cpass = request.getParameter("cpass");
                    System.out.println(fname + " " + lname + " " + email + " " + phone + " " + gender + " " + dob + " " + age + " " + pass + " " + cpass);
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String addedDate = sdf.format(new Date());
                    Student st = new Student();
                    st.setFname(fname);
                    st.setLname(lname);
                    st.setEmail(email);
                    st.setPhoto(path);
                    st.setPhone(phone);
                    st.setDob(dob);
                    st.setGender(gender);
                    st.setAge(age);
                    st.setPass(pass);
                    st.setCpass(cpass);
                    st.setAddedDate(addedDate);
                    st = StudentModel.saveStudent(st);
                    if (st != null) {
                        final String username = "sairam.vgf1@gmail.com";//your email
                        final String password = "pullabhotla1992";//your password
                        Properties props = new Properties();
                        props.put("mail.smtp.auth", true);
                        props.put("mail.smtp.starttls.enable", true);
                        props.put("mail.smtp.host", "smtp.gmail.com");
                        props.put("mail.smtp.port", "587");
                        javax.mail.Session ss = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
                            @Override
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, password);
                            }
                        });
                        try {
                            Message message = new MimeMessage(ss);
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

                            htmlPart.setContent("Dear<strong> " + fname + " " + lname + " </strong>, your student account has been created successfully. <br>Below are the <b>Student Login</b> details.<br>", "text/html");
                            htmlPart2.setContent("Password: " + pass + "<br>", "text/html");
                            htmlPart1.setContent("Email: " + email + "<br>", "text/html");
                            multipart.addBodyPart(textPart);
                            multipart.addBodyPart(htmlPart);
                            multipart.addBodyPart(htmlPart1);
                            multipart.addBodyPart(htmlPart2);
                            message.setSubject("Regarding Student Account");
                            message.setContent(multipart);
                            //out.println("Sending");
                            Transport.send(message);
                        } catch (MessagingException e) {
                            out.println(e);
                        }
                        session.setAttribute("sname", fname + " " + lname);
                        session.setAttribute("image", path);
                        session.setAttribute("email", email);
                        session.setAttribute("phone", phone);
                        session.setAttribute("added", "added");
                        System.out.println("Student Added");
                        response.sendRedirect("student-signup");
                    } else {
                        System.out.println("Error Occured");
                        session.setAttribute("error", "error");
                        response.sendRedirect("student-signup");
                    }
                }
            } else if (request.getParameter("signin") != null) {
                String email = request.getParameter("email");
                String pass = request.getParameter("password");
                System.out.println(email + "  " + pass);
                ArrayList<Student> list = StudentModel.validateStudent(email, pass);
                Iterator itr = list.iterator();
                if (itr.hasNext()) {
                    session.setAttribute("email", email);
                    SessionFactory sf = HibernateUtil.getSessionFactory();
                    Session ss = sf.openSession();
                    Transaction tx = ss.beginTransaction();
                    String hql = "from Student as s where s.email='" + email + "'";
                    Query query = (Query) ss.createQuery(hql);
                    Iterator itr1 = query.iterate();
                    if (itr1.hasNext()) {
                        Student a = (Student) itr1.next();
                        String fname = a.getFname();
                        String lname = a.getLname();
                        String image = a.getPhoto();
                        String semail = a.getEmail();
                        String phone = a.getPhone();
                        session.setAttribute("phone", phone);
                        session.setAttribute("sname", fname + " " + lname);
                        session.setAttribute("image", image);
                        session.setAttribute("email", semail);
                    }
                    tx.commit();
                    ss.close();
                    response.sendRedirect("instructions");
                } else {
                    System.out.println("error");
                    session.setAttribute("error", "error");
                    response.sendRedirect("signin");
                }
            } else if (request.getParameter("forgot") != null) {
                try {
                    String ApplicationName = ((HttpServletRequest) request).getContextPath().replace("/", "");
                    //String ApplicationName1 =request.getContextPath();
                    String serverHostName = request.getServerName();
                    int port = request.getLocalPort();
                    out = response.getWriter();
                    session = request.getSession();
                    String email = request.getParameter("email");
                    System.out.println("in controller:" + email);
                    ArrayList<Student> list = StudentModel.findPassword(email);
                    Iterator itr = list.iterator();
                    if (itr.hasNext()) {
                        Student st = (Student) itr.next();
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
                            htmlPart.setContent("<br><a href='http://" + serverHostName + ":" + port + "/" + ApplicationName + "/signin'>Click Here</a> to login now.<br>", "text/html");
                            multipart.addBodyPart(textPart);
                            multipart.addBodyPart(htmlPart);
                            message.setSubject("Regarding Student Password");
                            message.setContent(multipart);
                            //out.println("Sending");
                            System.out.println("sending done..");
                            Transport.send(message);
                            HttpSession sessions = request.getSession();
                            String msg1 = "Your Password is sent to your email. &nbsp; <a style='text-decoration:underline;' href='mailto:" + pwd + "'>Click Here</a>&nbsp; to check it.";
                            sessions.setAttribute("msg1", msg1);
                            response.sendRedirect("forgot");
                        } catch (MessagingException | IOException e) {
                            out.println(e);
                        }
                    } else {
                        String msg = "Sorry! Student Name or Student Email does not match.";
                        HttpSession sessions = request.getSession();
                        sessions.setAttribute("msg", msg);
                        response.sendRedirect("forgot");
                    }
                } catch (IOException e) {
                    out.println(e);
                }
            } else if (request.getParameter("contact") != null) {
                try {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String comment = request.getParameter("message");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String addedDate = sdf.format(new Date());
                    Contact ct = new Contact();
                    ct.setName(name);
                    ct.setEmail(email);
                    ct.setPhone(phone);
                    ct.setMessage(comment);
                    ct.setAddedDate(addedDate);
                    ct = ContactModel.saveContact(ct);
                    if (ct != null) {
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
                            message.setFrom(new InternetAddress(email));
                            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
                            MimeBodyPart textPart = new MimeBodyPart();
                            MimeBodyPart htmlPart = new MimeBodyPart();
                            MimeBodyPart htmlPart1 = new MimeBodyPart();
                            MimeBodyPart htmlPart2 = new MimeBodyPart();
                            MimeBodyPart htmlPart3 = new MimeBodyPart();
                            MimeBodyPart htmlPart4 = new MimeBodyPart();
                            Multipart multipart = new MimeMultipart();
                            String final_Text = "";//try now, what you want in bold?
                            textPart.setText(final_Text);
                            String subject = "Contact Details";
                            //htmlPart.setContent("<a href='mailto:" + email + "'>Reply</a><br>", "text/html");
                            htmlPart.setContent("Name: " + name + "<br>", "text/html");
                            htmlPart1.setContent("Email: " + email + "<br>", "text/html");
                            htmlPart2.setContent("Subject: " + subject + "<br>", "text/html");
                            htmlPart3.setContent("Message: " + comment + "<br>", "text/html");
                            htmlPart4.setContent("<strong>" + name + " has contacted you. Below are the details.</strong><br>", "text/html");

                            //String final_Text = "Name: " + name + " Email: " + email + " Phone: " + phone + " Message: " + comment;
                            multipart.addBodyPart(textPart);

                            multipart.addBodyPart(htmlPart4);
                            multipart.addBodyPart(htmlPart);
                            multipart.addBodyPart(htmlPart1);
                            multipart.addBodyPart(htmlPart2);
                            multipart.addBodyPart(htmlPart3);
                            message.setSubject(subject);

                            message.setContent(multipart);
                            //out.println("Sending");
                            System.out.println("sending done..");
                            Transport.send(message);
//                            HttpSession sessions = request.getSession();
//                            String msg = "Thank you " + name + ", we will back to you soon.";
//                            sessions.setAttribute("msg", msg);
//                            response.sendRedirect("contact");
                            out.println("<center><div class='alert alert-success'>Thank you " + name + ", we will back to you soon.</div></center>");
                        } catch (MessagingException e) {
                            out.println(e);
                        }
                    } else {
//                        String msg1 = "Oops! Something went wrong please try again...";
//                        HttpSession sessions = request.getSession();
//                        sessions.setAttribute("msg1", msg1);
//                        response.sendRedirect("contact");
                        out.println("<center>Oops! Something went wrong please try again...</center>");
                    }

                } catch (Exception e) {
                    out.println(e);
                }
            } else {

            }
        } catch (IOException | ServletException | HibernateException e) {
            out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
