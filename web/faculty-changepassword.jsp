<%@page import="java.util.UUID"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Change Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="Fheader.jsp"></jsp:include>
            <title>Instructions</title>
        </head>
        <body class="login">

        </div>
        <div class="row">
            <div class="login-box">
                <div class="login-header">
                    <h4>CHANGE PASSWORD</h4>
                </div>
            <%
                HttpSession s1 = request.getSession();
                if (s1.getAttribute("notmatch") != null) {
            %>
            <center> <div class="alert alert-info">Password and Confirm password does not match...</div> </center>
                <%        s1.removeAttribute("notmatch");
                    }
                    s1 = request.getSession();
                    if (s1.getAttribute("change") != null) {
                %>
            <center> <div class="alert alert-success">Password Updated Successfully...</div> </center>
                <%
                        s1.removeAttribute("change");
                    }
                    s1 = request.getSession();
                    if (s1.getAttribute("old") != null) {
                %>
            <center> <div class="alert alert-danger">Old Password does not match...</div> </center>
                <%
                        s1.removeAttribute("old");
                    }
                %>
            <form action="change_password" method="POST" id="login-form">
                <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                    <div class="form-group">
                        <div class="col-sm-6 col-md-6 col-lg-12">
                            <label class="form-label">Faculty Name</label>
                            <input name="sname" data-minlength="6"  type="text" class="form-control ml-24"  value="<%=(String) session.getAttribute("name")%>" readonly="" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-md-6 col-lg-12">
                            <label class="form-label">Old Password</label>
                            <input name="old" id="old" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required title="Old Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. " type="password" class="form-control ml-24" placeholder="Old Password..." aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-md-6 col-lg-12">
                            <label class="form-label">
                                New Password:
                            </label>
                            <input name="npass" id="pass" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required title="Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. " type="password" class="form-control ml-24" placeholder="New Password..." aria-describedby="basic-addon1">

                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-6 col-md-6 col-lg-12">
                            <label class="form-label">
                                Confirm Password:
                            </label>
                            <input name="cpass" id="cpass" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required title="Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. " type="password" class="form-control ml-24" placeholder="Confirm Password..." aria-describedby="basic-addon1">
                            <input class="btn btn-info" value="CHANGE" name="signin" onclick="return check();" type="submit">
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
    <!-- page end -->
    <link href="theme/css/style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="theme/js/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- /js files -->
</body>
<script type="text/javascript">
    function check(){
        var pass=document.getElementById("pass").value;
        var cpass=document.getElementById("cpass").value;
        if(pass!==cpass)
        {
            alert("Password and Confirm password does not match...");
            return false;
        }
        else{
            
        }
        
    }
</script>
</html>
