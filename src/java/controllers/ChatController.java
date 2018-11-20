package controllers;

import entities.Chat;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ChatModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

@WebServlet(name = "ChatController", urlPatterns = {"/ChatController"})
public class ChatController extends HttpServlet {

    PrintWriter out = null;
    HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
        } catch (IOException e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            if (request.getParameter("submit") != null) {
                session = request.getSession(false);
                String userType = request.getParameter("userType");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String userComment = request.getParameter("userComment");
                System.out.println(userType + " " + name + " " + email + " " + phone + " " + userComment);
                String adminReply = "";

                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String commentDate = sdf1.format(new Date());
                String replyDate = "";
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String addedDate = sdf.format(new Date());
                Chat c = new Chat();
                c.setUserType(userType);
                c.setName(name);
                c.setEmail(email);
                c.setPhone(phone);
                c.setYourComment(userComment);
                c.setCommentDate(commentDate);
                c.setAdminReply(adminReply);
                c.setReplyDate(replyDate);
                c.setAddedDate(addedDate);
                boolean status = ChatModel.saveChat(c);
                if (status) {
                    session.setAttribute("added", "added");
                    response.sendRedirect("contact-admin");
                } else {
                    session.setAttribute("error", "error");
                    response.sendRedirect("contact-admin");
                }

            } else if (request.getParameter("act") != null) {

                String trdata = request.getParameter("all");
                String[] data = trdata.split(",");
                for (int i = 0; i < data.length; i++) {
                    System.out.println(data[i] + " ");
                }
                int id = Integer.parseInt(data[0]);
                String userType = data[1];
                String name = data[2];
                String email = data[3];
                String phone = data[4];
                String userComment = data[5];
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String commentDate = data[6];
                String adminReply = data[7];
                System.out.println("Comment Date: " + commentDate);
                String replyDate = sdf1.format(new Date());
                System.out.println("reply Date: " + replyDate);
                //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                //String addedDate = sdf.format(new Date());
                System.out.println(id + " " + userType + " " + name + " " + email + " " + adminReply + " " + phone);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql1 = "UPDATE Chat SET userType='" + userType + "',name='" + name + "',email='" + email + "',phone='" + phone + "',userComment='" + userComment + "',commentDate='" + commentDate + "',adminReply='" + adminReply + "',replyDate='" + replyDate + "' WHERE id=" + id + "";
                Query query = s.createQuery(hql1);
                int result = query.executeUpdate();
                s.getTransaction().commit();
                System.out.println("Rows affected: " + result);
                if (result > 0) {
                    out.print("updated");
                }
            }
        } catch (IOException | NumberFormatException | HibernateException e) {
            out.print(e);
        }
    }

}
