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
        </head>
        <body onkeydown="return (event.keyCode === 154);" class="login">
        <%
            String email = (String) session.getAttribute("email");
            if (email != null) {
        %>
        <%            //String email = (String) session.getAttribute("email");
            if (email == null) {
                response.sendRedirect("index");
            }
            String fees = (String) session.getAttribute("fees");
            String sub_name = (String) session.getAttribute("sub_name");
            String total_time = (String) session.getAttribute("total_time");
            Integer total_question = Integer.parseInt(session.getAttribute("total_question").toString());
            String ques_set = (String) session.getAttribute("ques_set");
        %>
        <div class="container">
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <ul class="test">
                    <li>Test name:&nbsp;<b><%=sub_name%></b></li>
                    <li>Available time:&nbsp;<b><%=total_time%> minutes</b></li>
                    <li>No of Questions:&nbsp;<b><%=10%></b></li>
                    <li>Question Set:&nbsp;<b><%=ques_set%></b></li>
                    <li>Time Left:&nbsp;<span id="time" ></span></li>
                </ul>
            </div><hr>
            <fieldset>
                <%
                    try {
                        //String quesLevel = request.getParameter("ques_level");
                        String quesLevel = "easy";
                        if (request.getParameter("next") != null) {
                            int ques_numbers = Integer.parseInt(request.getParameter("ques_number"));
                            int ques_number = ques_numbers + 1;
                %>
                <form class='form-inline' name="form" id="form" ation='exam' method='post'>
                    <input type='hidden' value='<%=ques_number%>' name='ques_number'>
                    <%
                        if (ques_number <= 11) {
                            System.out.println(ques_number);
                            if (ques_numbers == 10) {
                                String op10 = request.getParameter("op10");
                                System.out.println("op10:" + op10);
                                session.setAttribute("op10", op10);
                            }
                            if (ques_number == 11) {
                    %>
                    <center>

                        <h2>Are you Sure, You want to finish the Test?</h2>
                        <input type="submit" class='btn-primary about-image' value="Back" name="previous" onclick="form.action = 'exam';">
                        <input type="submit" class='btn-primary about-image' value="Finish" name="next" onclick="form.action = 'result';">
                    </center>
                    <%
                    } else {
                        ArrayList<Question> al1 = QuestionModel.questionList(sub_name, ques_number, ques_set, quesLevel);
                        Iterator itr1 = al1.iterator();
                        if (itr1.hasNext()) {
                            Question q = (Question) itr1.next();
                            out.println("Q." + ques_number + ")<b>" + q.getQuestion() + "</b>");
                            out.println("<ol type='A'>");
                            out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                            out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                            out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                            out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                            if (ques_numbers == 1) {
                                String op1 = request.getParameter("op1");
                                System.out.println("op1:" + op1);
                                session.setAttribute("op1", op1);
                            }
                            if (ques_numbers == 2) {
                                System.out.println("in if 2");
                                String op2 = request.getParameter("op2");
                                System.out.println("op2:" + op2);
                                session.setAttribute("op2", op2);
                            }
                            if (ques_numbers == 3) {
                                String op3 = request.getParameter("op3");
                                System.out.println("op3:" + op3);
                                session.setAttribute("op3", op3);
                            }
                            if (ques_numbers == 4) {
                                String op4 = request.getParameter("op4");
                                System.out.println("op4:" + op4);
                                session.setAttribute("op4", op4);
                            }
                            if (ques_numbers == 5) {
                                String op5 = request.getParameter("op5");
                                System.out.println("op5:" + op5);
                                session.setAttribute("op5", op5);
                            }
                            if (ques_numbers == 6) {
                                String op6 = request.getParameter("op6");
                                System.out.println("op6:" + op6);
                                session.setAttribute("op6", op6);
                            }
                            if (ques_numbers == 7) {
                                String op7 = request.getParameter("op7");
                                System.out.println("op7:" + op7);
                                session.setAttribute("op7", op7);
                            }
                            if (ques_numbers == 8) {
                                String op8 = request.getParameter("op8");
                                System.out.println("op8:" + op8);
                                session.setAttribute("op8", op8);
                            }
                            if (ques_numbers == 9) {
                                String op9 = request.getParameter("op9");
                                System.out.println("op9:" + op9);
                                session.setAttribute("op9", op9);
                            } else {
                                System.out.println("sad..");
                            }
                        }

                    %>
                    <center>
                        <input type="submit" class='btn-primary about-image' value="Previous" name="previous" onclick="form.action = 'exam';">
                        &nbsp;&nbsp;&nbsp;<input type="submit" class='btn-primary about-image' value="Next" name="next" onclick="form.action = 'exam';">
                        </form>
                    </center>
                    <%               }
                    } else {
                        response.sendRedirect("result");
                        out.println("exam finished..");
                    %>
                    <center>
                        <form class='form-inline' name="form" id="form" ation='exam1' method='post'>
                            <input type="submit" class='btn-primary about-image' value="Finish" name="finish">
                        </form>
                    </center>
                    <%
                        }
                    } else if (request.getParameter("previous") != null) {
                        int ques_numbers = Integer.parseInt(request.getParameter("ques_number"));
                        int ques_number = ques_numbers - 1;
                        if (ques_number <= 1) {
                            System.out.println("in previous");
                            System.out.println("ques_numbers: " + ques_numbers + " ques_number: " + ques_number);
                            ArrayList<Question> al1 = QuestionModel.questionList(sub_name, ques_number, ques_set, quesLevel);
                            Iterator itr1 = al1.iterator();
                            if (itr1.hasNext()) {
                                Question q = (Question) itr1.next();
                                out.println("Q." + ques_number + ")<b>" + q.getQuestion() + "</b>");
                                out.println("<ol type='A'>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                            }
                    %>
                    <center>
                        <form class='form-inline' name="form" id="form" ation='exam' method='post'>
                            <input type='hidden' value='<%=ques_number%>' name='ques_number'>
                            &nbsp;&nbsp;&nbsp;<input type="submit" class='btn-primary about-image' value="Next" name="next" onclick="form.action = 'exam';">
                        </form>
                    </center>
                    <%
                        }
                        if (ques_number == 10) {
                            System.out.println("in previous");
                            System.out.println("ques_numbers: " + ques_numbers + " ques_number: " + ques_number);
                            ArrayList<Question> al1 = QuestionModel.questionList(sub_name, ques_number, ques_set, quesLevel);
                            Iterator itr1 = al1.iterator();
                            if (itr1.hasNext()) {
                                Question q = (Question) itr1.next();
                                out.println("Q." + ques_number + ")<b>" + q.getQuestion() + "</b>");
                                out.println("<ol type='A'>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                            }
                    %>
                    <center>
                        <form class='form-inline' name="form" id="form" ation='exam' method='post'>
                            <input type='hidden' value='<%=ques_number%>' name='ques_number'>
                            <input type="submit" class='btn-primary about-image' value="Previous" name="previous" onclick="form.action = 'exam';">
                            &nbsp;&nbsp;&nbsp;<input type="submit" class='btn-primary about-image' value="Finish"  onclick="form.action = 'exam';">
                        </form>
                    </center>
                    <%
                    } else {
                        ArrayList<Question> al1 = QuestionModel.questionList(sub_name, ques_number, ques_set, quesLevel);
                        Iterator itr1 = al1.iterator();
                        if (itr1.hasNext()) {
                            Question q = (Question) itr1.next();
                            out.println("Q." + ques_number + ")<b>" + q.getQuestion() + "</b>");
                            out.println("<ol type='A'>");
                            out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                            out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                            out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                            out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");

                        }
                    %>
                    <center>
                        <form class='form-inline' name="form" id="form" ation='exam' method='post'>
                            <input type='hidden' value='<%=ques_number%>' name='ques_number'>
                            <input type="submit" class='btn-primary about-image' value="Previous" name="previous" onclick="form.action = 'exam';">
                            &nbsp;&nbsp;&nbsp;<input type="submit" class='btn-primary about-image' value="Next" name="next" onclick="form.action = 'exam';">
                        </form>
                    </center>
                    <%
                        }
                    } else {
                    %>
                    <!--                <script>
                                        window.onbeforeunload = function() {
                                            return "Data will be lost if you leave the page, are you sure?";
                                        };
                                    </script>-->
                    <%
                        //out.println("<script>window.onbeforeunload = function() {return 'Data will be lost if you leave the page, are you sure?';};</script>");
                        int ques_number = 1;
                    %>
                    <form ation='exam' method='post'>
                        <input type='hidden' value='<%=ques_number%>' name='ques_number'>
                        <%
                            ArrayList<Question> al1 = QuestionModel.questionList(sub_name, ques_number, ques_set, quesLevel);
                            Iterator itr1 = al1.iterator();
                            if (itr1.hasNext()) {
                                Question q = (Question) itr1.next();
                                out.println("Q." + ques_number + ")<b>" + q.getQuestion() + "</b>");
                                out.println("<ol type='A'>");
                                out.println("<li><input type='radio' name='op1' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op1' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op1' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op1' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                            }
                        %>
                        <center>
                            <input class='btn-primary about-image' type='submit' name='next' value='Next'>
                            </form>
                        </center>
                        <%
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        %>
                        </fieldset>
                        </div>
                        <%} else {
                                response.sendRedirect("index");
                            }
                        %>
                        </body>
                        <!-- page end -->
                        <link href="theme/css/style.css" rel="stylesheet">
                        <!-- jQuery -->
                        <script src="theme/js/jquery.js"></script>
                        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
                        <script src="js/bootstrap.min.js"></script>
                        <!-- /js files -->
                        </html>
                        <script>
                                var minutes = 0;
                                var seconds = 0;
                                function startTimer(duration, display) {
                                    var timer = duration,
                                            minutes, seconds;
                                    setInterval(function() {
                                        minutes = parseInt(timer / 60, 10);
                                        seconds = parseInt(timer % 60, 10);

                                        minutes = minutes < 10 ? "0" + minutes : minutes;
                                        seconds = seconds < 10 ? "0" + seconds : seconds;

                                        display.textContent = minutes + ":" + seconds;

                                        setCookie("minutes", minutes.toString(), 1);
                                        setCookie("seconds", seconds.toString(), 1);

                                        if (--timer < 0) {
                                            timer = 0;
                                        }
                                    }, 1000);
                                }


                                window.onload = function() {
                                    var minutes_data = getCookie("minutes");
                                    var seconds_data = getCookie("seconds");
                                    var timer_amount = (60 * 10); //default
                                    if (!minutes_data || !seconds_data) {
                                        //no cookie found use default
                                    }
                                    else {
                                        console.log(minutes_data + " minutes_data at start");
                                        console.log(seconds_data + " seconds_data at start");
                                        console.log(parseInt(minutes_data * 60) + parseInt(seconds_data));
                                        timer_amount = parseInt(minutes_data * 60) + parseInt(seconds_data)
                                    }

                                    var fiveMinutes = timer_amount,
                                            display = document.querySelector('#time');
                                    startTimer(fiveMinutes, display); //`enter code here`
                                };

                                function setCookie(cname, cvalue, exdays) {
                                    var d = new Date();
                                    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                                    var expires = "expires=" + d.toUTCString();
                                    document.cookie = cname + "=" + cvalue + "; " + expires;
                                }

                                function getCookie(cname) {
                                    var name = cname + "=";
                                    var ca = document.cookie.split(';');
                                    for (var i = 0; i < ca.length; i++) {
                                        var c = ca[i];
                                        while (c.charAt(0) == ' ')
                                            c = c.substring(1);
                                        if (c.indexOf(name) == 0)
                                            return c.substring(name.length, c.length);
                                    }
                                    return "";
                                }

                        </script>