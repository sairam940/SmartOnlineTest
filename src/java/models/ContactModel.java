package models;

import entities.Contact;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class ContactModel {

    public static Contact saveContact(Contact ct) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        boolean contact = false;
        if (ct != null) {
            try {
                session.save(ct);
                contact = true;
                tx.commit();
            } catch (Exception e) {
                session.close();
                tx.rollback();
                System.err.print(e);
            }
        }
        return ct;
    }

    public static List<Contact> getContact() {
        List<Contact> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            Transaction tx1 = s.beginTransaction();
            Query query = (Query) s.createQuery("from entities.Contact order by id desc");
            list = query.list();
            tx1.commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        }

        return list;
    }
}
