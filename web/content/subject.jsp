
<%@page import="java.util.List"%>
<%@page import="models.FacultyModel"%>
<%@page import="entities.Faculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-fluid">
    <div class="block-header">
        <h2>

        </h2>
    </div>
    <!-- Basic Validation -->
   <div class="alert bg-green alert-dismissible" role="alert" id="sub_add">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              Subject Added Successfully.
    </div>
    <div class="alert alert-info" id="sub_check">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong>Subject</strong> Already Exist.
   </div>
    <div class="alert alert-info" id="sub_check1">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                One Faculty can add only one Subject.
   </div>
   <div class="alert bg-pink alert-dismissible" role="alert" id="sub_del">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <center> <strong>Subject deleted Successfully. .</strong> </center>
  </div>
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>ADD SUBJECT</h2><br>
                    <p style="color: red;">Note: One faculty can add only one subject .</p>
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
                    <form id="form_validation" method="POST">
                        <div class="form-group form-float">
                            <div class="form-line">
                                <select name="faculty_email" id="faculty_email" class="form-control" required="">
                                    <option value="0" selected="" disabled="">Select Faculty</option>
                                    <%
                                        List<Faculty> list=FacultyModel.getAllFaculty();
                                        for(Faculty f:list){
                                            out.println("<option value="+f.getEmail()+">"+f.getFname()+"  "+f.getLname()+"</option>");
                                        }
                                    %>
                                </select>
                                
                                
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="name" id="name" required>
                                <label class="form-label">Subject Name</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="total_ques"  id="total_ques" required>
                                <label class="form-label">Total Question</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="total_time" id="total_time" required>
                                <label class="form-label">Total Time</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="total_marks" id="total_marks" required>
                                <label class="form-label">Total Marks</label>
                            </div>
                        </div>

                        <button class="btn btn-primary waves-effect" type="button" id="sub" name="action">SUBMIT</button>
                    </form><br><br>
                    <div id="msg" class="text-center" style="color:green;"></div>
                    <div id="msg1" class="text-center" style="color:green;"></div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#total_time").on("change", function(){
            var total_time=$(this).val(); 
            $("#total_time").val(total_time+" minutes");
        });
    });
</script>
<script>
    $(document).ready(function() {
        $("#sub_add").hide();
        $("#sub_check").hide();
        $("#sub_check1").hide();
         $("#sub_del").hide();
        $("#sub").on("click", function()
        {
            var faculty_email = $("#faculty_email").val();
            var name = $("#name").val();
            var total_ques = $("#total_ques").val();
            var total_time = $("#total_time").val();
            var total_marks = $("#total_marks").val();
            var fees = $("#fees").val();
            
            var action = $("#sub").val();

            if (name === "" || total_ques === "" || total_marks==="" || total_time==="" || fees==="" || faculty_email==="")
            {
                $("#msg").html("All Fields Are Mandatory.").css("color","red");
            }
            else
            {
                $.ajax({
                    url: "addSubject",
                    data: {faculty_email:faculty_email,name: name,total_ques:total_ques,total_marks:total_marks,total_time:total_time,fees:fees,action:action},
                    method: "POST",
                    success: function(data)
                    {
                        //alert(data);
                        var result = $.trim(data);
                        //alert(result);
                        if (result === "added")
                        {
                            $("#msg").html("Subject Added.").fadeOut(3000);
                            $("#sub_add").show();
                            $("#sub_add").fadeOut(3000);
                            $("sub_del").hide();
                            $("#form_validation").trigger("reset");
                            setTimeout(function() {// wait for 5 secs(2)
                            location.reload(); // then reload the page.(3)
                        }, 2000);
                        }
                        else if (result === "exist")
                        {
                             $("#msg").html("Subject Already exist.").fadeOut(3000);
                             $("#sub_check").show();
                             $("#sub_check").fadeOut(3000);
                             $("#sub_add").hide();
                             $("sub_del").hide();
                             $("#form_validation").trigger("reset");
                             setTimeout(function() {// wait for 5 secs(2)
                            location.reload(); // then reload the page.(3)
                        }, 2000);
                            
                        }
                        else if (result === "oops")
                        {
                             $("#msg1").html("One Faculty can add only one Subject.").fadeOut(3000);
                             $("#sub_check1").show();
                             $("#sub_check1").fadeOut(3000);
                             $("#sub_add").hide();
                             $("sub_del").hide();
                             $("#form_validation").trigger("reset");
                             setTimeout(function() {// wait for 5 secs(2)
                            location.reload(); // then reload the page.(3)
                        }, 2000);
                            
                        }
                        else if (result === "ok")
                        {
                            $("#msg").html("Subject Deleted.");
                            $("#sub_del").show();
                            $("#sub_check").hide();
                            $("#sub_add").hide();
                            $("#form_validation").trigger("reset");
                            setTimeout(function() {// wait for 5 secs(2)
                            location.reload(); // then reload the page.(3)
                        }, 2000);
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
