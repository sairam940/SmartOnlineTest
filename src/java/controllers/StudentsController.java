package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

@WebServlet(name = "StudentsController", urlPatterns = {"/StudentsController"})
public class StudentsController extends HttpServlet {

    PrintWriter out = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            if (request.getParameter("action") != null) {

                String id = request.getParameter("id");
                //out.println(id);
                int ids = Integer.parseInt(id);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql = "DELETE FROM Student where id=:id";
                Query query = s.createQuery(hql);
                query.setParameter("id", ids);
                int result = query.executeUpdate();
                s.getTransaction().commit();
                //System.out.println("Rows affected: " + result);
                if (result > 0) {
                    out.print("ok");
                }
            }
            if (request.getParameter("act") != null) {

                String trdata = request.getParameter("all");
                String[] sp = trdata.split(",");
                ArrayList value = new ArrayList();
                System.out.println(sp.length);

                for (int i = 0; i < sp.length; i++) {
                    //out.print(sp[i]);
                    value.add(sp[i]);

                }
                for (int i = 0; i < 1; i++) {

                    Session s = HibernateUtil.getSessionFactory().openSession();
                    s.beginTransaction();
                    String hql1 = "UPDATE Student SET fname='" + value.get(i + 1) + "',lname='" + value.get(i + 2) + "',email='" + value.get(i + 3) + "',dob='" + value.get(i + 4) + "',age='" + value.get(i + 5) + "',gender='" + value.get(i + 6) + "',phone='" + value.get(i + 7) + "' WHERE id=" + value.get(0) + "";
                    Query query = s.createQuery(hql1);
                    int result = query.executeUpdate();
                    s.getTransaction().commit();
                    System.out.println("Rows affected: " + result);
                    if (result > 0) {
                        out.print("updated");
                    }
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
                String hql = "DELETE FROM Student where id=:id";
                Query query = s.createQuery(hql);
                query.setParameter("id", ids);
                int result = query.executeUpdate();
                s.getTransaction().commit();
                //System.out.println("Rows affected: " + result);

                if (result > 0) {
                    HttpSession ses = request.getSession();
                    ses.setAttribute("deleted", "deleted");
                    response.sendRedirect("student_view");
                }
            }

        } catch (IOException | NumberFormatException | HibernateException er) {
            out.println(er);
        }
    }

}
