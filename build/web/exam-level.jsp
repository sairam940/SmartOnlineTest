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
        <jsp:include page="SHeader.jsp"></jsp:include>
            <title>Test Overview</title>
        </head>
        <body class="login">
        <%!
            int fees = 0;
        %>
        <%
            Random rnd = new Random();
            char set = (char) (rnd.nextInt(2) + 'A');
            String ques_set = String.valueOf(set); // most efficient         
            String quesLevel="";
            if(ques_set.equalsIgnoreCase("A")){
                quesLevel="Easy";
                System.out.println(" quesLevel: "+quesLevel);
            } else {
                quesLevel="Hard";
                System.out.println("quesLevel: " +quesLevel);
            }
        %>
        <div class="col-sm-12">
            <div class="login-box">
                <div class="login-header">
                    <h2>Test Overview</h2>
                </div>
                <form action="exam" method="POST" id="login-form">
                    <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                        <label class="form-label">
                            <%
                                String email = (String) session.getAttribute("email");
                                if (email == null) {
                                    response.sendRedirect("index");
                                }
                            %>
                            Email:
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input name="email" type="email" required readonly="" class="form-control ml-24" value="<%=email%>" aria-describedby="basic-addon1">
                        </div>
                        <label class="form-label">
                            Test Name:
                            <%
                                String sub_name = (String) session.getAttribute("sub_name");
                            %>
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
                        </div>
                       <label class="form-label">
                            Question Level
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><b><i class="glyphicon glyphicon-info-sign"></i></b></span>
                           <input type="text" name="quesLevel" readonly="" id="quesLevel" class="form-control ml-24" value="<%=quesLevel%>" required >
                        </div><br>
                        <input class="btn-primary about-image" value="Proceed"  name="level" type="submit"><br>
                        <!--<center><a href="https:paypal.com" style="text-decoration: underline;" class="text-center">or pay here</a></center>-->
                    </div>
                </form>
            </div>
        </div>
        <!-- page end -->
        <link href="theme/css/style.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="theme/js/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- /js files -->
    </body>
</html>
