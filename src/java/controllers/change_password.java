package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

@WebServlet(name = "change_password", urlPatterns = {"/change_password"})
public class change_password extends HttpServlet {

    PrintWriter out = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String hql = null;
        try {
            out = response.getWriter();
            String old = request.getParameter("old");
            String npass = request.getParameter("npass");
            String cpass = request.getParameter("cpass");
            //String sname=request.getParameter("sname");
            System.out.println(old + "" + npass + "" + cpass);
            HttpSession s2 = request.getSession();
            String email = (String) s2.getAttribute("email");
            String femail = (String) s2.getAttribute("femail");
            System.out.println("email: " + email);
            System.out.println("femail: " + femail);
            if (npass.equalsIgnoreCase(cpass)) {
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                if (email != null) {
                    hql = "UPDATE Student SET pass='" + npass + "',cpass='" + npass + "' WHERE pass='" + old + "' and email='" + email + "'";
                } else {
                    hql = "UPDATE Faculty SET pass='" + npass + "',cpass='" + npass + "' WHERE pass='" + old + "' and email='" + femail + "'";
                }
                Query query = s.createQuery(hql);

                int result = query.executeUpdate();
                s.getTransaction().commit();
                //System.out.println("Rows affected: " + result);
                if (result > 0) {
                    HttpSession s1 = request.getSession();
                    s1.setAttribute("change", "change");
                    if (email != null) {
                        response.sendRedirect("changepass.jsp");
                    } else {
                        response.sendRedirect("faculty-changepassword.jsp");
                    }

                    // out.println("password updated");
                } else {
                    HttpSession s1 = request.getSession();
                    s1.setAttribute("old", "old");
                    if (email != null) {
                        response.sendRedirect("changepass.jsp");
                    } else {
                        response.sendRedirect("faculty-changepassword.jsp");
                    }
                    // out.println("Not match");
                }

            } else {

                HttpSession s1 = request.getSession();
                s1.setAttribute("old", "old");
                if (email != null) {
                    response.sendRedirect("changepass.jsp");
                } else {
                    response.sendRedirect("faculty-changepassword.jsp");
                }
                //out.println("Old pass Not match");
            }

        } catch (IOException | HibernateException er) {
            out.println(er);
        }
    }

}
