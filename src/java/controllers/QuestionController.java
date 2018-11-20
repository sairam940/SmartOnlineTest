package controllers;

import entities.Question;
import entities.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.QuestionModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

@WebServlet(name = "QuestionController", urlPatterns = {"/QuestionController"})
public class QuestionController extends HttpServlet {

    PrintWriter out = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            out = response.getWriter();
            if (request.getParameter("action") != null) {
                String subject = request.getParameter("subject");
                //System.out.println("subject" + subject);
                Question q = new Question();
                String sid = request.getParameter("sid");
                String question = request.getParameter("question");
                String op1 = request.getParameter("op1");
                String op2 = request.getParameter("op2");
                String op3 = request.getParameter("op3");
                String op4 = request.getParameter("op4");
                String answer = request.getParameter("answer");
                String q_set = request.getParameter("q_set");
                String level = request.getParameter("level");
                String ques_no = request.getParameter("ques_no");
                String facultyName = request.getParameter("facultyName");
                String msg = "";

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String added_date = sdf.format(new Date());
                System.out.println(facultyName + " " + subject + " " + sid + " " + q_set + " " + level + " " + ques_no + " " + question + " " + op1 + " " + op2 + " " + op3 + " " + op4 + " " + answer);
                Subject s = new Subject();
                s.setId(Integer.parseInt(sid));
                q.setSubId(Integer.parseInt(sid));
                q.setQuesNumber(Integer.parseInt(ques_no));
                q.setSubName(subject);
                q.setQuestion(question);
                q.setOption1(op1);
                q.setOption2(op2);
                q.setOption3(op3);
                q.setOption4(op4);
                q.setQuesSet(q_set);
                q.setAnswer(answer);
                q.setQuesLevel(level);
                q.setFacultyName(facultyName);
                q.setAddedDate(added_date);
                q.setUpdatedDate(added_date);
                boolean status = QuestionModel.addQuestion(q);

                if (status) {
                    out.println("ok");
                } else {
                    out.println("failed");
                }
            }
            if (request.getParameter("act") != null) {
                System.out.println("in update");
                String trdata = request.getParameter("all");
                String[] sp = trdata.split(",");
                ArrayList value = new ArrayList();
                System.out.println("length: " + sp.length
                );
                value.addAll(Arrays.asList(sp));
                System.out.println("values are: " + value.addAll(Arrays.asList(sp)));
                for (int i = 0; i < 1; i++) {

                    Session s = HibernateUtil.getSessionFactory().openSession();
                    s.beginTransaction();
                    String hql = "UPDATE Question SET question='" + value.get(i + 1) + "',option1='" + value.get(i + 2) + "',option2='" + value.get(i + 3) + "',option3='" + value.get(i + 4) + "',option4='" + value.get(i + 5) + "',ques_set='" + value.get(i + 6) + "',answer='" + value.get(i + 7) + "',ques_level='" + value.get(i + 8) + "',updated_date='" + value.get(i + 9) + "' WHERE id=" + value.get(0) + "";
                    Query query = s.createQuery(hql);

                    int result = query.executeUpdate();
                    s.getTransaction().commit();
                    System.out.println("Rows affected: " + result);
                    if (result > 0) {
                        //HttpSession session = request.getSession();
                        //session.setAttribute("updated", "updated");
                        out.print("updated");
                        //response.sendRedirect("update-question");
                    }
                }
            }
            if (request.getParameter("ac") != null) {
                String subject = request.getParameter("subject");
                String set = request.getParameter("set");
                String level = request.getParameter("level");
                //out.print("in controller"+"subject"+subject+"set"+set+"level"+level);
                ArrayList<Question> list2 = QuestionModel.getQuestionNo(subject, set, level);

                Iterator itr = list2.iterator();

                if (itr.hasNext()) {
                    Question q = (Question) itr.next();
                    int qno = q.getQuesNumber();
                    out.print(qno + 1);
                } else {
                    int qno = 0;
                    out.print(qno + 1);
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
            System.out.println("in get()");
            if (request.getParameter("actio") != null) {

                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println("in delete " + id);
                Session s = HibernateUtil.getSessionFactory().openSession();
                s.beginTransaction();
                String hql = "DELETE FROM Question where id=:id";
                Query query = s.createQuery(hql);
                query.setParameter("id", id);
                int result = query.executeUpdate();
                s.getTransaction().commit();
                //System.out.println("Rows affected: " + result);

                if (result > 0) {
                    HttpSession ses = request.getSession();
                    ses.setAttribute("deleted", "deleted");
                    response.sendRedirect("update-question");
                }
            }

        } catch (IOException | NumberFormatException | HibernateException er) {
            out.println(er);
        }
    }
}
