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
        <jsp:include page="SHeader.jsp"></jsp:include>
            <title>Instructions</title>
        </head>
        <body class="login">
            <div class="container">
            <%

                HttpSession ses = request.getSession(false);
                String semail = (String) ses.getAttribute("email");
                if (semail != null) {
                    String name = (String) session.getAttribute("sname");
                    String email = (String) session.getAttribute("email");
            %>
            <br /><br />
            <center><h3>HELP</h3></center><hr>
            <p style="font-weight:bold;color:blue;">WATCH THE TIME:</p>
            Watch the time carefully. You are allowed to answer one question in 2 minutes.
            If you failed to answer it in the given time, you will loose the chance to
            answer that question and automatically switch to next question. on this system.

            <br />
            <br />

            <p style="font-weight:bold;color:blue;">STAY ON THE WEBPAGE:</p><br />
            Do not attempt to go to another Web site with the same browser window while
            taking an exam. Also, do not hit the FORWARD BACK or REFRESH buttons if you do
            so you could loose answers that had already been entered. So don’t take risk. Be
            sincere while taking the exam.<br />
            <br />
            <p style="font-weight:bold;color:blue;">STAY CALM EVEN IF TECHNOLOGY BREAKS:</p><br />
            If a problem does occur (sometimes it is better to think when instead of if), so
            not panic. Write down what happened immediately before the problem occured,
            immediately email the instructor and let him or her know what is going on. Be
            sure to include any error messages in the email.
            <br />
            <br />
            <p style="font-weight:bold;color:blue;">SUBMIT ONLY ONCE:</p><br />
            Generally only hit the submit or Next button once. An error could occur if you
            try to hit it more than once, or the instructor will end up with more than one
            copy of the exam. If an error does occur, immediately email the instructor to
            let him/her know what happened.
            <br />
            <br />
            <p style="font-weight:bold;color:blue;">READ:</p><br />
            Read the stem of multiple choice questions and try to answer them for yourself
            before you look at the choices. Then pick the answer closest to yours.Read all
            the possible answers in multiple choice questions even if you think the first or
            second choice is correct.Eliminate alternatives in multiple choice and matching
            questions so you narrow your choice and increase the probability of a correct
            answer.Change an answer if you can think of a concrete reason that makes your
            first answer wrong.

            <br/><br/>
            <!--            <p style="float:right;">
                            <input type="submit" name="btnStart" value="BACK" id="btnStart" style="color:#333333;background-color:#E1E1E1;font-weight:bold;width: 90px; height: 31px;" /></p><p style="float:right;">
                        </p>-->
            <br><br>
            <%
                } else {
                    out.print("<center><h3 style=\"color:red;\">Login First. </h3></center>");
                    request.getRequestDispatcher("signin").include(request, response);
                }
            %>

        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>