<%-- 
    Document   : testing
    Created on : 28 May, 2018, 3:26:43 PM
    Author     : Dharmesh Mourya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String op1=request.getParameter("r1");
            String op2=request.getParameter("r2");
            String op3=request.getParameter("r3");
            String op4=request.getParameter("r4");
            String op5=request.getParameter("r5");
            String op6=request.getParameter("r6");
            String op7=request.getParameter("r7");
            String op8=request.getParameter("r8");
            String op9=request.getParameter("r9");
            String op10=request.getParameter("r10");
            out.println(op1+" "+op2+" "+op3+" "+op4+" "+op5+" "+op6+" "+op7+" "+op8+" "+op9+" "+op10);
        %>
    </body>
</html>
