package controllers;

import entities.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.SubjectModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

@WebServlet(name = "SubjectController", urlPatterns = {"/addSubject"})
public class SubjectController extends HttpServlet {

    PrintWriter out = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();

            if (request.getParameter("action") != null) {

                String name = request.getParameter("name");
                String faculty_email = request.getParameter("faculty_email");
                System.out.println("faculty_email=" + faculty_email);
                List<Subject> lists = SubjectModel.isFacultyExist(faculty_email);
                String total_ques = request.getParameter("total_ques");
                String total_marks = request.getParameter("total_marks");
                String total_time = request.getParameter("total_time");
                System.out.println("size=" + lists.size());
                if (!lists.isEmpty()) {
                    out.println("oops");
                    //response.sendRedirect("subject");
                    System.out.println("oops");
                } else {
                    System.out.println("in else");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String d = sdf.format(new Date());

                    //create the object of bean
                    Subject s = new Subject();

                    //set the values
                    s.setFacultyEmail(faculty_email);
                    s.setName(name);
                    s.setTotalQuestion(Integer.parseInt(total_ques));
                    s.setTimeDuration(total_time);
                    s.setTotalMarks(Integer.parseInt(total_marks));
                    s.setAddedDate(d);
                    s.setUpdatedDate(d);
                    long count = SubjectModel.existSubject(name);
                    if (count == 0) {
                        boolean b = SubjectModel.addSubject(s);
                        out.println("added");
                    } else {
                        out.println("exist");
                    }
                }

            }
            if (request.getParameter("actio") != null) {

                String id = request.getParameter("id");
                //out.println(id);
                int ids = Integer.parseInt(id);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql = "DELETE FROM Subject where id=:id";
                Query query = s.createQuery(hql);
                query.setParameter("id", ids);
                int result = query.executeUpdate();
                s.getTransaction().commit();
                //System.out.println("Rows affected: " + result);

                if (result > 0) {
                    HttpSession ses = request.getSession();
                    ses.setAttribute("deleted", "deleted");
                    response.sendRedirect("subject_view");
                }
            }
            if (request.getParameter("act") != null) {
                String all_data = request.getParameter("all");
                String[] data = all_data.split(",");
                for (int i = 0; i < data.length; i++) {
                    System.out.println(data[i] + " ");
                }
                int id = Integer.parseInt(data[0]);
                String facultyName = data[1];
                String facultyEmail = data[2];
                String name = data[3];
                int total_question = Integer.parseInt(data[4]);
                String time_duration = data[5];
                int total_marks = Integer.parseInt(data[6]);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String updated_date = sdf.format(new Date());
                System.out.println(id + " " + name + " " + total_question + " " + time_duration + " " + total_marks + " " + updated_date);
                Session s = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = s.beginTransaction();
                String hql = "UPDATE Subject SET facultyEmail='" + facultyEmail + "',name='" + name + "',totalQuestion=" + total_question + ",timeDuration='" + time_duration + "',totalMarks=" + total_marks + ",updatedDate='" + updated_date + "' WHERE id=" + id + "";
                Query query = s.createQuery(hql);
                int result = query.executeUpdate();
                System.out.println("after query");
                tx.commit();
                System.out.println("Rows affected: " + result);
                if (result > 0) {
                    System.out.println("in if");
                    out.print("updated");
                }

            }
            if (request.getParameter("ac") != null) {
                String subject = request.getParameter("subject");
                ArrayList<Subject> list = SubjectModel.getSubjectId(subject);

                for (Subject s : list) {
                    int id = s.getId();
                    out.println(id);
                }

            }
        } catch (Exception er) {
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
                int ids = Integer.parseInt(id);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql = "DELETE FROM Subject where id=:id";
                Query query = s.createQuery(hql);
                query.setParameter("id", ids);
                int result = query.executeUpdate();
                s.getTransaction().commit();
                //System.out.println("Rows affected: " + result);

                if (result > 0) {
                    HttpSession ses = request.getSession();
                    ses.setAttribute("deleted", "deleted");
                    response.sendRedirect("subject_view");
                }
            }

            if (request.getParameter("ac") != null) {
                String subject = request.getParameter("subject");
                ArrayList<Subject> list = SubjectModel.getSubjectId(subject);

                for (Subject s : list) {
                    int id = s.getId();
                    out.println(id);
                }

            }
        } catch (IOException | NumberFormatException | HibernateException er) {
            out.println(er);
        }
    }
}
