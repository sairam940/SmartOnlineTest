package models;

import entities.Question;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class QuestionModel {

    public static ArrayList<Question> questionList(String sub_name, String ques_set, String quesLevel) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Question q where q.subName='" + sub_name + "' and q.quesSet='" + ques_set + "' and quesLevel='" + quesLevel + "' ORDER BY rand()";
        Query query = (Query) session.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(10);
        ArrayList<Question> al = (ArrayList<Question>) query.list();
        al.toString();
        tx.commit();
        session.close();
        return al;
    }
//    public static ArrayList<Question> questionList(String sub_name, int ques_number, String ques_set, String quesLevel) {
//        Session session = HibernateUtil.getSessionFactory().openSession();
//        Transaction tx = session.beginTransaction();
//        String hql = "from Question q where q.subName='" + sub_name + "' and q.quesNumber=" + ques_number + " and q.quesSet='" + ques_set + "' and quesLevel='" + quesLevel + "'";
//        Query query = (Query) session.createQuery(hql);
//        ArrayList<Question> al = (ArrayList<Question>) query.list();
//        query.setFirstResult(0);
//        query.setMaxResults(10);
//        al.toString();
//        tx.commit();
//        session.close();
//        return al;
//    }

    public static ArrayList<Question> fetchAnswers(String sub_name, String quesSet, String quesLevel) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Question q where q.subName='" + sub_name + "' and q.quesSet='" + quesSet + "' and q.quesLevel='" + quesLevel + "'";
        Query query = (Query) session.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(10);
        ArrayList<Question> al = (ArrayList<Question>) query.list();
        al.toString();
        tx.commit();
        session.close();
        return al;
    }

    public static ArrayList<Question> questionLevel(String sub_name) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("from Question q WHERE q.subName='" + sub_name + "' group by q.quesLevel");
        ArrayList<Question> al = (ArrayList<Question>) query.list();
        al.toString();
        tx.commit();
        session.close();
        return al;
    }

    public static boolean addQuestion(Question a) {
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            s.save(a);
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        }
        return true;
    }

    public static ArrayList<Question> getQuestion() {
        ArrayList<Question> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Question>) s.createQuery("from Question").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }

    public static ArrayList<Question> getQuestionBySubName(String subName) {
        ArrayList<Question> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Question>) s.createQuery("from Question q where q.subName='" + subName + "'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }

    public static ArrayList<Question> getQuestionByFacultyName(String facultyName) {
        ArrayList<Question> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Question>) s.createQuery("from Question q where q.facultyName='" + facultyName + "'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }

    public static ArrayList<Question> getQuestionNo(String sub_name, String set, String level) {
        System.out.print("in dao" + sub_name + "" + set + "" + level);
        ArrayList<Question> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            Query q = (Query) s.createQuery("from Question where sub_name='" + sub_name + "' and ques_set='" + set + "' and ques_level='" + level + "' order by ques_number desc");
            list = (ArrayList<Question>) q.list();
            q.setFirstResult(0);
            q.setMaxResults(1);
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }
}
