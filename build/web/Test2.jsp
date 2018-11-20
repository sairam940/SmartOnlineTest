<%@page import="java.util.Iterator"%>
<%@page import="models.QuestionModel"%>
<%@page import="entities.Question"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="SHeader.jsp"></jsp:include>
            <style>
                ul.test {
                    list-style-type: none;
                    margin: 0;
                    padding: 0;
                    overflow: hidden;
                }

                ul.test li {
                    float: left;
                    padding: 15px;
                    font-size: 20px;
                }
                hr{
                    background-color: black;
                    font-weight: bold;
                    color:black;
                }
            </style>
            <script type="text/javascript">
                var timer = 600;//1 minute timer
                var min = 0;
                var sec = 0;
                function startTimer() {
                    min = parseInt(timer / 60);
                    sec = parseInt(timer % 60);

                    if (timer < 1) {
                        window.location = "exam";
                    }

                    document.getElementById("time").innerHTML = min.toString() + ":" + sec.toString();
                    timer--;
                    setTimeout(function() {
                        startTimer();
                    }, 1000);
                }
            </script>
        </head>
        <body class="login" onload="startTimer();">
        <%
            String email = (String) session.getAttribute("email");
            if (email != null) {
                String fees = (String) session.getAttribute("fees");
                String sub_name = (String) session.getAttribute("sub_name");
                String total_time = (String) session.getAttribute("total_time");
                Integer total_question = Integer.parseInt(session.getAttribute("total_question").toString());
                String ques_set = (String) session.getAttribute("ques_set");
                String quesLevel = request.getParameter("ques_level");
                session.setAttribute("ques_level", quesLevel);
        %>
        <div class="container">
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <ul class="test">
                    <li>Test name:&nbsp;<b><%=sub_name%></b></li>
                    <li>Available time:&nbsp;<b><%=total_time%> minutes</b></li>
                    <li>No of Questions:&nbsp;<b><%=10%></b></li>
                    <li>Question Set:&nbsp;<b><%=ques_set%></b></li>
                    <li>Time Left:&nbsp;<b>[<span id="time" ></span></b>]</li>
                </ul>
            </div><hr>
            <form action="result" method="post">
                <fieldset>
                    <%
                        try {
                            //String quesLevel = "easy";
                            //out.println(quesLevel);
                            //out.println("num:" + total_question + "<br>");

                            if (email != null) {
                                ArrayList<Question> al1 = QuestionModel.questionList(sub_name, ques_set, quesLevel);
                                Iterator itr1 = al1.iterator();
                                int count=0;
                                 while (itr1.hasNext()) {
                                     count++;
                                    Question q = (Question) itr1.next();
                                    out.println("Q." + count + ")<b>" + q.getQuestion() + "</b>");
                                    out.println("<ol type='A'>");
                                    out.println("<li><input type='radio' name='op"+count+"' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                                    out.println("<li><input type='radio' name='op"+count+"' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                                    out.println("<li><input type='radio' name='op"+count+"' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                                    out.println("<li><input type='radio' name='op"+count+"' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                                }
                            }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                    <center>
                        <input class="btn-primary about-image" type="submit" value="Submit">
                    </center>
                </fieldset>
            </form>
        </div>
        <%
            } else {
                response.sendRedirect("index");
            }
        %>
    </body>
    <!-- page end -->
    <link href="theme/css/style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="theme/js/jquery.js"></script>
    <script src="cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- /js files -->
</html>
