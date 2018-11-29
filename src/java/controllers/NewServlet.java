/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Question;
import entities.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.QuestionModel;
import org.hibernate.HibernateException;

@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    PrintWriter out = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            out = response.getWriter();
            if (request.getParameter("ac") != null) {
                System.out.println("Debug: =================================");
                System.out.println("Debug: In QuestionController: Question Number Printing.");
                int sid = Integer.parseInt(request.getParameter("sid"));
                String set = request.getParameter("set");
                String level = request.getParameter("level");
                ArrayList<Question> list2 = QuestionModel.getQuestionNo(sid, set, level);
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
            System.out.println(er);
        }
        if (request.getParameter("action") != null) {
            System.out.println("Debug: =================================");
            System.out.println("Debug: In QuestionController: Question Save Request Came.");
            String subject = request.getParameter("subject");
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
            HttpSession session = request.getSession(false);
            String facultyName = (String) session.getAttribute("femail");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String added_date = sdf.format(new Date());
            System.out.println(facultyName + " " + subject + " " + sid + " " + q_set + " " + level + " " + ques_no + " " + question + " " + op1 + " " + op2 + " " + op3 + " " + op4 + " " + answer);
            Subject s = new Subject();
            //s.setId(Integer.parseInt(sid));
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
            q.setFacultyEmail(facultyName);
            q.setAddedDate(added_date);
            q.setUpdatedDate(added_date);
            boolean status = QuestionModel.addQuestion(q);
            if (status) {
                System.out.println("Debug: In QuestionController: Question Saved.");
                out.println("ok");
            } else {
                System.out.println("Debug: In QuestionController: Error Occured While Saving Question.");
                out.println("failed");
            }
        }

    }

}
