<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Sign In</title>
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
    <script src="static/js/backNoWork.js" ></script>
</head>

<body class="login-page">
    <%
        String error=(String)session.getAttribute("error");
        if(error!=null){
            out.println("<center><div class='alert alert-danger'>Wrong login Credentials, Please try again.</div></center>");
            session.removeAttribute("error");
        }else{
            
        }
    %>
    <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">Admin</b></a> 
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_in" method="POST" action="AdminController">
                    <div class="msg">Sign in to start your session</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" name="email" placeholder="Enter Email" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-8 p-t-5">
                            <input type="checkbox" name="rememberme" id="rememberme" class="filled-in chk-col-pink">
                            <label for="rememberme">Remember Me</label>
                        </div>
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-pink waves-effect" type="submit" name="login">SIGN IN</button>
                        </div>
                    </div><hr>
                    <div class="row m-t-15 m-b--20" >
                        <div class="col-xs-6 align-left">
                            <a href="index">Home</a>
                        </div>
                        <div class="col-xs-6 align-right">
                            <a href="forgot-password">Forgot Password?</a>
                        </div>
                        
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
    <script src="static/static/plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="static/js/admin.js"></script>
    <script src="static/js/pages/examples/sign-in.js"></script>
</body>

</html>
