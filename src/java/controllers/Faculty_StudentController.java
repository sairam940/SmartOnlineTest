package controllers;

import entities.Faculty_Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Faculty_StudentModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

@WebServlet(name = "Faculty_StudentController", urlPatterns = {"/Faculty_StudentController"})
public class Faculty_StudentController extends HttpServlet {

    PrintWriter out = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();
        try {
            String timeDuration = (String) session.getAttribute("timeDuration");
            int totalQuestion = (Integer) session.getAttribute("totalQuestion");
            int totalMarks = (Integer) session.getAttribute("totalMarks");
            String facultyName = request.getParameter("name");
            String facultyEmail = request.getParameter("femail");
            String email = request.getParameter("email");
            System.out.println("email=" + email);
            String name[] = email.split(",");
            String studentEmail = name[0];
            String studentName = name[1];
            String subject = request.getParameter("subject");
            Long count = Faculty_StudentModel.studentCount(facultyEmail, studentEmail, subject);
            if (count > 0) {
                session.setAttribute("exist", "exist");
                response.sendRedirect("faculty-student");
            } else {
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String addedDate = dateFormat.format(new Date());
                Faculty_Student fc = new Faculty_Student();
                fc.setFacultyEmail(facultyEmail);
                fc.setFacultyName(facultyName);
                fc.setStudentEmail(studentEmail);
                fc.setStudentName(studentName);
                fc.setSubject(subject);
                fc.setTotalQuestion(totalQuestion);
                fc.setTimeDuration(timeDuration);
                fc.setTotalMarks(totalMarks);
                fc.setAddedDate(addedDate);
                boolean status = Faculty_StudentModel.saveFaculty_Student(fc);
                if (status) {
                    session.setAttribute("success", "success");
                    response.sendRedirect("faculty-student");
                } else {
                    session.setAttribute("error", "error");
                    response.sendRedirect("faculty-student");
                }
            }
        } catch (IOException e) {
            out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();
        try {
            if (request.getParameter("actio") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println("in delete " + id);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql = "DELETE FROM Faculty_Student where id=:id";
                Query query = s.createQuery(hql);
                query.setParameter("id", id);
                int result = query.executeUpdate();
                s.getTransaction().commit();
                //System.out.println("Rows affected: " + result);

                if (result > 0) {
                    HttpSession ses = request.getSession();
                    ses.setAttribute("deleted", "deleted");
                    response.sendRedirect("faculty-students");
                }
            }

        } catch (IOException | NumberFormatException | HibernateException e) {
            out.println(e);
        }
    }
}
