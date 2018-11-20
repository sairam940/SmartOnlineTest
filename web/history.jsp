<%@page import="models.ResultModel"%>
<%@page import="entities.Result"%>
<%@page import="java.util.List"%>
<%@page import="models.StudentModel"%>
<%@page import="entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Instructions</title>
    </head>
    <body class="login">
        <jsp:include page="SHeader.jsp"></jsp:include>
        <%!
            String email, sname, subName, quesLevel, quesSet, totalDuration, remark, added_date;
            int questionAttended, totalMarks, marksObtained, totalQuestion;
            float percentage;
        %>
        <%
            email = (String) session.getAttribute("email");
            subName = request.getParameter("subName");
            List<Result> list = ResultModel.getResultBySubjectName(email, subName);
            if (list != null || !list.isEmpty()) {
                for (Result r : list) {
                    sname = r.getSname();
                    quesLevel = r.getQuesLevel();
                    quesSet = r.getQuesSet();
                    totalQuestion = r.getTotalQuestion();
                    totalDuration = r.getTotalDuration();
                    questionAttended = r.getQuestionAttended();
                    totalMarks = r.getTotalMarks();
                    marksObtained = r.getMarksObtained();
                    percentage = r.getPercentage();
                    added_date = r.getAddedDate();
                    remark=r.getRemarks();
                }
            } else {
                response.sendRedirect("index");
            }
        %>
        <hr>
        <div class="large-8 columns">
            <div class="mid_content_section home_inner new_penal">
                <div class="container-fluid">
                    <div class="inner-block">
                        <div class="dashboard-upper">
                            <!-- flash message -->
                            <!--// flash message -->
                            <h5 style="color:red;"><center>Subject: &nbsp;<%=subName%></center></h5>
                        </div>

                        <div class="mid_content_section home_inner new_penal">
                            <div class="container-fluid">
                                <div class="inner-block"><hr>
                                    <div class="inner_heading">
                                        <h1>Student Result</h1>
                                    </div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col">Student Name</th>
                                                <td><%=sname%></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Question Level</td>
                                                <td><%=quesLevel%></td>
                                            </tr>
                                            <tr>
                                                <td>Question Set</td>
                                                <td><%=quesSet%></td>
                                            </tr>
                                            <tr>
                                                <td>Total Question</td>
                                                <td><%=totalQuestion%></td>
                                            </tr>
                                            <tr>
                                                <td>Time Duration</td>
                                                <td><%=totalDuration%></td>
                                            </tr>
                                            <tr>
                                                <td>Question Attended</td>
                                                <td><%=questionAttended%></td>
                                            </tr>
                                            <tr>
                                                <td>Marks Obtained</td>
                                                <td><%=marksObtained%></td>
                                            </tr>
                                            <tr>
                                                <td>Total Marks</td>
                                                <td><%=totalMarks%></td>
                                            </tr>
                                            <tr>
                                                <td>Percentage</td>
                                                <td><%=percentage%>%</td>
                                            </tr>
                                            <tr>
                                                <td>Remarks</td>
                                                <td><%=remark%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><br><br>
    </body>


    <jsp:include page="footer.jsp"></jsp:include>
</html>