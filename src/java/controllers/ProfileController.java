package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

@WebServlet(name = "ProfileController", urlPatterns = {"/ProfileController"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class ProfileController extends HttpServlet {

    public static final String UPLOAD_DIR = "resources";
    PrintWriter out;
    HttpSession session;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession();
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            Part part = request.getPart("photo");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String age = request.getParameter("age");
            System.out.println("phone: " + phone + "gender:" + gender + "dob:" + dob + "age:" + age);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String addedDate = sdf.format(new Date());
            String semail = (String) session.getAttribute("email");
            String photo = extractFileName(part);
            System.out.println(photo);
            String path = UPLOAD_DIR + "/" + photo;
            System.out.println("photo: " + photo);
            String applicationPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            System.out.println("applicationPath: " + applicationPath);
            File fileUploadDirectory = new File(applicationPath);
            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }

            if (photo != null && !photo.equals("")) {
                System.out.println("in if");
                String savePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR + File.separator + photo;
                System.out.println("savePath: " + savePath);
                File fileSaveDir = new File(savePath);
                part.write(savePath + File.separator);
                System.out.println("fname: " + fname + "lname" + lname + "email" + email);

                Session hs = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = hs.beginTransaction();
                Query query = hs.createQuery("UPDATE Student SET fname='" + fname + "',lname='" + lname + "',email='" + email + "',photo='" + path + "',dob='" + dob + "',age='" + age + "',gender='" + gender + "',phone='" + phone + "',added_date='" + addedDate + "' WHERE email='" + semail + "'");
                int i = query.executeUpdate();

                if (i > 0) {
                    session.setAttribute("success", "Profile Updated Successfully..");
                    response.sendRedirect("profile");
                } else {
                    session.setAttribute("failure", "Oops! Something went wrong..");
                    response.sendRedirect("profile");
                }
                tx.commit();
                hs.close();
            } else {
                System.out.println("in else");
                Session hs = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = hs.beginTransaction();
                Query query = hs.createQuery("UPDATE Student SET fname='" + fname + "',lname='" + lname + "',email='" + email + "',dob='" + dob + "',age='" + age + "',gender='" + gender + "',phone='" + phone + "',added_date='" + addedDate + "' WHERE email='" + semail + "'");
                int i = query.executeUpdate();

                if (i > 0) {
                    session.setAttribute("success", "Profile Updated Successfully..");
                    response.sendRedirect("profile");
                } else {
                    session.setAttribute("failure", "Oops! Something went wrong..");
                    response.sendRedirect("profile");
                }
                tx.commit();
                hs.close();
            }

        } catch (IOException | ServletException | HibernateException e) {
            out.println(e);
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

}
