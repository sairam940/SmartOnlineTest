package models;

import entities.Faculty;
import entities.Result;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class FacultyModel {

    public static boolean saveFaculty(Faculty fclty) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        boolean faculty = false;
        if (fclty != null) {
            try {
                faculty = true;
                System.out.println("in fclty model");
                session.save(fclty);
                tx.commit();
                session.close();
            } catch (HibernateException e) {
                tx.rollback();
                System.err.print(e);
            }
        }
        return faculty;
    }

    public static ArrayList<Faculty> getAllFaculty() {
        ArrayList<Faculty> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Faculty>) s.createQuery("from Faculty").list();
            list.toString();
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }

    public static ArrayList<Faculty> validateFaculty(String email, String pass) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Faculty s where s.email='" + email + "' and s.pass='" + pass + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Faculty> list = (ArrayList<Faculty>) query.list();
        return list;
    }

    public static ArrayList<Faculty> findFacultyPassword(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("in Dao: " + email);
        String hql = "from Faculty s where s.email='" + email + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Faculty> list = (ArrayList<Faculty>) query.list();
        list.toString();
        session.close();
        tx.commit();
        return list;
    }

    public static ArrayList<Faculty> getFacultyProfile(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Faculty as s where s.email='" + email + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Faculty> list = (ArrayList<Faculty>) query.list();
        list.toString();
        session.close();
        tx.commit();
        return list;
    }

    public static ArrayList<Faculty> getFacultyById(int id) {
        ArrayList<Faculty> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Faculty>) s.createQuery("from Faculty where id=" + id + "").list();
            list.toString();
            s.getTransaction().commit();
            s.close();

        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }

    public static boolean getFacultyCount(String email, String phone) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Faculty f where f.email='" + email + "' or f.phone='" + phone + "'";

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

    public static Long isFacultyExist(String email) {
        Long row = 0l;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            org.hibernate.Query query = s.createQuery("select count(*) from Faculty where email='" + email + "'");
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

    public static Long facultyCount() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "select count(*) from Faculty";
        org.hibernate.Query query = session.createQuery(hql);
        Long count = (Long) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        return count;
    }

    public static List<Faculty> getFacultyName(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Faculty as s where s.email='" + email + "'";
        Query query = session.createQuery(hql);
        List<Faculty> list = (ArrayList<Faculty>) query.list();
        list.toString();
        session.close();
        tx.commit();
        return list;
    }

}
