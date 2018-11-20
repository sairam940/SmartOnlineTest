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
        <title>View Question</title>
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

        <table id="table_items" class="table table-striped table-bordered" >
            <thead>
                <tr>
                                <th>Sr. No.</th>
<!--                                <th>ID</th>-->
                                <th>FIRST NAME</th>
                                <th>LAST NAME</th>
                                <th>EMAIL</th>
                </tr>
            </thead>
        <%
            String email = (String) session.getAttribute("femail");
            if (email != null) {
                try {
                    int count = 0;
                    ArrayList<Student> al = StudentModel.getStudent();
                    Iterator itr = al.iterator();
                    if (itr.hasNext()) {
                        while (itr.hasNext()) {
                            Student q=(Student)itr.next();
                            count++;
        %>

        <tbody>
            <tr> 
                                <td><%=count%></td>
<!--                                <td><%=q.getId()%></td>-->
                                <td><%=q.getFname()%></td>
                                <td><%=q.getLname()%></td>
                                <td><%=q.getEmail()%></td>
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
