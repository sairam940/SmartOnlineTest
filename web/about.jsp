<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>About Us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
        <link href="css/flexslider.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!-- start header -->
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
                                    <li><a href="<%= request.getContextPath()%>/admin">Administrator Login</a></li>
                                </ul>
                            </li>
                            <li><a href="<%= request.getContextPath()%>/signup">Sign Up</a></li>
                            <li><a href="<%= request.getContextPath()%>/about">About Us</a></li>
                            <li><a href="<%= request.getContextPath()%>/contact">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

                        <!-- end header -->
                        <div id="wrapper">
                            <section id="inner-headline">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2 class="pageTitle">About Us</h2>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">
                <section class="section-padding">
                    <div class="container">
                        <div class="row showcase-section">
                            <div class="col-md-6">
                                <img src="images/about-img.jpg" style="width: 85%;" alt=""/>

                            </div>
                            <div class="col-md-6">
                                <div class="about-text">
                                    <h3>About Us</h3>
                                    <p>ABC is a software development company which was established in the Year 2018, exclusively for providing individual software as well as web applications based on customer requirement.</p>
                                    <p>ABC is committed to providing the next level of user-friendly exam management system. We have worked diligently to bring you our online examination product that we are proud of. Our aim is to simplify the assessment processes both for the examiner and for the examinee by enhancing the ease of use and provide user satisfaction than any other online examination system. In this process, we create more revenue for you at a much lower costs or no cost than your current costs. The system provides accurate and quick feedback and reports. Our online assessment software not only saves the time, but also increases the accuracy of results almost instantaneously. It also provides feedback to examinees automatically and saves paperwork.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
            <jsp:include page="footer.jsp"></jsp:include>
                        </div>
        
    </body>
   
</html>
