<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Contact Us</title>
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
                                    <li><a href="signin">Student Login</a></li>
                                    <li><a href="faculty-login">Faculty Login</a></li>
                                    <li><a href="admin">Administrator Login</a></li>
                                </ul>
                            </li>
<!--                            <li><a href="signup">Sign Up</a></li>-->
                            <li><a href="about">About Us</a></li>
                            <li><a href="contact">Contact Us</a></li>
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
                            <h2 class="pageTitle">Contact Us</h2>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">

                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="about-logo">
                                <h3>ABC</h3>
                                <p>ABC is a software development company which was established in the Year 2000, exclusively for providing individual software as well as web applications based on customer requirement.</p>
                                <p>Our aim is to simplify the assessment processes both for the examiner and for the examinee by enhancing the ease of use and provide user satisfaction than any other online examination system. In this process, we create more revenue for you at a much lower costs or no cost than your current costs. The system provides accurate and quick feedback and reports. Our online assessment software not only saves the time, but also increases the accuracy of results almost instantaneously. It also provides feedback to examinees automatically and saves paperwork.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <p>ABC is committed to providing the next level of user-friendly exam management system.</p>
                        <center><img src="images/spinner.gif" alt="loader" style="width: 130px;height: 100px;" id="loader"></center>
                            <!-- Form itself -->
                            <form id="contactForm" novalidate>
                                <h3>Contact Us</h3>
                                <div id="error"></div>
                                <div id="success"></div>
                                
                                <div class="control-group">
                                    <div class="controls">
                                        <input type="text" class="form-control"  placeholder="Full Name" id="name" name="name" required data-validation-required-message="Please enter your name" />
                                        <p class="help-block"></p>
                                    </div>
                                </div>
                                <input type="hidden" id="contact" value="hi" name="contact">
                                <div class="control-group">
                                    <div class="controls">
                                        <input type="email" class="form-control" name="email" placeholder="Email" id="email" required data-validation-required-message="Please enter your email" />
                                    </div>
                                </div><br>
                                <div class="controls">
                                    <input type="text" class="form-control" name="phone" placeholder="Phone" id="phone" required data-validation-required-message="Please enter your phone number" />
                                    <p class="help-block"></p>
                                </div>
                                  
                                <div class="control-group">
                                    <div class="controls">
                                        <textarea rows="10" cols="100" class="form-control"  placeholder="Message" id="message" required
                                                  name="message"  data-validation-required-message="Please enter your message" minlength="5"
                                                  data-validation-minlength-message="Min 5 characters"
                                                  maxlength="999" style="resize:none"></textarea>
                                    </div>
                                </div>
                                <input type="button" name="contact" value="Send" id="Send" class="btn btn-primary"><br />
                            </form>
                        </div>
                        <div class="col-md-6">
                            <!--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15438022.141930647!2d63.78638097304587!3d19.149359674810782!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd5dac2ef639bde55!2sProject+Directory!5e0!3m2!1sen!2sin!4v1523099964521" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>-->
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d218194.27984134908!2d-89.46054175711299!3d31.29584992659277!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x889cdc49d5a828df%3A0x74b1bf922d1cb5ca!2sHattiesburg%2C+MS%2C+USA!5e0!3m2!1sen!2sin!4v1538482182006" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>

            </section>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
<script>
    $(document).ready(function() {
         $('#loader').hide();
        $("#Send").click(function() {
            $('#loader').show();
            var name = $("#name").val();
            var email = $("#email").val();
            var phone = $("#phone").val();
            var message = $("#message").val();
            var contact = $("#contact").val();
            var formData = $("#contactForm").serialize();
            if (name === "" || email === "" || phone === "" || message === "")
            {
                $('#loader').hide();
                $("#success").html("<center><div class='alert alert-danger'>All Fields Are Mandatory.</div></center>");
                $("#name").css("border-color", "red");
                $("#email").css("border-color", "red");
                $("#phone").css("border-color", "red");
                $("#message").css("border-color", "red");
                return false;
            }
            else {
                $.ajax({
                    type: "POST",
                    data: formData,
                    url: "student",
                    success: function(data) {
                        $('#loader').hide();
                        $("#error").html("");
                        $("#contactForm")[0].reset();
                        $("#name").css("border-color", "gray");
                        $("#email").css("border-color", "gray");
                        $("#phone").css("border-color", "gray");
                        $("#message").css("border-color", "gray");
                        $("#success").html(data);
                        setTimeout(function() {// wait for 5 secs(2)
                            location.reload(); // then reload the page.(3)
                        }, 2000);
                    },
                    error: function(data) {
                        $("#error").html(data);
                    }
                });
            }
        });
    });
</script>