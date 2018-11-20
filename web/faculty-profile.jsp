<%@page import="java.util.Iterator"%>
<%@page import="entities.Faculty"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.FacultyModel"%>
<%@page import="java.util.UUID"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style3.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="Fheader.jsp"></jsp:include>
            <title>Edit Profile</title>
        </head>
        <body class="login">
            <div class="login-box">
                <div class="login-header">
                    <h4>Profile Update Form</h4>
                </div>
            <%
                String success = (String) session.getAttribute("success");
                if (success != null) {
                    out.println("<center><div class='alert alert-success'>" + success + "</center>");
                    session.removeAttribute("success");
                } else {
                }
                String failure = (String) session.getAttribute("failure");
                if (failure != null) {
                    out.println("<center><div class='alert alert-danger'>" + failure + "</center>");
                    session.removeAttribute("failure");
                } else {
                }
            %>
            <%
                HttpSession s = request.getSession();
                String email = (String) s.getAttribute("femail");
                //String sname = (String) session.getAttribute("sname");
                //String[] name = sname.split(" ");

                ArrayList<Faculty> list = FacultyModel.getFacultyProfile(email);
                Iterator itr = list.iterator();
                if (itr.hasNext()) {
                    Faculty st = (Faculty) itr.next();
            %>
            <form action="FacultyProfile" method="POST" name="form" id="login-form">
                <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                    <label class="form-label">
                        First Name:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="fname" type="text" required  class="form-control ml-24" value="<%=st.getFname()%>" aria-describedby="basic-addon1">
                    </div>

                    <label class="form-label">
                        Last Name:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="lname" type="text" required  class="form-control ml-24" value="<%=st.getLname()%>" aria-describedby="basic-addon1">
                    </div>
                    <label class="form-label">
                        Email:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input name="email" type="email" readonly="" required title=" Enter the correct email" class="form-control ml-24" value="<%=email%>" aria-describedby="basic-addon1">
                    </div>
                    
                    <label class="form-label">
                        Qualification:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-phone"></i></span>
                        <input name="qualification" value="<%=st.getQualification()%>" id="qualification" required type="text" class="form-control ml-24" placeholder="qualification..." aria-describedby="basic-addon1">
                    </div>
                    <label class="form-label">
                        Phone:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-phone"></i></span>
                        <input name="phone" value="<%=st.getPhone()%>" id="phone" required type="number" class="form-control ml-24" placeholder="Phone..." aria-describedby="basic-addon1">
                    </div>

                    <input class="btn btn-primary" value="Update" name="signup" onclick="return check();" type="submit">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input class="btn btn-secondary" style="margin-top: 20px;" value="Cancel" onclick="location.href='faculty-home';" type="button">
                    <a href="change" class="pull-right fgt-link">Change Password?</a>
                </div>
            </form>
        </div>

        <%
            }
        %>
        <!-- page end -->
        <link href="theme/css/style.css" rel="stylesheet">
        <!-- jQuery -->
        <script src="theme/js/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- /js files -->
    </body>
</html>
<script type="text/javascript">
    function check() {
        if ((form.phone.value).length !== 10)
        {
            alert("Phone Number should be 10 digit only.");
            return false;
        }
    }
</script>
