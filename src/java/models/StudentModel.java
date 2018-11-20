package models;

import entities.Result;
import entities.Student;
import java.util.ArrayList;
import java.util.Iterator;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class StudentModel {

    public static Student saveStudent(Student st) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        boolean student = false;
        if (st != null) {
            try {
                session.save(st);
                student = true;
                tx.commit();
            } catch (Exception e) {
                session.close();
                tx.rollback();
                System.err.print(e);
            }
        }
        return st;
    }

    public static ArrayList<Student> validateStudent(String email, String pass) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Student as s where s.email='" + email + "' and s.pass='" + pass + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Student> list = (ArrayList<Student>) query.list();
        return list;
    }

    public static ArrayList<Student> findPassword(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("in Dao: " + email);
        String hql = "from Student as s where s.email='" + email + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Student> list = (ArrayList<Student>) query.list();
        list.toString();
        session.close();
        tx.commit();
        return list;
    }

    public static ArrayList<Student> getProfile(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Student as s where s.email='" + email + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Student> list = (ArrayList<Student>) query.list();
        list.toString();
        session.close();
        tx.commit();
        return list;
    }

    public static ArrayList<Student> getStudent() {

        ArrayList<Student> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Student>) s.createQuery("from Student").list();
            list.toString();
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return list;
    }

    public static ArrayList<Student> getStudentById(int id) {
        ArrayList<Student> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Student>) s.createQuery("from Student where id=" + id + "").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        }

        return list;
    }

    public static boolean getStudentCount(String email, String phone) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Student s where s.email='" + email + "' or s.phone='" + phone + "'";
        org.hibernate.Query query = session.createQuery(hql);
        boolean status = false;
        Iterator itr = query.iterate();
        if (itr.hasNext()) {
            status = true;
            System.out.print("count: " + status);
        }
        session.getTransaction().commit();
        session.close();
        return status;
    }

    public static ArrayList<Result> getStudentResult() {

        ArrayList<Result> lis = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            lis = (ArrayList<Result>) s.createQuery("from Result").list();
            lis.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return lis;
    }

    public static boolean testCount(String email, String sub_name) {
        boolean status = false;
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Result r where r.email='" + email + "' and r.subName='" + sub_name + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Student> list = (ArrayList<Student>) query.list();
        if (list != null && !list.isEmpty()) {
            status = true;
        }
        session.close();
        tx.commit();
        return status;
    }

    public static Long isStudentExist(String email) {
        Long row = 0l;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            org.hibernate.Query query = s.createQuery("select count(*) from Student where email='" + email + "'");
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

    public static Long studentCount() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "select count(*) from Student";
        org.hibernate.Query query = session.createQuery(hql);
        Long count = (Long) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        return count;
    }
}
