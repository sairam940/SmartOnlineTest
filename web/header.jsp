<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
        <link href="css/flexslider.css" rel="stylesheet" />
        <link href="theme/css/style.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <div class="navbar navbar-default navbar-static-top">
                <div class="container">
                    <div class="navbar-header" style="height: 65px;">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index">Smart Online Test</a>
                    </div>
                    <div class="navbar-collapse collapse" style="">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="index">Home</a></li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Sign In <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%= request.getContextPath()%>/signin">Student Login</a></li>
                                    <li><a href="<%= request.getContextPath()%>/faculty-login">Faculty Login</a></li>
                                    <li><a href="<%= request.getContextPath()%>/home">Administrator Login</a></li>                                   
                                </ul>
                            </li>
<!--                            <li><a href="<%= request.getContextPath()%>/signup">Sign Up</a></li>-->
                            <li><a href="<%= request.getContextPath()%>/about">About Us</a></li>
                            <li><a href="<%= request.getContextPath()%>/contact">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
