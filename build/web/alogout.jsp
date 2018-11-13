<%-- 
    Document   : logout
    Created on : 31 Mar, 2018, 3:03:23 PM
    Author     : user2
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/backNoWork.js" ></script>
    </head>
    <body>
         <%
                          HttpSession s=request.getSession(false);
                          String name=(String)s.getAttribute("user_name");
                          String email=(String)s.getAttribute("user_email");
                          s.removeAttribute(name);
                          s.invalidate();
                          response.sendRedirect("login");
                        
         %>
    </body>
</html>
