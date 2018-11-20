<%@page import="models.QuestionModel"%>
<%@page import="entities.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Subject"%>
<%@page import="models.SubjectModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Exportable Table -->

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
<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    VIEW QUESTION
                </h2>
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
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover dataTable js-exportable" id="table_items">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>SUBJECT NAME</th>
                                <th>QUESTION NUMBER</th>
                                <th>LEVEL</th>
                                <th>QUESTION</th>

                                <th>OPTION 1</th>
                                <th>OPTION 2</th>
                                <th>OPTION 3</th>
                                <th>OPTION 4</th>
                                <th>QUESTION SET</th>
                                <th>ANSWER</th>

                                <th>UPDATED DATE</th>

<!--                                <th>EDIT</th>
                                <th>DELETE</th>-->
                            </tr>
                        </thead>

                        <tbody id="tbody">
                            <%                                 ArrayList<Question> list = QuestionModel.getQuestion();
                                for (Question s : list) {
                                    int did = s.getId();


                            %>
                            <tr>
                                <td id="id"><%=s.getId()%></td>
                                <td contenteditable="FALSE" id="subname"><%=s.getSubName()%></td>
                                <td contenteditable="FALSE" id="ques_number"><%=s.getQuesNumber()%></td>
                                <td  id="level"><%=s.getQuesLevel()%></td>
                                <td  id="name"><%=s.getQuestion()%></td>
                                <td  id="op1"><%=s.getOption1()%></td>
                                <td  id="op2"><%=s.getOption2()%></td>
                                <td  id="op3"><%=s.getOption3()%></td>
                                <td  id="op4"><%=s.getOption4()%></td>
                                <td  id="q_set"><%=s.getQuesSet()%></td>
                                <td  id="ans"><%=s.getAnswer()%></td>
                                <td  id="upd"><%=s.getUpdatedDate()%></td>
<!--                                <td class="click"><a id="<%=did%>"  class="pagerlink1 btn btn-success"><i class="glyphicon glyphicon-edit"></i></a></td>
                                
                                <td><a class="pagerlink btn btn-danger" href="QuestionController?id=<%=s.getId()%>&&actio=delete" onclick="return confirm('Are you sure you want to delete this question?');"><i class="glyphicon glyphicon-trash"></i></a></td>-->
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- #END# Exportable Table -->

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
            var upd = currentRow.find("#upd").html(); // get current row 7nd table cell TD value
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
                        setTimeout(function() {// wait for 5 secs(2)
                            location.reload(); // then reload the page.(3)
                        }, 2000);
                    }

                    trdata = "";

                }

            });


        });

    });
</script>
<!--<script type="text/javascript">
    $(document).ready(function()
    {
        $('a.pagerlink').click(function()
        {
            alert("100");
            var id = $(this).attr('id');
            var actio = "delete";
            if(confirm("Are you sure you want to delete this subject?")){
                $(this).attr("href", "QuestionController?id=" + id + "&actio=" + actio);
            $("#sub_del").show().fadeOut(4000);
            }else{
                return false;
            }                
        });

    });
  
</script>-->