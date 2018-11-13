<%@page import="models.SubjectModel"%>
<%@page import="entities.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<div class="container-fluid">

    <div class="alert bg-green alert-dismissible" role="alert" id="que_add">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        Question Added Successfully.
    </div>

    <!-- Basic Validation -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>ADD Question</h2>
                    <ul class="header-dropdown m-r--5">
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
                                <select class="form-control" name="subject" id="subject">
                                    <option>Select Subject</option>
                                    <%
                                        ArrayList<Subject> list = SubjectModel.getSubject();
                                        for (Subject s : list) {
                                    %>
                                    <option><%=s.getName()%></option>
                                    <%
                                        }
                                    %>

                                </select>

                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" readonly="" class="form-control" name="faculty_name" id="fid" required>
                                <label class="form-label">Faculty Name</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <select class="form-control" name="q_set" id="q_set">
                                    <option>Question Set</option>
                                    <option>A</option>
                                    <option>B</option>
                                </select>
                            </div>

                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <select class="form-control" name="level" id="level">
                                    <option>Question Level</option>
                                    <option value="Easy">Easy</option>
                                    <option value="Hard">Hard</option>
                                </select>
                            </div>

                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="sid"  id="sid" readonly="" required>
                                <label class="form-label">Subject Id</label>
                            </div>
                        </div>
                        <div class="form-group form-float">

                            <div class="form-line">
                                <input type="text" class="form-control" name="ques_no"  id="ques_no"  required>
                                <label class="form-label">Question Number</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="question"  id="question" required>
                                <label class="form-label">Question</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="op1"  id="op1" required>
                                <label class="form-label">Option 1</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="op2"  id="op2" required>
                                <label class="form-label">Option 2</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="op3"  id="op3" required>
                                <label class="form-label">Option 3</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="op4"  id="op4" required>
                                <label class="form-label">Option 4</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div id="ansdata">
                            </div>
                        </div>
                        <button class="btn btn-primary waves-effect" type="button" id="sub" name="action">ADD</button>
                    </form><br><br>
                    <div id="msg" class="text-center" style="color:green;"></div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>

    $(document).ready(function() {
        $("#op4").on("change", function() {
            var op1 = $("#op1").val();
            var op2 = $("#op2").val();
            var op3 = $("#op3").val();
            var op4 = $("#op4").val();

            for (var j = 1; j <= 4; j++)
            {
                $("#ansdata").addClass("form-line");
                $("#ansdata").html("<select class='form-control' name='answer' id='answer' required><option value=''>Select Answer</option><option>" + op1 + "</option><option>" + op2 + "</option><option>" + op3 + "</option><option>" + op4 + "</option></select>");
            }
        });

    });
    $(document).ready(function() {
        $("#level").on("change", function() {
            var sub = $("#subject").val();
            var q_set = $("#q_set").val();
            var level = $("#level").val();
            //alert(sub+" "+q_set+""+level);
            var action = "getQuesNo";

            $.ajax({
                method: "POST",
                url: "QuestionController",
                data: {subject: sub, set: q_set, level: level, ac: action},
                success: function(data, textStatus, jqXHR)
                {
                    //alert(action+"vinay");
                    //alert(data);
                    var sub_id = $.trim(data);
                    $("#ques_no").val(sub_id);
                }

            });

        });

    });
    $(document).ready(function() {
        $("#subject").on("change", function() {
            var sub = $("#subject").val();

            //alert(sub);
            var action = "getQuesNo";

            $.ajax({
                method: "POST",
                url: "addSubject",
                data: {subject: sub, ac: action},
                success: function(data, textStatus, jqXHR)
                {
                    //alert(action+"vinay");
                    //alert(data);
                    var sub_id = $.trim(data);
                    $("#sid").val(sub_id);
                }

            });

        });

    });


    $(document).ready(function()
    {
        $("#que_add").hide();
        $("#sub").on("click", function()
        {
            var subject = $("#subject").val();
            var question = $("#question").val();
            var sid = $("#sid").val();
            var op1 = $("#op1").val();
            var op2 = $("#op2").val();
            var op3 = $("#op3").val();
            var op4 = $("#op4").val();
            var q_set = $("#q_set").val();
            var answer = $("#answer").val();
            var ques_no = $("#ques_no").val();
            //alert("subject"+subject);

            //alert("qno"+ques_no);

            var action = $("#sub").val();
            var level = $("#level").val();
            if (q_set === "" || subject === "" || question === "" || op1 === "" || op2 === "" || op3 === "" || op4 === "" || answer === "" || sid === "" || level === "")
            {
                $("#msg").html("All Fields Are Mandatory..").css("color", "red");
                ;
            }
            else
            {
                $.ajax({
                    url: "QuestionController",
                    data: {subject: subject, ques_no: ques_no, sid: sid, question: question, op1: op1, op2: op2, op3: op3, op4: op4, q_set: q_set, answer: answer, level: level, action: action},
                    method: "POST",
                    success: function(data)
                    {
                        //alert(data);
                        var result = $.trim(data);
                        if (result === "ok")
                        {
                            $("#msg").html("Question Added Successfully.");
                            $("#que_add").show().fadeOut(2000);
                            $("#form_validation").trigger("reset");
                            setTimeout(function()
                            {
                                window.location.reload();

                            }, 4000);
                        }
                        else if (result === "exist")
                        {
                            $("#msg").html("Question Already exist.");
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

