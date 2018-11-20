<%@page import="models.StudentModel"%>
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
        <meta http-equiv="refresh" content="600;url=time-over" />
        <title>Exam</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- page end -->
        <link href="theme/css/style.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="theme/js/jquery.js"></script>
        <script src="cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/backNoWork.js" type="text/javascript"></script>
        <!-- /js files -->

        <script type="text/javascript">
            document.onkeydown = function() {
                switch (event.keyCode) {
                    case 116 : //F5 button
                        event.returnValue = "";
                        event.keyCode = 0;
                        return "";
                    case 82 : //R button
                        if (event.ctrlKey) {
                            event.returnValue = "";
                            event.keyCode = 0;
                            return "";
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
            var timer = 600;//10 minute timer
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
            String email=null,sub_name=null,ques_set=null,quesLevel=null;
            email = (String) session.getAttribute("email");
            if (email != null) {
                sub_name = (String) session.getAttribute("sub_name");
                boolean status = StudentModel.testCount(email, sub_name);
                if (!status) {
                    HttpSession sessions = request.getSession(false);
                    String total_time = (String) sessions.getAttribute("total_time");
                    //int total_time = (Integer) session.getAttribute("total_time");
                    int totalMarks = (Integer) sessions.getAttribute("total_marks");
                    int totalQuestion = (Integer) sessions.getAttribute("total_question");
                    ques_set = (String) session.getAttribute("ques_set");
                    quesLevel = (String) session.getAttribute("quesLevel");
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
            <form action="result" id="myForm" method="post">
                <fieldset>
                    <%
                        try {
                            session.removeAttribute("questionList");
                            session.removeAttribute("numberList");
                            session.removeAttribute("answerList");
                            System.out.println("in try");
                            List<String> ql = new ArrayList<String>();
                            List<Integer> qnl = new ArrayList<Integer>();
                            List<String> qal = new ArrayList<String>();
                            ArrayList<Question> al1 = QuestionModel.questionList(sub_name, ques_set, quesLevel);
                            Iterator itr1 = al1.iterator();
                            int count = 0;
                            while (itr1.hasNext()) {
                                count++;
                                System.out.println("count: " + count);
                                Question q = (Question) itr1.next();
                                out.println("Q." + count + ")<b>" + q.getQuestion() + "</b>");
                                out.println("<ol type='A'>");
                                out.println("<li><input type='radio' name='op" + count + "' id='op" + count + "' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + count + "' id='op" + count + "' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + count + "' id='op" + count + "' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + count + "' id='op" + count + "' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                                ql.add(q.getQuestion());
                                qnl.add(q.getQuesNumber());
                                qal.add(q.getAnswer());
                            }
                            session.setAttribute("questionList", ql);
                            session.setAttribute("numberList", qnl);
                            session.setAttribute("answerList", qal);
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
                    response.sendRedirect("tests");
                }
            } else {
                response.sendRedirect("signin");
            }
        %>
    </body>
    <script type="text/javascript">
        $(document).ready(function() {
            var score = 0;
            var count = parseInt(score);
            $('#myForm').submit(function() {
                var isChecked1 = $('input[name=op1]:checked').val();
                var isChecked2 = $('input[name=op2]:checked').val();
                var isChecked3 = $('input[name=op3]:checked').val();
                var isChecked4 = $('input[name=op4]:checked').val();
                var isChecked5 = $('input[name=op5]:checked').val();
                var isChecked6 = $('input[name=op6]:checked').val();
                var isChecked7 = $('input[name=op7]:checked').val();
                var isChecked8 = $('input[name=op8]:checked').val();
                var isChecked9 = $('input[name=op9]:checked').val();
                var isChecked10 = $('input[name=op10]:checked').val();
                if (isChecked1 !== undefined && isChecked2 !== undefined && isChecked3 !== undefined && isChecked4 !== undefined && isChecked5 !== undefined && isChecked6 !== undefined && isChecked7 !== undefined && isChecked8 !== undefined && isChecked9 !== undefined && isChecked10 !== undefined)
                {
                    var c = confirm("Click OK to Submit.");
                    return c;
                }
                else
                {
                    if (isChecked1 === undefined && isChecked2 === undefined && isChecked3 === undefined && isChecked4 === undefined && isChecked5 === undefined && isChecked6 === undefined && isChecked7 === undefined && isChecked8 === undefined && isChecked9 === undefined && isChecked10 === undefined)
                    {
                        var c = confirm("Are you sure,you want to submit? You have not attended any question.");
                        return c;
                    }
                    else
                    {
                        if (isChecked1 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked2 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked3 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked4 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked5 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked6 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked7 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked8 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked9 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        if (isChecked10 !== undefined)
                        {
                            count = count + 1;
                        }
                        else
                        {
                            count = count + 0;
                        }
                        var c = confirm("Are you sure,you want to submit? you have attended only " + count + " question(s).");
                        return c;
                    }
                }
            });
        });
    </script>
</html>

<!--<script type="text/javascript">
           window.onbeforeunload = function() {
  return "Data will be lost if you leave the page, are you sure?";
};
            </script>-->