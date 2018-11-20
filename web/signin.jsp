<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign In</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="header.jsp"></jsp:include>
        <!-- javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        </head>
        <body class="login">
        <div class="col-sm-12">
            <div class="login-box">
                <div class="login-header">
                    <h2>SIGN IN</h2>
                <%
                    String msg = (String) session.getAttribute("error");
                    if (msg == null) {

                    } else {
                        session.removeAttribute("error");
                        out.println("<center><div class='' style='color:red;font-size:20px;'>Invalid Email or Password...</div></center>");
                    }
                %>
            </div>
            <form action="student" method="POST" id="login-form">
                <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                    <label class="form-label">
                        Email:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input name="email" type="email" required title=" Enter the correct email" class="form-control ml-24" placeholder="Email..." aria-describedby="basic-addon1">
                    </div>
                    <label class="form-label">
                        Password:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-lock"></i></span>
                        <input name="password" id="pass" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required title="Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. " type="password" class="form-control ml-24" placeholder="Password..." aria-describedby="basic-addon1">
                    </div>
                    <input class="btn btn-info" value="Sign In" name="signin" type="submit">
                    <a href="forgot" class="pull-right fgt-link">Forgotten password?</a>
                </div>
            </form>
        </div>
</div>
        

    </body>
</html>
