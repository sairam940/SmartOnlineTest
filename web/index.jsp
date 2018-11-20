<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Smart Online Test</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/backNoWork.js" type="text/javascript"></script>
        <%
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Expires", "0");
            response.setDateHeader("Expires", -1);
            session.invalidate();
%>
    </head>
    <body>
        <div id="wrapper" class="home-page">
            <!-- start header -->
            <header>
                <div class="navbar navbar-default navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="index">Smart Online Test</a>
                        </div>
                        <div class="navbar-collapse collapse ">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="index">Home</a></li>
                                <li class="dropdown">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">Sign In <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%= request.getContextPath()%>/signin">Student Login</a></li>
                                    <li><a href="<%= request.getContextPath()%>/faculty-login">Faculty Login</a></li>
                                    <li><a href="<%= request.getContextPath()%>/home">Administrator Login</a></li>                                   
                                </ul>
                                </li>
<!--                                <li><a href="<%= request.getContextPath()%>/signup">Sign Up</a></li>-->
                                <li><a href="<%= request.getContextPath()%>/about">About Us</a></li>
                                <li><a href="<%= request.getContextPath()%>/contact">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
            <!-- end header -->
            <section id="banner">

                <!-- Slider -->
                <div id="main-slider" class="flexslider">
                    <ul class="slides">
                        <li>
                            <img src="images/banner3.jpg" alt=""/>
                            <div class="flex-caption">
                                <!--                                <h3>Innovative</h3>
                                                                <p>original and creative in thinking</p>-->

                            </div>
                        </li>
                        <li>
                            <img src="images/banner5.jpg" alt=""/>
                            <div class="flex-caption">
                                <!--                                <h3>Creative</h3>
                                                                <p>Success depends on our work</p>-->

                            </div>
                        </li>
                        <li>
                            <img src="images/banner1.jpg" alt="" />

                            <div class="flex-caption">
                                <!--                                <h3>Innovative</h3>
                                                                <p>original and creative in thinking</p>-->

                            </div>
                        </li>
                        <li>
                            <img src="images/banner4.jpg" alt="" />
                            <div class="flex-caption">
                                <!--                                <h3>Creative</h3>
                                                                <p>Success depends on our work</p>-->

                            </div>
                        </li>
                        <li>
                            <img src="images/banner2.jpg" alt="" />
                            <div class="flex-caption">
                                <!--                                <h3>Creative</h3>
                                                                <p>Success depends on our work</p>-->

                            </div>
                        </li>
                    </ul>
                </div>
                <!-- end slider -->

            </section>
            <section id="call-to-action-2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 col-sm-9">
                            <h3>Smart Online Test</h3>
                            <p>Smart Online Test is a java jsp based web application to allows you to make powerful online tests and assessments in minutes. It provides a wide range of options to Administrator for creating a test including number of questions, total marks and total time according to his choice. Tests are fully customizable which can be modified to any extent by Administrator. Its easy User-friendly interface makes it stand apart from other softwares in this category. The notable features are, can accept plenty of questions and categories at a time, supports randomly selected questions, easy creation of multiple choice quizzes, result output both in natural score and rounded percentage at the end of each test and easy installation.</p>
                        </div>
                        <div style="display: none;" class="col-md-2 col-sm-3">
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
