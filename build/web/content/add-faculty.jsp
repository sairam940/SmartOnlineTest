<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-fluid">
    <div class="block-header">
        <h2>

        </h2>
    </div>
    <!-- Basic Validation -->
   <div class="alert bg-green alert-dismissible" role="alert" id="sub_add">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              Faculty Added Successfully.
    </div>
    <div class="alert alert-info" id="sub_check">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong>Faculty</strong> Already Exist.
   </div>
   <div class="alert bg-pink alert-dismissible" role="alert" id="sub_del">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <center> <strong>Faculty deleted Successfully...</strong> </center>
  </div>
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>ADD FACULTY</h2>
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
                    <form id="form_validation">
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="fname" id="fname" required>
                                <label class="form-label">First Name</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="lname"  id="lname" required>
                                <label class="form-label">Last Name</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="email" id="email" required>
                                <label class="form-label">Email</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="qualification" id="qualification" required>
                                <label class="form-label">Qualification</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="number" class="form-control" name="phone" id="phone" required>
                                <label class="form-label">Phone</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="password"  class="form-control" name="pass" id="pass" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required title="Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. ">
                                <label class="form-label">Password</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="password" class="form-control" name="cpass" id="cpass" data-minlength="6" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required title="Password Minimum of 6 characters,should contain at least 1 upper case, 1 lower case and 1 digit. ">
                                <label class="form-label">Confirm Password</label>
                            </div>
                        </div>
                       
                        <input class="btn btn-primary waves-effect" value="SUBMIT" type="button" id="sub" name="signup">
                    </form><br><br>
                    <div id="msg" class="text-center" style="color:green;"></div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    $(document).ready(function() {
        $("#sub_add").hide();
        $("#sub_check").hide();
         $("#sub_del").hide();
        $("#sub").on("click", function()
        {
            var fname = $("#fname").val();
            var lname = $("#lname").val();
            var email = $("#email").val();
            var qualification = $("#qualification").val();
            var phone = $("#phone").val();
            var pass = $("#pass").val();
            var cpass = $("#cpass").val();
            var signup = $("#sub").val();

            if (fname === "" || lname === "" || email==="" || qualification==="" || phone==="" || pass==="" || cpass==="")
            {
                $("#msg").html("All Fields Are Mandatory.").css("color","red");
            }
            else if(pass!==cpass)
            {
                $("#msg").html("Password and Confirm Password should be same.").css("color","red");
            }
            else
            {
                $.ajax({
                    url: "FacultyController",
                    data: {fname: fname,lname:lname,email:email,qualification:qualification,phone:phone,pass:pass,cpass:cpass,signup:signup},
                    method: "POST",
                    success: function(data)
                    {
                        //alert(data);
                        var result = $.trim(data);
                        if (result === "added")
                        {
                            $("#sub_add").html("Faculty Added Successfully.").fadeOut(3000);
                            $("#sub_add").show();
                            $("#sub_add").fadeOut(3000);
                            $("sub_del").hide();
                            $("#form_validation").trigger("reset");
                        }
                        else if (result === "exist")
                        {
                             $("#msg").html("Faculty Already exist.").fadeOut(3000);
                             $("#sub_check").show();
                             $("#sub_check").fadeOut(3000);
                             $("#sub_add").hide();
                             $("sub_del").hide();
                             $("#form_validation").trigger("reset");
                            
                        }
                        else if (result === "ok")
                        {
                            $("#msg").html("Faculty Deleted.");
                            $("#sub_del").show();
                            $("#sub_check").hide();
                            $("#sub_add").hide();
                            $("#form_validation").trigger("reset");
                        }
                        else
                        {   
                            $("#msg").html("");
                        }
                    }

                });
               
            }

        });
        
    });
</script>
