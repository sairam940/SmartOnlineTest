<%
                HttpSession s = request.getSession(false);
                String name = (String) s.getAttribute("user_name");
                String email = (String) s.getAttribute("user_email");
                
                if(email==null || email=="")
                {
                    response.sendRedirect("login.jsp");
                }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Sign Up</title>
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

<body class="signup-page">
    <div class="signup-box">
        <div class="logo">
            <a href="javascript:void(0);">Admin Registration</a>
            
        </div>
        <div class="card">
            <div class="body">
                <form id="sign_up" method="post" action="AdminController">
                    <div class="msg">Register a new membership</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="name" id="name" placeholder="Name" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" name="email" id="email" placeholder="Email Address" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                        </div>
                    </div>
                 
                    <div class="form-group">
                        <input type="checkbox" name="terms" id="terms" class="filled-in chk-col-pink">
                        <label for="terms">I read and agree to the <a href="javascript:void(0);">terms of usage</a>.</label>
                    </div>

                    <input class="btn btn-block btn-lg bg-pink waves-effect" type="button" value="SIGN UP" onclick="login();" name="action" id="insert">
                    
                    
                </form><br><br>
                
                <div class="text-center" id="msg" style="color:green;"><center></center></div>
                <div class="row m-t-15 m-b--20">
                        <div class="col-xs-6">
                            <a href="login.jsp">Login Now!</a>
                        </div>
                        
                </div>
            </div>
        </div>
    </div>
    <script>
            function login()
            {
                 $(document).ready(function (){
                     var name=$("#name").val();
                     var email=$("#email").val();
                     var password=$("#password").val();
                     var action=$("#insert").val();
                     
                     var proceed=true;
                     
                     if(name==="" || email==="" || password==="")
                     {
                         
                         proceed=false;
                         return false;
                     }
                     if(proceed)
                     {
                      
                          $.ajax({
                                url:"AdminController",
                                data:{name:name,email:email,password:password,action:action},
                                method:"POST",
                                success:function(data)
                               {
                                    //alert(data);
                                    var result=$.trim(data);
                                    if(result==="ok")
                                    {
                                        $("#msg").html("Admin Saved.");
                                        $("#sign_up").trigger("reset");
                                    }
                                    else if(result==="exist")
                                    {
                                         $("#msg").html("Admin Already exist.");
                                         $("#sign_up").trigger("reset");
                                    }
                                    else
                                    {
                                         $("#msg").html("");
                                         $("#sign_up").trigger("reset");
                                    }
                              }
              
                         });
                    }
                     
                 });
            }
            </script>
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
    <script src="static/js/pages/examples/sign-up.js"></script>
</body>

</html>
