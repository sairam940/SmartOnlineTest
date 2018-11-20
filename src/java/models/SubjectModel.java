package models;

import entities.Subject;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class SubjectModel {

    public static ArrayList<Subject> subjectList() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String query = "from Subject";
        ArrayList<Subject> al = (ArrayList<Subject>) session.createQuery(query).list();
        al.toString();
        tx.commit();
        session.close();
        return al;
    }

    public static ArrayList<Subject> getSubjectFess(String name) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String query = "from Subject s where s.name='" + name + "'";
        ArrayList<Subject> fees = (ArrayList<Subject>) session.createQuery(query).list();
        System.out.println("name: " + name);
        fees.toString();
        tx.commit();
        session.close();
        return fees;
    }

    public static boolean addSubject(Subject a) {

        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            s.save(a);
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }

        return true;
    }

    public static Long existSubject(String sub_name) {
        Long row = 0l;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            org.hibernate.Query query = s.createQuery("select count(*) from Subject where name='" + sub_name + "'");
            for (Iterator it = query.iterate(); it.hasNext();) {
                row = (Long) it.next();
                System.out.print("count: " + row);
            }
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }

        return row;
    }

    public static ArrayList<Subject> getSubject() {

        ArrayList<Subject> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Subject>) s.createQuery("from Subject").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static ArrayList<Subject> getSubjectId(String name) {

        ArrayList<Subject> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Subject>) s.createQuery("from entities.Subject where name='" + name + "'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static List<Subject> getSubjectDetail(String subName) {

        List<Subject> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Subject>) s.createQuery("from Subject where name='" + subName + "'").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static Long getSubjectCount() {
        Long row1 = 0l;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            org.hibernate.Query query = s.createQuery("select count(*) from Subject");
            for (Iterator it = query.iterate(); it.hasNext();) {
                row1 = (Long) it.next();
                System.out.print("count: " + row1);
            }
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }

        return row1;
    }

    public static String subjectAssigned(String facultyEmail) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "select s.name from Subject s where s.facultyEmail= :facultyEmail";
        Query query = session.createQuery(hql);
        query.setParameter("facultyEmail", facultyEmail);
        String name = (String) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        return name;
    }

    public static List<Subject> isFacultyExist(String facultyEmail) {
        System.out.println("facultyEmail=" + facultyEmail);
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Subject s where s.facultyEmail='" + facultyEmail + "'";
        List list = (ArrayList<Subject>) session.createQuery(hql).list();
        list.toString();
        session.getTransaction().commit();
        session.close();
        return list;
    }
}
