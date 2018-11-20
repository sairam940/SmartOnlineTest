package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet(name = "UploadController", urlPatterns = {"/UploadController"})
public class UploadController extends HttpServlet {

    public static final String UPLOAD_DIR = "resources";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Part part = request.getPart("file");
            int id = Integer.parseInt(request.getParameter("uid"));
            String photo = extractFileName(part);
            out.println(photo);
            String path = UPLOAD_DIR + "/" + photo;
            System.out.println("photo: " + photo);

            System.out.println("path: " + path);
            String applicationPath = getServletContext().getRealPath("") + "/" + UPLOAD_DIR;
            System.out.println("applicationPath: " + applicationPath);
            File fileUploadDirectory = new File(applicationPath);

            if (!fileUploadDirectory.exists()) {
                fileUploadDirectory.mkdirs();
            }

            String savePath = getServletContext().getRealPath("") + "/" + UPLOAD_DIR + "/" + photo;
            File fileSaveDir = new File(savePath);
            part.write(savePath + "/");
            System.out.println("savePath: " + savePath);
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();
            String hql = "update Student set photo='" + path + "' where id=" + id + "";
            Query query = (Query) s.createQuery(hql);
            int result = query.executeUpdate();
            s.getTransaction().commit();
            s.close();

            if (result > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("updated", "updated");
                response.sendRedirect("student_view");
                //out.println("updated");
            } else {
                out.println("failed");
            }
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
