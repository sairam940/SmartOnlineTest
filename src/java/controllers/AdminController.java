package controllers;

import entities.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.AdminModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    PrintWriter out = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            long count = AdminModel.ExistAdmin();

            if (request.getParameter("action") != null) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String msg = "";

                Admin a = new Admin();

                a.setName(name);
                a.setEmail(email);
                a.setPassword(password);

                if (count == 0) {
                    boolean b = AdminModel.addAdmin(a);
                    out.println("ok");
                } else {
                    out.println("exist");
                }

            }
            if (request.getParameter("login") != null) {

                String aemail = request.getParameter("email");
                String apassword = request.getParameter("password");
                boolean adminFound = AdminModel.validateAdmin(aemail, apassword);
                if (adminFound) {
                    HttpSession s = request.getSession();
                    s.setAttribute("user_email", aemail);
                    HttpSession s1 = request.getSession();
                    s1.setAttribute("user_name", "admin");
                    response.sendRedirect("home");
                } else {
                    HttpSession s = request.getSession();
                    s.setAttribute("error", "error");
                    response.sendRedirect("home");
                }

            }
            if (request.getParameter("ac") != null) {
                String email = request.getParameter("email");
                String opass = request.getParameter("opass");
                String pass = request.getParameter("pass");
                //out.print(email+""+opass+""+pass);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql = "UPDATE Admin SET password='" + pass + "' WHERE email='" + email + "' and password='" + opass + "'";
                Query query = s.createQuery(hql);

                int result = query.executeUpdate();
                s.getTransaction().commit();
                //System.out.println("Rows affected: " + result);
                if (result > 0) {
                    out.print("ok");
                }

            }

        } catch (HibernateException er) {
            out.print(er);
        }

    }

}
