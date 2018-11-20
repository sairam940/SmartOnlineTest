<%@page import="java.util.Iterator"%>
<%@page import="models.ResultModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Result"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
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
        <jsp:include page="Fheader.jsp"></jsp:include><br>
    <%
        String email = (String) session.getAttribute("femail");
        String fname = (String) session.getAttribute("name");
        String subject = (String) session.getAttribute("subject");
        if (email != null) {
    %>

    <center><h4>Student Report Under Subject: <b><%=subject%></b></h4></center><br>

        <%
            try {
                int count=0;
                ArrayList<Result> al=ResultModel.faculty_StudentResult(email,subject);
                Iterator itr=al.iterator();
                if(itr.hasNext())
                {
                    %>
                    <table id="myTable" class="table table-striped table-bordered" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>Student Name</th><th>Subject Name</th><th>Total Question</th><th>Time Duration</th><th>Question Attended</th><th>Mark Obtained</th><th>Total Marks</th><th>Percentage</th><th>Question Level</th><th>Question Set</th><th>Remarks</th><th>Exam Date</th>
        </tr>
    </thead>
    <tbody>
                    <%
                for(Result r:al){
                    count++;
        %>
        <tr>
            <td><%=count%></td><td><%=r.getSname()%></td><td><%=r.getSubName()%></td><td><%=r.getTotalQuestion()%></td><td><%=r.getTotalDuration()%></td><td><%=r.getQuestionAttended()%></td><td><%=r.getMarksObtained()%></td><td><%=r.getTotalMarks()%></td><td><%=r.getPercentage()%></td><td><%=r.getQuesLevel()%></td><td><%=r.getQuesSet()%></td><td><%=r.getRemarks()%></td><td><%=r.getAddedDate()%></td>
        </tr>
        <%
                }
              }
                else{
                    %>
    <center><h1>No Report Found.</h1></center>
                    <%
                }
            }  
             catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<%            } else {
        response.sendRedirect("faculty-home");
    }
%>
</body>
</html>
