
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
   <div class="alert bg-pink alert-dismissible" role="alert" id="sub_del">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <center> <strong>Subject deleted Successfully. .</strong> </center>
  </div>
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>ADD SUBJECT</h2>
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
                                <select name="faculty_name" id="faculty_name" class="form-control" required="">
                                    <option value="0" selected="" disabled="">Select Faculty</option>
                                    <%
                                        List<Faculty> list=FacultyModel.getAllFaculty();
                                        for(Faculty f:list){
                                            out.println("<option>"+f.getFname()+"  "+f.getLname()+"</option>");
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
         $("#sub_del").hide();
        $("#sub").on("click", function()
        {
            var faculty_name = $("#faculty_name").val();
            var name = $("#name").val();
            var total_ques = $("#total_ques").val();
            var total_time = $("#total_time").val();
            var total_marks = $("#total_marks").val();
            var fees = $("#fees").val();
            
            var action = $("#sub").val();

            if (name === "" || total_ques === "" || total_marks==="" || total_time==="" || fees==="" || faculty_name==="")
            {
                $("#msg").html("All Fields Are Mandatory.").css("color","red");
            }
            else
            {
                $.ajax({
                    url: "addSubject",
                    data: {faculty_name:faculty_name,name: name,total_ques:total_ques,total_marks:total_marks,total_time:total_time,fees:fees,action:action},
                    method: "POST",
                    success: function(data)
                    {
                        //alert(data);
                        var result = $.trim(data);
                        if (result === "added")
                        {
                            $("#msg").html("Subject Saved.").fadeOut(3000);
                            $("#sub_add").show();
                            $("#sub_add").fadeOut(3000);
                            $("sub_del").hide();
                            $("#form_validation").trigger("reset");
                        }
                        else if (result === "exist")
                        {
                             $("#msg").html("Subject Already exist.").fadeOut(3000);
                             $("#sub_check").show();
                             $("#sub_check").fadeOut(3000);
                             $("#sub_add").hide();
                             $("sub_del").hide();
                             $("#form_validation").trigger("reset");
                            
                        }
                        else if (result === "ok")
                        {
                            $("#msg").html("Subject Deleted.");
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
