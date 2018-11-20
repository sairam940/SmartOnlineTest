<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin Sign In</title>

        <!-- Bootstrap Core CSS -->
        <link href="theme/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="theme/css/style.css" rel="stylesheet">

        <!-- jQuery -->
        <script src="theme/js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="theme/js/bootstrap.min.js"></script>

    </head>

    <body class="login">
        <div class="overlay hidden" id="overlay"></div>

        <div class="container-fluid no-rt-pd">

            <div class="row">

                <div class="top-bar">

                    <div class="col-lg-2 col-md-4 col-sm-12">

                        <a class="navbar-brand" href="index"><img src="images/online.png" class="img img-responsive img-circle" style="height: 65px;margin-top: -20px;position: fixed;" alt="logo"/></a>

                    </div>

                    <div class="col-md-5 col-sm-5"></div>

                    <div class="col-lg-3 col-md-5 col-sm-12 pull-right links">

                        <a href="signup" class="btn btn-register"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;Sign Up</a>
                        <a href="index" class="btn btn-back"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;Home</a>

                    </div>

                </div> <!-- END TOP BAR -->

            </div>

        </div>

        <div class="container">
            <div class="login">
                <div class="row">
                    <div class="login-box">
                        <div class="login-header">
                            <h4>Admin Login</h4>
                        </div>

                        <%
                            String msg = (String) session.getAttribute("error");
                            if (msg == null) {

                            } else {
                                session.removeAttribute("error");
                                out.println("<center><div class='alert alert-danger' style='color:red;'>Invalid Email or Password...</div></center>");
                            }
                        %>
                        <form action="student" method="POST" id="login-form">
                            <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                                <div class="form-group">
                                    <div class="col-sm-6 col-md-6 col-lg-12">
                                        <label class="form-label">Email:</label>
                                        <input class="form-control" required="" name="email" value="" placeholder="Email...">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-6 col-md-6 col-lg-12">
                                        <label class="form-label">
                                            Password:
                                        </label>
                                        <input class="form-control" required="" name="password" value="" placeholder="Password..." type="password">
                                        <input class="btn btn-form-login" value="Sign In" name="signin" type="submit">
                                    </div>
                                </div>
                                <a href="forgot" class="pull-right fgt-link">Forgotten password?</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
