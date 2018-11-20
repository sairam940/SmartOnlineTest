package models;

import entities.Admin;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

public class AdminModel {

    public static boolean addAdmin(Admin a) {

        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            s.save(a);
            s.getTransaction().commit();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }

        return true;
    }

    public static Long ExistAdmin() {
        Long row = 0l;
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hql = "select count(*) from Admin";

            org.hibernate.Query query = session.createQuery(hql);

            for (Iterator it = query.iterate(); it.hasNext();) {
                row = (Long) it.next();
                System.out.print("count: " + row);
            }
            session.getTransaction().commit();

        } catch (HibernateException er) {
            System.out.println(er);
        } finally {

        }
        return row;
    }

    public static boolean validateAdmin(String email, String password) {
        System.out.println("In Check login");
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;
        //Query using Hibernate Query Language
        String hql = "from Admin as a where a.email=? and a.password=?";
        Query query = session.createQuery(hql);
        query.setParameter(0, email);
        query.setParameter(1, password);
        List list = query.list();
        if ((list != null) && (list.size() > 0)) {
            userFound = true;
        }
        return userFound;
    }

    public static ArrayList<Admin> getProfile() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Admin as s";
        //Query query = (Query) session.createQuery(hql);
        ArrayList<Admin> list = (ArrayList<Admin>) session.createQuery(hql).list();
        list.toString();
        session.getTransaction().commit();
        session.close();
        return list;
    }

    public static ArrayList<Admin> getPassword(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "from Admin where email='" + email + "'";
        //Query query = (Query) session.createQuery(hql);
        ArrayList<Admin> list = (ArrayList<Admin>) session.createQuery(hql).list();
        list.toString();

        session.getTransaction().commit();
        session.close();
        return list;
    }

}
