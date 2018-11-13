<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
        <link href="css/flexslider.css" rel="stylesheet" />
        <link href="theme/css/style.css" rel="stylesheet">
        <link href="css/style3.css" rel="stylesheet" type="text/css"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body>
        <header>
            <div class="navbar navbar-default navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index"><img src="images/online.png" class="img img-responsive img-circle" style="height: 65px;margin-top: -20px;position: fixed;" alt="logo"/></a>
                    </div>
                    <div class="navbar-collapse collapse ">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="faculty-home">Home</a></li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Profile <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="faculty-profile">Edit Profile</a></li>
                                    <li><a href="faculty-changepassword">Change Password</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Question Management <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="add-question">Add Question</a></li>
                                    <li><a href="update-question">Update Question</a></li>
                                    <li><a href="view-subject">View Question</a></li>
                                </ul>
                            </li>
                            <li><a href="student-report">Student Report</a></li>
                            <li><a href="logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
