<%-- 
    Document   : ex
    Created on : 28 May, 2018, 3:15:18 PM
    Author     : Dharmesh Mourya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DB.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="testing.jsp" method="post">
        <%
            int count=0;
            Connection con=DB.getConnection();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from question where ques_set='A' and ques_level='easy' and sub_name='java' order by id limit 10");
            while(rs.next()){
                count++;
                out.println("Q." + count + ")<b>" + rs.getString(5) + "</b>");
                                out.println("<ol type='A'>");
                                out.println("<li><input type='radio' name='r" + count + "' value='" + rs.getString(6) + "' />" + rs.getString(6) + "<br><br></li>");
                                out.println("<li><input type='radio' name='r" + count + "' value='" + rs.getString(7) + "' />" + rs.getString(7) + "<br><br></li>");
                                out.println("<li><input type='radio' name='r" + count + "' value='" + rs.getString(8) + "'  />" + rs.getString(8) + "<br><br></li>");
                                out.println("<li><input type='radio' name='r" + count + "' value='" + rs.getString(9) + "'  />" + rs.getString(9) + "<br><br></li></ol><hr>");
            }
        %>
        <center><input type="submit" value="Submit"></center>
    </form>
    </body>
</html>
