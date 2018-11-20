<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Faculty_StudentModel"%>
<%@page import="java.util.List"%>
<%@page import="models.ResultModel"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Result"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.QuestionModel"%>
<%@page import="entities.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.UUID"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Time-Over</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="header.jsp"></jsp:include>
        <!-- javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/backNoWork.js" type="text/javascript"></script>
        </head>
        <body class="login">
            <%
            HttpSession sessions=request.getSession(false);
            String subName = (String) sessions.getAttribute("sub_name");
            System.out.println("subName "+subName);
            String totalDuration = (String) sessions.getAttribute("total_time");
            int totalMarks=(Integer)sessions.getAttribute("total_marks");
            int totalQuestion=(Integer)sessions.getAttribute("total_question");
            String quesLevel = (String) sessions.getAttribute("quesLevel");
            String quesSet = (String) sessions.getAttribute("ques_set");
            String email = (String) sessions.getAttribute("email");
            String sname = (String) sessions.getAttribute("sname");
            String facultyEmail=Faculty_StudentModel.getFacultyEmail(subName);
            System.out.println("facultyEmail: "+facultyEmail);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String addedDate = sdf.format(new Date());
            String updatedDate = addedDate;
            
            try {
                Result rs = new Result();
                rs.setEmail(email);
                rs.setSname(sname);
                rs.setSubName(subName);
                rs.setFacultyEmail(facultyEmail);
                rs.setQuesLevel(quesLevel);
                rs.setAddedDate(addedDate);
                rs.setPercentage(0);
                rs.setQuesLevel(quesLevel);
                rs.setQuesSet(quesSet);
                rs.setQuestionAttended(0);
                rs.setMarksObtained(0);
                rs.setTotalDuration(totalDuration);
                rs.setTotalMarks(totalMarks);
                rs.setTotalQuestion(totalQuestion);
                rs.setRemarks("Fail");
                rs.setUpdatedDate(updatedDate);
                rs = ResultModel.saveResult(rs);
                System.out.println("inserted");
                session.removeAttribute("email");
            } catch (Exception e) {
                System.out.println(e);
            }
    %>
        <br><br><center>
                <img src="images/1.jpg" alt=""/>
            </center>
        <center><br>
            <input type="button" value="Home" class="btn-form-login" onclick="window.location.href = 'index';" >
    &nbsp;&nbsp;&nbsp;<input type="button" value="Sign in" class="btn-form-login" onclick="window.location.href = 'signin';" >
</center>
        
<br><br>
    </body>
</html>
