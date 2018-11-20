package controllers;

import entities.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.AdminModel;

@WebServlet(name = "ForgotPassword", urlPatterns = {"/ForgotPassword"})
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            String email = request.getParameter("email");
            out.println(email);

            ArrayList<Admin> list = AdminModel.getPassword(email);
            String password1 = "";
            for (Admin a : list) {
                password1 = a.getPassword();
            }
            if (list.isEmpty()) {
                HttpSession s = request.getSession();
                s.setAttribute("not-match", "not-match");
                response.sendRedirect("forgot-password");
            } else {
                response.sendRedirect("ForgotPasswordSuc?password=" + password1 + "&email=" + email + "");
            }
        } catch (IOException er) {
            System.out.println(er);
        }
    }
}
