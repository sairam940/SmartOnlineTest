package controllers;

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
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

@WebServlet(name = "FacultyProfile", urlPatterns = {"/FacultyProfile"})
public class FacultyProfile extends HttpServlet {

    PrintWriter out = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            out = response.getWriter();
            session = request.getSession();
            String femail = (String) session.getAttribute("femail");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String qualification = request.getParameter("qualification");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String addedDate = sdf.format(new Date());
            System.out.println(fname + " " + lname + " " + email + " " + phone + " " + qualification + " " + addedDate);
            Session hs = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = hs.beginTransaction();
            Query query = hs.createQuery("UPDATE Faculty SET fname='" + fname + "',lname='" + lname + "',email='" + email + "',qualification='" + qualification + "',phone='" + phone + "',addedDate='" + addedDate + "' WHERE email='" + femail + "'");
            int i = query.executeUpdate();
            if (i > 0) {
                session.setAttribute("success", "Profile Updated Successfully..");
                response.sendRedirect("faculty-profile");
            } else {
                session.setAttribute("failure", "Oops! Something went wrong..");
                response.sendRedirect("faculty-profile");
            }
            tx.commit();
            hs.close();
        } catch (IOException | HibernateException e) {
            System.out.println(e);
        }
    }

}
