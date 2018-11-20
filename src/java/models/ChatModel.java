package models;

import entities.Chat;
import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class ChatModel {

    public static boolean saveChat(Chat ct) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        boolean chat = false;
        if (ct != null) {
            try {
                session.save(ct);
                chat = true;
                tx.commit();
            } catch (Exception e) {
                session.close();
                tx.rollback();
                System.err.print(e);
            }
        }
        return chat;
    }

    public static ArrayList<Chat> getChatByUserType(String userType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String query = "from Chat c where c.userType='" + userType + "'";
        ArrayList<Chat> list = (ArrayList<Chat>) session.createQuery(query).list();
        list.toString();
        tx.commit();
        session.close();
        return list;
    }

    public static ArrayList<Chat> getChatByUserEmail(String userType, String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String query = "from Chat c where c.userType='" + userType + "' and email='" + email + "'";
        ArrayList<Chat> list = (ArrayList<Chat>) session.createQuery(query).list();
        list.toString();
        tx.commit();
        session.close();
        return list;
    }
}
