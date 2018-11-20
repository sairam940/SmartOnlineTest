<%@page import="java.util.Iterator"%>
<%@page import="models.QuestionModel"%>
<%@page import="entities.Question"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.java.DB"%>
<%@page import="java.sql.Connection"%>
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
        <%!
            Connection con;
            Statement st;
            ResultSet rs;
        %>
        <%
            String email = (String) session.getAttribute("email");
            String fees = (String) session.getAttribute("fees");
            String sub_name = (String) session.getAttribute("sub_name");
            String total_time = (String) session.getAttribute("total_time");
            Integer total_question = Integer.parseInt(session.getAttribute("total_question").toString());
            Random rnd = new Random();
            char set = (char) (rnd.nextInt(2) + 'A');
            String ques_set = String.valueOf(set); // most efficient
            session.setAttribute("ques_set", ques_set);
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
                            String quesLevel = request.getParameter("ques_level");
                            out.println(quesLevel);
                            out.println("num:" + total_question + "<br>");
//ArrayList<Integer> list = new ArrayList<Integer>();
//        for (int i = 1; i <= 20; i++) {
//            list.add(new Integer(i));
//        }
//        int count=0,qs=0;
//        Collections.shuffle(list);
//        for (int i = 1; i <20; i++) {
                            int ques_number = 1;
//            count++;qs++;
                            ArrayList<Question> al1 = QuestionModel.questionList(sub_name, ques_number, ques_set, quesLevel);
                            Iterator itr1 = al1.iterator();
                            if (itr1.hasNext()) {
                                Question q = (Question) itr1.next();
                                out.println("Q." + ques_number + ")<b>" + q.getQuestion() + "</b>");
                                out.println("<ol type='A'>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' id='' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                                out.println("<li><input type='radio' name='op" + ques_number + "' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                            }
                        } //                ArrayList<Question> al2 = QuestionModel.questionList(sub_name, 2, ques_set, quesLevel);
                        //                Iterator itr2 = al2.iterator();
                        //                if (itr2.hasNext()) {
                        //                        Question q = (Question) itr2.next();
                        //                        out.println("Q.2)<b>" + q.getQuestion() + "</b>");
                        //                            out.println("<ol type='A'>");
                        //                            out.println("<li><input type='radio' name='op2' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op2' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op2' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op2' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                        //                }
                        //                ArrayList<Question> al3 = QuestionModel.questionList(sub_name, 3, ques_set, quesLevel);
                        //                Iterator itr3 = al3.iterator();
                        //                if (itr3.hasNext()) {
                        //                        Question q = (Question) itr3.next();
                        //                        out.println("Q.3)<b>" + q.getQuestion() + "</b>");
                        //                            out.println("<ol type='A'>");
                        //                            out.println("<li><input type='radio' name='op3' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op3' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op3' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op3' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                        //                }
                        //                ArrayList<Question> al4 = QuestionModel.questionList(sub_name, 4, ques_set, quesLevel);
                        //                Iterator itr4 = al4.iterator();
                        //                if (itr4.hasNext()) {
                        //                        Question q = (Question) itr4.next();
                        //                        out.println("Q.4)<b>" + q.getQuestion() + "</b>");
                        //                            out.println("<ol type='A'>");
                        //                            out.println("<li><input type='radio' name='op4' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op4' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op4' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op4' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                        //                }
                        //                ArrayList<Question> al5 = QuestionModel.questionList(sub_name, 5, ques_set, quesLevel);
                        //                Iterator itr5 = al5.iterator();
                        //                if (itr5.hasNext()) {
                        //                        Question q = (Question) itr5.next();
                        //                        out.println("Q.5)<b>" + q.getQuestion() + "</b>");
                        //                            out.println("<ol type='A'>");
                        //                            out.println("<li><input type='radio' name='op5' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op5' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op5' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op5' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                        //                }
                        //                ArrayList<Question> al6 = QuestionModel.questionList(sub_name, 6, ques_set, quesLevel);
                        //                Iterator itr6 = al6.iterator();
                        //                if (itr6.hasNext()) {
                        //                        Question q = (Question) itr6.next();
                        //                        out.println("Q.6)<b>" + q.getQuestion() + "</b>");
                        //                            out.println("<ol type='A'>");
                        //                            out.println("<li><input type='radio' name='op6' value='" + q.getOption1() + "' />" + q.getOption1() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op6' value='" + q.getOption2() + "' />" + q.getOption2() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op6' value='" + q.getOption3() + "'  />" + q.getOption3() + "<br><br></li>");
                        //                            out.println("<li><input type='radio' name='op6' value='" + q.getOption4() + "'  />" + q.getOption4() + "<br><br></li></ol><hr>");
                        //                }
                        catch (Exception e) {
                            out.println(e);
                        }
                    %>
                    <center>
                        <input class="btn-primary about-image" type="submit" value="Submit">
                    </center>
                </fieldset>
            </form>
        </div>
    </body>
    <!-- page end -->
    <link href="theme/css/style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="theme/js/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- /js files -->
</html>
