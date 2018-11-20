<%@page import="java.util.Iterator"%>
<%@page import="entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.StudentModel"%>
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
        <jsp:include page="SHeader.jsp"></jsp:include>
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
                String email = (String) s.getAttribute("email");
                //String sname = (String) session.getAttribute("sname");
                //String[] name = sname.split(" ");

                ArrayList<Student> list = StudentModel.getProfile(email);
                Iterator itr = list.iterator();
                if (itr.hasNext()) {
                    Student st = (Student) itr.next();
                    String gender = st.getGender();
            %>
            <form action="ProfileController" method="POST" name="form" enctype="multipart/form-data" id="login-form">
                <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                    <div class="form-group">
                        <div class="col-sm-6 col-md-6 col-lg-12 text-center" >
                            <img src="<%=st.getPhoto()%>" class="img img-responsive" style="width:120px;height:80px;"/>
                        </div>
                    </div>
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
                        <input name="email" type="email" required title=" Enter the correct email" class="form-control ml-24" value="<%=st.getEmail()%>" aria-describedby="basic-addon1">
                    </div>
                    <label class="form-label">
                        Photo:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-file"></i></span>
                        <input name="photo" type="file" value="<%=st.getPhoto()%>" title="Select Photo" class="form-control ml-24" aria-describedby="basic-addon1">
                    </div>
                    <label class="form-label">
                        DOB:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-calendar"></i></span>
                        <input type="text" value="<%=st.getDob()%>" name="dob" id="dob" onchange="calculateAge();" required="" class="datepicker form-control ml-24">
                    </div>
                    <label class="form-label">
                        Age:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="age" value="<%=st.getAge()%>" id="age" required type="text" class="form-control ml-24" placeholder="Age..." aria-describedby="basic-addon1">
                    </div>
                    <label class="form-label">
                        Gender:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                            <%
                                if (gender.equalsIgnoreCase("Male")) {
                            %>
                        &nbsp;&nbsp;<input name="gender" value="Male" checked="" required type="radio">Male
                        &nbsp;&nbsp;<input name="gender" value="Female"  required type="radio">Female
                        <%
                        } else {
                        %>
                        &nbsp;&nbsp;<input name="gender" value="Male" required type="radio">Male
                        &nbsp;&nbsp;<input name="gender" value="Female" checked="" required type="radio">Female
                        <%
                            }
                        %>
                    </div>
                    <label class="form-label">
                        Phone:
                    </label>
                    <div class="input-group input-blue">
                        <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-phone"></i></span>
                        <input name="phone" value="<%=st.getPhone()%>" id="phone" required type="number" class="form-control ml-24" placeholder="Phone..." aria-describedby="basic-addon1">
                    </div>

                    <input class="btn btn-primary" value="Update" name="signup" onclick="return check();" type="submit">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<input class="btn btn-secondary" style="margin-top: 20px;" value="Cancel" onclick="location.href='instructions';" type="button">
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
    function check() {
        if ((form.phone.value).length !== 10)
        {
            alert("Phone Number should be 10 digit only.");
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