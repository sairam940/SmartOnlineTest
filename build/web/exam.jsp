<%@page import="java.util.List"%>
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
        <script src="js/backNoWork.js" type="text/javascript"></script>
        <script type="text/javascript">
            document.onkeydown = function() {    
    switch (event.keyCode) { 
        case 116 : //F5 button
            event.returnValue = false;
            event.keyCode = 0;
            return false; 
        case 82 : //R button
            if (event.ctrlKey) { 
                event.returnValue = false; 
                event.keyCode = 0;  
                return false; 
            } 
    }
};
        </script>

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
                HttpSession sessions=request.getSession(false);
                String sub_name = (String) sessions.getAttribute("sub_name");
                String total_time = (String) sessions.getAttribute("total_time");
                //int total_time = (Integer) session.getAttribute("total_time");
                int totalMarks=(Integer)sessions.getAttribute("total_marks");
                int totalQuestion=(Integer)sessions.getAttribute("total_question");
                String ques_set = request.getParameter("ques_set");
                String quesLevel = request.getParameter("quesLevel");
                sessions.setAttribute("ques_set", ques_set);
                sessions.setAttribute("ques_level", quesLevel);
                //System.out.println(ques_set+" "+quesLevel+" "+sub_name);
        %>
        <div class="container">
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <ul class="test">
                    <li>Test name:&nbsp;<b><%=sub_name%></b></li>
                    <li>Available time:&nbsp;<b><%=total_time%></b></li>
                    <li>No of Questions:&nbsp;<b><%=totalQuestion%></b></li>
                    <li>Total Marks:&nbsp;<b><%=totalMarks%></b></li>
                    <li>Question Set:&nbsp;<b><%=ques_set%></b></li>
                    <li>Time Left:&nbsp;<b>[<span id="time" ></span></b>]</li>
                </ul>
            </div>
            <form action="result" method="post">
                <fieldset>
                    <%
                        try {
                            System.out.println("in try");
                            List<String> ql=new ArrayList<String>();
                             List<Integer> qnl=new ArrayList<Integer>();
                             List<String> qal=new ArrayList<String>();
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
                                    ql.add(q.getQuestion());
                                    qnl.add(q.getQuesNumber());
                                    qal.add(q.getAnswer());
                                 }
                                 session.setAttribute("questionList",ql);
                                 session.setAttribute("numberList",qnl);
                                 session.setAttribute("answerList",qal);
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>
                    <center>
                        <input style="font-size: 20px;" class="btn-primary about-image" type="submit" value="Submit">
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
