<%@page import="models.QuestionModel"%>
<%@page import="entities.Question"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.ResultModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Result"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Question</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/style.css">

    <style>
        tr,td,th{
            text-align: center;
        }
    </style>
</head>
<body class="login">
    <jsp:include page="Fheader.jsp"></jsp:include>
    <%
    String deleted = (String) session.getAttribute("deleted");
    if (deleted != null) {
        session.removeAttribute("deleted");
%>
<div class="alert bg-pink alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <center> <strong>Question deleted Successfully.</strong> </center>
</div>
<%
    }


%>
<div class="alert bg-green alert-dismissible" role="alert" id="sub_up">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <center> <strong>Question Updated Successfully.</strong> </center>
</div>
        <table id="myTable" class="table table-striped table-bordered" >
            <thead>
                <tr>
                                <th>Sr. No.</th>
                                <th>QUESTION ID</th>
                                <th>SUBJECT NAME</th>
                                <th>QUESTION NUMBER</th>
                                <th>QUESTION LEVEL</th>
                                <th>QUESTION SET</th>
                                <th>QUESTION</th>
                                <th>OPTION 1</th>
                                <th>OPTION 2</th>
                                <th>OPTION 3</th>
                                <th>OPTION 4</th>
                                <th>ANSWER</th>
                                <th>Added DATE</th>
                                <th>Action</th>
                </tr>
            </thead>
        <%
            String email = (String) session.getAttribute("femail");
            String facultyName = (String) session.getAttribute("name");
            if (email != null) {
                try {
                    int count = 0;
                    ArrayList<Question> al = QuestionModel.getQuestionByFacultyName(facultyName);
                    Iterator itr = al.iterator();
                    if (itr.hasNext()) {
                        while (itr.hasNext()) {
                            Question q=(Question)itr.next();
                            count++;
        %>

        <tbody>
            <tr>
                <td><%=count%></td>
                                <td id="id"><%=q.getId()%></td>
                                <td contenteditable="FALSE" id="subname"><%=q.getSubName()%></td>
                                <td contenteditable="FALSE" id="ques_number"><%=q.getQuesNumber()%></td>
                                <td contenteditable="true" id="level"><%=q.getQuesLevel()%></td>
                                <td contenteditable="true" id="q_set"><%=q.getQuesSet()%></td>
                                <td contenteditable="true" id="name"><%=q.getQuestion()%></td>
                                <td contenteditable="true" id="op1"><%=q.getOption1()%></td>
                                <td contenteditable="true" id="op2"><%=q.getOption2()%></td>
                                <td contenteditable="true" id="op3"><%=q.getOption3()%></td>
                                <td contenteditable="true" id="op4"><%=q.getOption4()%></td>
                                <td contenteditable="true" id="ans"><%=q.getAnswer()%></td>
                                <td contenteditable="false" id="added_date"><%=q.getAddedDate()%></td>
                                <td class="click"><a id="<%=q.getId()%>"  class="pagerlink1 btn btn-success"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;&nbsp;&nbsp;
                                <a class="pagerlink btn btn-danger" href="QuestionController?id=<%=q.getId()%>&&actio=delete" onclick="return confirm('Are you sure you want to delete this question?');"><i class="glyphicon glyphicon-trash"></i></a></td>
                            </tr>
           
            <%
                }
            } else {
            %>
        <center><h1>No Question Found.</h1></center>
            <%
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            %>
    </tbody>
</table>
<%            } else {
        response.sendRedirect("faculty-login.jsp");
    }
%>
</body>
</html>
<script>
    $(document).ready(function() {
        var trdata = "";
        $("#sub_up").hide();
        $("#table_items").on('click', '.click', function() {
            // get the current row
            var currentRow = $(this).closest("tr");
            var id = currentRow.find("#id").html(); // get current row 1st table cell TD value
            var ques = currentRow.find("#name").html(); // get current row 2nd table cell TD value
            var op1 = currentRow.find("#op1").html(); // get current row 3nd table cell TD value
            var op2 = currentRow.find("#op2").html(); // get current row 4nd table cell TD value
            var op3 = currentRow.find("#op3").html(); // get current row 5nd table cell TD value
            var op4 = currentRow.find("#op4").html(); // get current row 6nd table cell TD value
            var q_set = currentRow.find("#q_set").html(); // get current row 6nd table cell TD value
            var ans = currentRow.find("#ans").html(); // get current row 6nd table cell TD value
            var level = currentRow.find("#level").html();
            var upd = "2018-10-27"; // get current row 7nd table cell TD value
            var trdata = id + "," + ques + "," + op1 + "," + op2 + "," + op3 + "," + op4 + "," + q_set + "," + ans + "," + level + "," + upd;
            // alert(trdata);
            var acti = "edit";
            $.ajax({
                method: "POST",
                url: "QuestionController",
                data: {all: trdata, act: acti},
                success: function(data, textStatus, jqXHR)
                {
                    var msg = $.trim(data);
                    // alert(msg);
                    if (msg === "updated")
                    {
                        $("#sub_up").show();
                        $("#sub_up").fadeOut(4000);
                    }

                    trdata = "";

                }

            });


        });

    });
</script>