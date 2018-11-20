<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<div class="container-fluid">
    <div class="block-header">
        <h2>

        </h2>
    </div>
    <%
        if (session.getAttribute("added") != null) {
            session.removeAttribute("added");
    %>
    <!-- Basic Validation -->
    <div class="alert bg-green alert-dismissible" role="alert" id="sub_add">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Student</strong> Added Successfully.
    </div>
    <%
        } else {
        }
    %>


    <%
        if (session.getAttribute("exist") != null) {
            session.removeAttribute("exist");
    %>
    <!-- Basic Validation -->
    <div class="alert alert-info" id="sub_check">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Student</strong> Already Exist.
    </div>
    <%
        } else {
        }
    %>

    <%
        if (session.getAttribute("error") != null) {
            session.removeAttribute("error");
    %>
    <!-- Basic Validation -->
    <div class="alert bg-green alert-dismissible" role="alert" id="sub_add">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>Oops!!</strong>Something went wrong. 
    </div>
    <%
        } else {
        }
    %>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>ADD STUDENT</h2>
                    <l class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul>
                        </li>
                        </ul>
                </div>
                <div class="body">
                    <form id="form_validation" name="form" method="post" action="student" enctype="multipart/form-data">
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="fname" id="fname" required="">
                                <label class="form-label">First Name</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="lname"  id="lname" required="">
                                <label class="form-label">Last Name</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="email" id="email" required="">
                                <label class="form-label">Email</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="file" class="form-control" name="photo" id="photo" required="">
                                <label class="form-label">Photo</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="number" class="form-control" title="Phone Number should be 10 digit only." maxlength="10" pattern="\d{3}[\-]\d{3}[\-]\d{4}" onkeyup="check();
                                        return false;" name="phone" id="phone" required="">
                                <span id="message"></span><label class="form-label">Phone</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="date" class="form-control" name="dob" id="dob" onchange="calculateAge();" required="">
                                <label class="form-label">DOB</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="number" class="form-control" name="age" id="age" required="">
                                <label class="form-label">Age</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <select id="gender" required="" class="form-control" name="gender">
                                    <option value="" selected="" disabled="">Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="password" class="form-control" name="pass" id="pass" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required="" title="Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. ">
                                <label class="form-label">Password</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="password" class="form-control" name="cpass" id="cpass" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required="" title="Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. ">
                                <label class="form-label">Confirm Password</label>
                            </div>
                        </div>

                        <input class="btn btn-primary waves-effect" value="SUBMIT" type="submit" id="sub" name="signup" onclick="return checkPass();">
                    </form><br><br>
                    <div id="msg" class="text-center" style="color:green;"></div>
                </div>
            </div>
        </div>
    </div>

</div>
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
    function check()
    {
        var phone = document.getElementById('phone');
        var message = document.getElementById('message');
        var goodColor = "#0C6";
        if (phone.value.length != 10) {
            message.style.color = goodColor;
            message.innerHTML = "required 10 digits, match requested format!"
        }
    }
    
    
    function checkPass() {
        var fname = document.form.fname.value;
        var lname = document.form.lname.value;
        var email = document.form.email.value;
        var phone = document.form.phone.value;
        var gender = document.form.gender.value;
        var dob = document.form.dob.value;
        var age = document.form.age.value;
        var photo = document.form.photo.value;
        var pass = document.form.pass.value;
        var cpass = document.form.cpass.value;
        if (fname === "" && lname === "" && email === "" && phone === "" && gender === "" && dob === "" && age === "" && photo === "" && pass === "" && cpass === "")
        {
            alert("All Fields Are Mandatory.");
        }
        else
        {
            if ((form.pass.value).length < 6)
            {
                alert("Password should have minimum 6 characters.");
                return false;
            }
            if (form.cpass.value !== form.pass.value)
            {
                alert("Password confirmation does not match.");
                return false;
            }
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