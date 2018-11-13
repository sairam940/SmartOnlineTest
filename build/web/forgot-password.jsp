<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Forgot Password</title>
    <!-- Favicon-->
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="static/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="static/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="static/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="static/css/style.css" rel="stylesheet">
</head>

<body class="fp-page">
    <div class="fp-box">
        <div class="logo">
            <a href="javascript:void(0);">Admin</a>
           
        </div>
        <div class="card">
            <div class="body">
                <form id="forgot_password" action="ForgotPassword" method="POST">
                    <div class="msg">
                        Enter your email address that you used to register. We'll send you the password.
                        .
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" name="email" placeholder="Email" required autofocus>
                        </div>
                    </div>

                    <button class="btn btn-block btn-lg bg-pink waves-effect" type="submit">RESET MY PASSWORD</button>
                  
                    <br><br><a href="login">Login Now!</a>
                    <div>
                        <%
                               HttpSession s1=request.getSession();
                               String check_email=(String)s1.getAttribute("not-match");
                               HttpSession msend=request.getSession();
                               String msg_send=(String)msend.getAttribute("msend");
                               if(check_email!=null)
                               {
                        %>   
                               <center><p style="color:red;">Email not matched.</p></center>
                        <%
                               session.removeAttribute("not-match");
                               }
                               if(msg_send!=null)
                               {
                                   %>
                                        <center><p style="color:red;">Password sent to your email id.please check it.</p></center>
                                        <div class="row m-t-15 m-b--20">
                                            <div class="col-xs-6">
                                               <a href="login">Login Now!</a>
                                            </div>
                                            <div class="col-xs-6">
                                              
                                            </div>
                                        </div>
                                   <%
                                   msend.removeAttribute("msend");
                               }
                        %>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->
    <script src="static/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="static/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="static/plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="static/plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="static/js/admin.js"></script>
    <script src="static/js/pages/examples/forgot-password.js"></script>
</body>

</html>

