package models;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import entities.Faculty_Student;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class Faculty_StudentModel {

    public static boolean saveFaculty_Student(Faculty_Student fc) {
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        boolean status = false;
        if (fc != null) {
            try {
                session.save(fc);
                status = true;
                tx.commit();
            } catch (Exception e) {
                session.close();
                tx.rollback();
                System.err.print(e);
            }
        }
        return status;
    }

    public static Long studentCount(String facultyEmail, String studentEmail, String subject) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "select count(*) from Faculty_Student s where s.facultyEmail=:facultyEmail and s.studentEmail=:studentEmail and s.subject=:subject";
        Query query = session.createQuery(hql);
        query.setParameter("facultyEmail", facultyEmail);
        query.setParameter("studentEmail", studentEmail);
        query.setParameter("subject", subject);
        Long count = (Long) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        return count;
    }

    public static ArrayList<Faculty_Student> getAllFaculty_Student() {
        ArrayList<Faculty_Student> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            list = (ArrayList<Faculty_Student>) s.createQuery("from Faculty_Student").list();
            list.toString();
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }

    public static ArrayList<Faculty_Student> faculty_StudentBySubject(String email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = "from Faculty_Student fs where fs.facultyEmail='" + email + "'";
        Query query = (Query) session.createQuery(hql);
        ArrayList<Faculty_Student> list = (ArrayList<Faculty_Student>) query.list();
        list.toString();
        session.close();
        tx.commit();
        return list;
    }

    public static List<Faculty_Student> getSubjects(String studentEmail) {
        System.out.println("email: " + studentEmail);
        List<Faculty_Student> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Faculty_Student fs where fs.studentEmail='" + studentEmail + "'");
            list = (ArrayList<Faculty_Student>) query.list();
            list.toString();
            s.getTransaction().commit();
            s.close();
        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }

    public static String getFacultyEmail(String subject) {
        System.out.println("subject: " + subject);
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        String hql = "select s.facultyEmail from Faculty_Student s where s.subject= :subject group by s.subject";
        Query query = session.createQuery(hql);
        query.setParameter("subject", subject);
        String email = (String) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        return email;
    }

    public static List getStudentCountunderSubject() {
        List<Faculty_Student> list = null;
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("select fs.subject,(fs.studentName) from Faculty_Student fs group by fs.subject");
            //SELECT subject,count(student_name) FROM `faculty_student` GROUP by subject
            query.setFirstResult(0);
            query.setMaxResults(5);
            list = (List<Faculty_Student>) query.list();
        } catch (HibernateException er) {
            System.out.println(er);
        }
        return list;
    }

}
