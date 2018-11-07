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
    <script>
        $(document).ready(function() {
            $('#myTable').dataTable();
        });
    </script>
    <style>
        tr,td,th{
            text-align: center;
        }
    </style>
</head>
<body class="login">
    <jsp:include page="Fheader.jsp"></jsp:include>
    <table class="table table-bordered table-striped table-hover dataTable js-exportable" id="myTable" >
            <thead>
                <tr>
                                <th>Sr. No.</th>
                                <th>QUESTION ID</th>
                                <th>SUBJECT NAME</th>
                                <th>QUESTION NUMBER</th>
                                <th>QUESTION LEVEL</th>
                                <th>QUESTION SET</th>
                                <th>QUESTION</th>
                                <th>OPTION 1</th>
                                <th>OPTION 2</th>
                                <th>OPTION 3</th>
                                <th>OPTION 4</th>
                                <th>ANSWER</th>
                                <th>Added DATE</th>
                </tr>
            </thead>
        <%
            String email = (String) session.getAttribute("femail");
            String subName=request.getParameter("subName");
            if (email != null) {
                try {
                    int count = 0;
                    ArrayList<Question> al = QuestionModel.getQuestionBySubName(subName);
                    Iterator itr = al.iterator();
                    if (itr.hasNext()) {
                        while (itr.hasNext()) {
                            Question q=(Question)itr.next();
                            count++;
        %>

        <tbody>
            <tr>
                <td><%=count%></td><td><%=q.getQuesNumber()%></td><td><%=q.getSubId()%><td><%=q.getSubName()%></td><td><%=q.getQuesSet()%></td><td><%=q.getQuesLevel()%></td><td><%=q.getQuestion()%></td><td><%=q.getOption1()%>
                </td><td><%=q.getOption2()%></td><td><%=q.getOption3()%></td><td><%=q.getOption4()%></td><td><%=q.getAnswer()%></td><td><%=q.getAddedDate()%></td>
            </tr>
            <%
                }
            } else {
            %>
        <center><h1>No Question Found.</h1></center>
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
