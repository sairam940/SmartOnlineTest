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
        <jsp:include page="header.jsp"></jsp:include>
            <title>Forgot?</title>
        </head>
        <body class="login">


            <div class="col-sm-12">
                <div class="login-box">
                    <div class="login-header">
                        <h2>Forgotten password</h2>
                    </div>
                <%
                    String msg1 = (String) session.getAttribute("msg1");
                    if (msg1 == null) {

                    } else {
                        session.removeAttribute("msg1");
                        out.println("<center><div class='alert alert-success'>" + msg1 + "</div></center>");
                    }
                    String msg = (String) session.getAttribute("msg");
                    if (msg == null) {

                    } else {
                        session.removeAttribute("msg");
                        out.println("<center><div class='alert alert-danger' style='color:red;'>Invalid Email or Email is Not Registered.</div></center>");
                    }
                %>
                <form action="student" method="POST" id="login-form">
                    <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                        <label class="form-label">
                            Email:
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input name="email" type="email" required title=" " class="form-control ml-24" placeholder="Email..." aria-describedby="basic-addon1">
                        </div>
                        <input class="btn btn-form-login" value="Send" name="forgot" type="submit">
                        <a href="signin" class="pull-right fgt-link">Sign In</a>
                    </div>

                </form>

            </div>
        </div>
        <script type="text/javascript">

            function check() {
                if ($("#pass").val() != $("#repass").val()) {
                    $("#passcheck").removeClass('hidden');
                } else {
                    $("#passcheck").addClass('hidden');
                }
            }

        </script>
        <!-- page end -->
        <link href="theme/css/style.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="theme/js/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- /js files -->

    </body>
</html>
