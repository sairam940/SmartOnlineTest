<%@page import="models.FacultyModel"%>
<%@page import="entities.Faculty"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Exportable Table -->

<%
    String deleted = (String) session.getAttribute("deleted");
    if (deleted != null) {
    session.removeAttribute("deleted");
%>
<div class="alert bg-pink alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <center> <strong>Faculty deleted Successfully.</strong>
    </center>
</div>
<%
    }
%>
<div class="alert bg-green alert-dismissible" role="alert" id="sub_up">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <center> <strong>Faculty Updated Successfully. .</strong> </center>
</div>
<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    VIEW FACULTY
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
                                <th>SR. NO</th>
                                <th>ID</th>
                                <th>FNAME</th>
                                <th>LNAME</th>
                                <th>EMAIL</th>
                                <th>Qualification</th>
                                <th>PHONE</th>
                                <th>EDIT</th>
                                <th>DELETE</th>

                            </tr>
                        </thead>

                        <tbody id="tbody">
                            <%   ArrayList<Faculty> list = FacultyModel.getAllFaculty();
                            int count=0;
                                for (Faculty s : list) {
                                    count++;
                                    int did = s.getId();
                            %>
                            <tr>
                                <td><%=count%></td>
                                <td id="id"><%=s.getId()%></td>
                                <td contenteditable="true" id="fname"><%=s.getFname()%></td>
                                <td contenteditable="true" id="lname"><%=s.getLname()%></td>
                                <td contenteditable="true" id="email"><%=s.getEmail()%></td>
                                <td contenteditable="true" id="qualification"><%=s.getQualification()%></td>
                                <td contenteditable="true" id="phone"><%=s.getPhone()%></td>
                                <td class="click"><a id="<%=did%>" class="pagerlink1 btn btn-success"><i class="glyphicon glyphicon-edit"></i></a></td>
                                <td><a id="<%=s.getId()%>" class="pagerlink btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a></td>
                                <!--<td><a id="<%=s.getId()%>" onclick="if(!confirm(\'Are you sure ou want to delete this faculty?\')) return false;" class="pagerlink btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a></td>-->
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
<script>
    $(document).ready(function()
    {
        $("#sub_del").hide();
        $('a.pagerlink').click(function()
        {
            var id = $(this).attr('id');
            var actio = "delete";
            if(confirm("Are you sure you want to delete this faculty?")){
            $(this).attr("href", "FacultyController?id=" + id + "&actio=" + actio);
            $("#sub_del").show().fadeOut(4000);
//            setTimeout(function(){// wait for 5 secs(2)
//           location.reload(); // then reload the page.(3)
//      }, 5000);
    }
    else{
        return false;
    }
        });
    });
</script>
<script>
    $(document).ready(function()
    {
        $('.getid').click(function()
        {
            var id = $(this).attr('id');
            //alert(id);
            $("#uid").val(id);
        });

    });

</script>
<script>
    $(document).ready(function() {
        var trdata = "";
        $("#sub_up").hide();
        $("#table_items").on('click', '.click', function() {
            // get the current row
            var currentRow = $(this).closest("tr");
            var id = currentRow.find("#id").html(); // get current row 1st table cell TD value
            var fname = currentRow.find("#fname").html(); // get current row 2nd table cell TD value
            var lname = currentRow.find("#lname").html(); // get current row 3nd table cell TD value
            var email = currentRow.find("#email").html(); // get current row 4nd table cell TD value
            var qualification = currentRow.find("#qualification").html(); // get current row 5nd table cell TD value
            var phone = currentRow.find("#phone").html(); // get current row 7nd table cell TD value

            var trdata = id + "," + fname + "," + lname + "," + email + "," + qualification + ","+ phone;
            //alert(trdata);
            var acti = "edit";
            $.ajax({
                method: "POST",
                url: "FacultyController",
                data: {all: trdata, act: acti},
                success: function(data, textStatus, jqXHR)
                {
                    var msg = $.trim(data);
                    //alert(msg);
                    if (msg === "updated")
                    {
                        $("#sub_up").show().fadeOut(3000);
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
