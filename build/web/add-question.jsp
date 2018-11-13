<%@page import="models.SubjectModel"%>
<%@page import="entities.Subject"%>
<%@page import="java.util.ArrayList"%>
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
        <jsp:include page="Fheader.jsp"></jsp:include>
    </head>

    <body class="login register">
    <div class="alert bg-green alert-dismissible" role="alert" id="que_add">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        Question Added Successfully.
    </div>
        <div class="col-sm-12">
            <div class="login-box">
                <div class="login-header">
                    <h2>Add Question</h2>
                </div>
                <form id="form_validation" method="POST">
                    <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">

                        <label class="form-label">
                            Faculty Name
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <input type="text" readonly="" value="<%=session.getAttribute("name")%>" class="form-control ml-24" placeholder="Faculty Name..." name="faculty_name" id="facultyName" required>
                        </div>

                        <label class="form-label">
                            Select Subject
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <select class="form-control ml-24" name="subject" id="subject">
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
                        <label class="form-label">
                            Question Set
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <select class="form-control ml-24" name="q_set" id="q_set">
                                    <option>Question Set</option>
                                    <option>A</option>
                                    <option>B</option>
                            </select>
                        </div>
                        <label class="form-label">
                            Question Level
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <select class="form-control ml-24" name="level" id="level">
                                    <option>Question Level</option>
                                    <option value="Easy">Easy</option>
                                    <option value="Hard">Hard</option>
                            </select>
                        </div>
                        <label class="form-label">
                            Subject ID
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                           <input type="text" class="form-control ml-24" name="sid" id="sid" readonly="" required>
                        </div>
                        <label class="form-label">
                            Question Number
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <input type="text" class="form-control ml-24" name="ques_no" id="ques_no" required>     
                        </div>
                        <label class="form-label">
                            Question
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <input type="text" class="form-control ml-24" name="question"  id="question" required>
                        </div>
                        <label class="form-label">
                            Option 1
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <input type="text" class="form-control ml-24" name="op1"  id="op1" required>
                        </div>
                         <label class="form-label">
                            Option 2
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <input type="text" class="form-control ml-24" name="op2"  id="op2" required>
                        </div>   
                         <label class="form-label">
                            Option 3
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <input type="text" class="form-control ml-24" name="op3"  id="op3" required>
                        </div>
                            <label class="form-label">
                            Option 4
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <input type="text" class="form-control ml-24" name="op4" id="op4" required>
                        </div>
                        <label class="form-label">
                           Select Answer
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"></span>
                            <div id="ansdata"></div>
                        </div>
                        <button class="btn btn-primary waves-effect" type="button" id="sub" name="action">ADD</button>
                    </div>
                </form><br>
                <div id="msg" class="text-center" style="color:green;"></div>
            </div>
        </div>
    </body>
</html>
<!-- javascript
                               ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
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
            var facultyName = $("#facultyName").val();
            //alert("subject"+subject);

            //alert("qno"+ques_no);

            var action = $("#sub").val();
            var level = $("#level").val();
            if (facultyName==="" || q_set === "" || subject === "" || question === "" || op1 === "" || op2 === "" || op3 === "" || op4 === "" || answer === "" || sid === "" || level === "")
            {
                $("#msg").html("All Fields Are Mandatory..").css("color", "red");
            }
            else
            {
                $.ajax({
                    url: "QuestionController",
                    data: {facultyName:facultyName,subject: subject, ques_no: ques_no, sid: sid, question: question, op1: op1, op2: op2, op3: op3, op4: op4, q_set: q_set, answer: answer, level: level, action: action},
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