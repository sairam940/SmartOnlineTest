package models;

import entities.Result;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class ResultModel {

    public static Result saveResult(Result rs) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(rs);
        tx.commit();
        session.close();
        return rs;
    }

    public static ArrayList<Result> studentResult(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Result as r where r.email='" + email + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Result> list = (ArrayList<Result>) query.list();
        list.toString();
        session.close();
        tx.commit();
        return list;
    }

    public static ArrayList<Result> faculty_StudentResult(String facultyEmail, String subName) {
        System.out.println("email and subject: " + facultyEmail + "  " + subName);
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Result r where r.facultyEmail='" + facultyEmail + "' and subName='" + subName + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Result> list = (ArrayList<Result>) query.list();
        list.toString();
        session.close();
        tx.commit();
        return list;
    }

    public static List<Result> getResult1() {
        List<Result> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx1 = s.beginTransaction();
            Query query = (Query) s.createQuery("from Result r group by r.subName order by id desc");
            query.setFirstResult(0);
            query.setMaxResults(5);
            list = query.list();
            tx1.commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        }

        return list;
    }

    public static List<Result> getResult() {
        List<Result> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx1 = s.beginTransaction();
            Query query = (Query) s.createQuery("from Result order by id desc");
            query.setFirstResult(0);
            query.setMaxResults(5);
            list = query.list();
            tx1.commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        }

        return list;
    }

    public static ArrayList<Result> getAllResult() {

        ArrayList<Result> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Result>) s.createQuery("from Result").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static ArrayList<Result> getPassCount() {

        ArrayList<Result> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Result>) s.createQuery("From Result r where r.remarks='pass'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static ArrayList<Result> getFailCount() {
        ArrayList<Result> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Result>) s.createQuery("From Result r where r.remarks='fail'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static ArrayList<Result> getFailCountBySubjectName(String subName) {
        System.out.println("subject===" + subName);
        ArrayList<Result> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Result>) s.createQuery("From Result r where r.remarks='Fail' and r.subName='" + subName + "'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static ArrayList<Result> getPassCountBySubjectName(String subName) {
        System.out.println("subject===" + subName);
        ArrayList<Result> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Result>) s.createQuery("From Result r where r.remarks='Pass' and subName='" + subName + "'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static ArrayList getResultBySubjectName(String email, String subName) {
        ArrayList list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Result>) s.createQuery("From Result r where r.email='" + email + "' and subName='" + subName + "'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;

    }

    public static List<Result> studentScores() {
        List list = null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.beginTransaction();
        String hql = "from Result r group by r.subName ORDER BY r.marksObtained";
        Query query = s.createQuery(hql);
        query.setFirstResult(0);
        query.setMaxResults(5);
        list = (ArrayList<Result>) query.list();
        return list;
    }

    public static List<Result> studentHightstScores(String subName) {
        List list = null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.beginTransaction();
        String hql = "select r.marksObtained FROM Result r where r.subName=:subName";
        Query query = s.createQuery(hql);
        query.setParameter("subName", subName);
        query.setFirstResult(0);
        query.setMaxResults(5);
        list = (ArrayList<Result>) query.list();
        return list;
    }
}
