<%@page import="models.Faculty_StudentModel"%>
<%@page import="entities.Faculty_Student"%>
<%@page import="models.StudentModel"%>
<%@page import="entities.Student"%>
<%@page import="models.QuestionModel"%>
<%@page import="entities.Question"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.ResultModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Result"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Students</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/style.css">

    <style>
        tr,td,th{
            text-align: center;
        }
    </style>
</head>
<body class="login">
    <jsp:include page="Fheader.jsp"></jsp:include>
    
    <%
        String email = (String) session.getAttribute("femail");
        String fname = (String) session.getAttribute("name");
        String subject = (String) session.getAttribute("subject");
        if (email != null) {
    %>

    <center><h4>Student Under Subject: <b><%=subject%></b></h4></center><br>
        <table id="table_items" class="table table-striped table-bordered" >
            <thead>
                <tr>
                                <th>Sr. No.</th>
                                <th>STUDENT NAME</th>
                                <th>STUDENT EMAIL</th>
                </tr>
            </thead>
        <%
           
                try {
                    int count = 0;
                    ArrayList<Faculty_Student> al = Faculty_StudentModel.faculty_StudentBySubject(email);
                    if (al.size()!=0) {
                        for(Faculty_Student q:al){
                            count++;
        %>

        <tbody>
            <tr> 
                                <td><%=count%></td>
                                <td><%=q.getStudentName()%></td>
                                <td><%=q.getStudentEmail()%></td>
                                
                            </tr>
           
            <%
                }
            } else {
            %>
        <center><h1>No Student Found.</h1></center>
            <%
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            %>
    </tbody>
</table>
<%            } else {
        response.sendRedirect("faculty-login.jsp");
    }
%>
</body>
</html>
