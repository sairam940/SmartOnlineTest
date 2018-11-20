<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="sk">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign Up</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <jsp:include page="header.jsp"></jsp:include>
    </head>

    <body class="login register">

        <div class="col-sm-12">
            <div class="login-box">
                <div class="login-header">
                    <h2>Registration</h2>
                    <%
                        String exist=(String) session.getAttribute("exist");
                        if(exist!=null)
                        {
                            out.println("<center><h5 style='color:red;'>Student already exist.</h5></center>");
                            session.removeAttribute("exist");
                        }else{}
                    %>
                </div>
                <form action="student" method="POST" name="form" enctype="multipart/form-data" id="login-form">
                    <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">

                        <label class="form-label">
                            First Name:<span style="color:red;" id="span_fname">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                            <input name="fname" value="" pattern=".{2,}" required title=" " type="text" class="form-control ml-24" placeholder="Firstname..." aria-describedby="basic-addon1">
                        </div>

                        <label class="form-label">
                            Last Name:<span style="color:red;" id="span_fname">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                            <input name="lname" value="" pattern=".{2,}" required title=" " type="text" class="form-control ml-24" placeholder="Lastname..." aria-describedby="basic-addon1">
                        </div>
                        <label class="form-label">
                            Email:<span style="color:red;" id="span_fname">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input name="email" type="email" required title=" Enter the correct email" class="form-control ml-24" placeholder="Email..." aria-describedby="basic-addon1">
                        </div>
                        <label class="form-label">
                            Photo:<span style="color:red;" id="span_fname">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-file"></i></span>
                            <input name="photo" type="file" required title="Select Photo" class="form-control ml-24" aria-describedby="basic-addon1">
                        </div>
                        <label class="form-label">
                            DOB:<span style="color:red;" id="span_fname">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input type="text" placeholder="Select DOB" name="dob" id="dob" onchange="calculateAge();" required="" class="datepicker form-control ml-24">
                        </div>
                        <label class="form-label">
                            Age:<span style="color:red;" id="span_fname">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                            <input name="age" value="" id="age" required type="text" class="form-control ml-24" placeholder="Age..." aria-describedby="basic-addon1">
                        </div>
                        <label class="form-label">
                            Gender:<span style="color:red;" id="span_fname">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                            &nbsp;&nbsp;<input name="gender" value="Male" required type="radio">Male
                            &nbsp;&nbsp;<input name="gender" value="Female" required type="radio">Female
                        </div>
                        <label class="form-label">
                            Phone:<span id="call" style="color:red;">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-phone"></i></span>
                            <input name="phone" maxlength="10" id="phone" required type="number" class="form-control ml-24" placeholder="Phone..." aria-describedby="basic-addon1">
                        </div>
                        <label class="form-label">
                            Password:<span style="color:red;" id="password">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-lock"></i></span>
                            <input name="pass" id="pass" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required title="Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. " type="password" class="form-control ml-24" placeholder="Password..." aria-describedby="basic-addon1">
                        </div>

                        <label class="form-label">
                            Re-password:<span style="color:red;" id="span_fname">&nbsp;&nbsp;(*)</span>
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-lock"></i></span>
                            <input name="cpass" id="repass" required title="" type="password" class="form-control ml-24" placeholder="Confirm Password..." aria-describedby="basic-addon1">
                        </div>
                        <input class="btn btn-primary" value="Sign Up" name="signup" onclick="return onSubmitForm(),check();" type="submit">
                        <a href="forgot" class="pull-right fgt-link">Forgotten password?</a>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
        <!-- javascript
                               ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- javascript
                               ================================================== -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
        <script>
            $(function() {
                $('.datepicker').datepicker({
                    format: 'yyyy-mm-dd',
                    endDate: '+0d',
                    autoclose: true
                });
            });
        </script>
        <script type="text/javascript">
            function onSubmitForm(){
		if ((form.phone.value).length !== 10)
                {
                    //alert("Phone Number should be 10 digit only.");
                    document.getElementById("call").innerHTML="&nbsp;&nbsp;Phone Number should be 10 digit only.";
                    return false;
                }  
	}
	</script>
        
        <script type="text/javascript">
            function check(){
                if ((form.pass.value).length < 6)
                {
                    //alert("Password should have minimum 6 characters.");
                    document.getElementById("password").innerHTML="&nbsp;&nbsp;Password should have minimum 6 characters.";
                    return false;
                }
                if (form.cpass.value !== form.pass.value)
                {
                    //alert("Password confirmation does not match.");
                    document.getElementById("password").innerHTML="&nbsp;&nbsp;Password confirmation does not match.";
                    return false;
                }
	}
	</script>
        <script>
            function calculateAge() {
                var today = new Date();
                var dateString = document.getElementById('dob').value;
                //alert(dateString);
                var birthDate = new Date(dateString);
                var age = today.getFullYear() - birthDate.getFullYear();
                var m = today.getMonth() - birthDate.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }
                document.getElementById('age').value = age;
            }
        </script>