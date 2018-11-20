<%@page import="java.util.ArrayList"%>
<%@page import="models.AdminModel"%>
<%@page import="entities.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="alert alert-info" id="cp">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <center> <strong>Password Changed Successfully.</strong> </center>
</div>
<div class="alert alert-info" role="alert" id="sw">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <center> <strong>Something Went wrong .</strong> </center>
</div>
<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    CHANGE PASSWORD
                </h2>

            </div>
            <div class="body">
                <form>

                    <label for="email_address">Email</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="email" id="email_address" class="form-control" placeholder="Email"  value="<%=(String) session.getAttribute("user_email")%>" readonly="">
                        </div>
                    </div>
                    <label for="password">Old Password</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="password" id="opass" class="form-control" placeholder="Old Password">
                        </div>
                    </div>

                    <label for="password">Password</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="password" id="pass" class="form-control" placeholder="Password" >
                        </div>
                    </div>


                    <div class="form-group">
                        <div>
                            <input type="button" id="change" class="btn btn-primary" value="CHANGE">
                        </div>
                    </div>


                </form>
                        <div id="msg"></div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#cp").hide();
        $("#sw").hide();
        
        $("#change").on("click", function() {
            var email = $("#email_address").val();
            var opass = $("#opass").val();
            var pass = $("#pass").val();
            if(pass==="" || opass===""){
                //$("#sw").show();
                $("#sw").html("<center>Old and New password is required.</center>");
            }
            var ac = "change";

            $.ajax({
                method: "POST",
                url: "AdminController",
                data: {email:email,opass:opass,pass:pass,ac:ac},
                success: function(data, textStatus, jqXHR)
                {
                        //alert(data);
                        var result=$.trim(data);
                        if (result === "ok")
                        {
                            //$("#msg").html("<center>Password changed successfully..</center>");
                            $("#opass").val("");
                            $("#pass").val("");
                            $("#cp").show().fadeOut(4000);
                             $("#sw").hide();
                            //window.location.href="login.jsp";
                         
                        }
                        else
                        {
                            //$("#msg").html("<center>Something went wrong.</center>");
                            $("#sw").show().fadeOut(4000);;
                            $("#cp").hide();
                        }
                       
                }

            });

        });

    });

</script>