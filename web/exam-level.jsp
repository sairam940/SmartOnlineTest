<%@page import="models.StudentModel"%>
<%@page import="java.util.Random"%>
<%@page import="entities.Question"%>
<%@page import="models.QuestionModel"%>
<%@page import="entities.Subject"%>
<%@page import="models.SubjectModel"%>
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
        <!-- page end -->
        <link href="theme/css/style.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="theme/js/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- /js files -->
        <jsp:include page="SHeader.jsp"></jsp:include>
            <title>Test Overview</title>
        </head>
        <body class="login">
        <%!
            int fees = 0;
        %>
        <%
            String email=null,sub_name=null,ques_set=null,quesLevel=null;
            char set;
            email = (String) session.getAttribute("email");
            if (email != null) {
                sub_name = (String) session.getAttribute("sub_name");
                boolean status = StudentModel.testCount(email, sub_name);
                if (!status) {
                    Random rnd = new Random();
                    set = (char) (rnd.nextInt(2) + 'A');
                    ques_set = String.valueOf(set); // most efficient         
                    session.setAttribute("ques_set", ques_set);
                    if (ques_set.equalsIgnoreCase("A")) {
                        quesLevel = "Easy";
                        session.setAttribute("quesLevel", quesLevel);
                        System.out.println(" quesLevel: " + quesLevel);
                    } else {
                        quesLevel = "Hard";
                        session.setAttribute("quesLevel", quesLevel);
                        System.out.println("quesLevel: " + quesLevel);
                    }
        %>
        <div class="col-sm-12">
            <div class="login-box">
                <div class="login-header">
                    <h2>Test Overview</h2>
                </div>
                <form id="login-form">
                    <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                        <label class="form-label">
                            Email:
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input name="email" type="email" required readonly="" class="form-control ml-24" value="<%=email%>" aria-describedby="basic-addon1">
                        </div>
                        <label class="form-label">
                            Test Name:
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-info-sign"></i></span>
                            <input type="text" name="test" readonly="" id="test" class="form-control ml-24" value="<%=sub_name%>" required >
                        </div>
                        <label class="form-label">
                            Question Set:
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-info-sign"></i></span>
                            <input type="text" name="ques_set" readonly="" id="ques_set" class="form-control ml-24" value="<%=ques_set%>" required >
                        </div><br>

                        <input type="hidden" name="quesLevel" id="quesLevel" class="form-control ml-24" value="<%=quesLevel%>" required >

                        <input class="btn-primary about-image" value="Proceed" onclick="window.open('exam', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=5000,height=5000'),location.href='tests'" name="level" type="button"><br>
                        <!--<center><a href="https:paypal.com" style="text-decoration: underline;" class="text-center">or pay here</a></center>-->
                    </div>
                </form>
            </div>
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
</html>
