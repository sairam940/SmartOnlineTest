<%@page import="models.Faculty_StudentModel"%>
<%@page import="entities.Faculty_Student"%>
<%@page import="models.StudentModel"%>
<%@page import="entities.Student"%>
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
    <center> <strong>Student deleted Successfully. .</strong>
    </center>
</div>
<%
    }else{}
%>

<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    VIEW STUDENT
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
                                <th>FACULTY NAME</th>
                                <th>STUDENT NAME</th>
                                <th>SUBJECT</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>

                        <tbody id="tbody">
                            <%  ArrayList<Faculty_Student> list = Faculty_StudentModel.getAllFaculty_Student();
                            int count=0;
                                for (Faculty_Student s : list) {
                                    count++;
                                    int did = s.getId();
                            %>
                            <tr>
                                <td><%=count%></td>
                                <td id="id"><%=s.getId()%></td>
                                <td id="name"><%=s.getFacultyName()%></td>
                                <td id="ques"><%=s.getStudentName()%></td>
                                <td id="email"><%=s.getSubject()%></td>   
                                <td><a id="<%=s.getId()%>" class="pagerlink btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a></td>
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
    $(document).ready(function()
    {
        $("#sub_del").hide();
        $('a.pagerlink').click(function()
        {
            var id = $(this).attr('id');
            var actio = "delete";
            if(confirm("Are you sure you want to delete this student?")){
            $(this).attr("href", "Faculty_StudentController?id=" + id + "&actio=" + actio);
                        setTimeout(function(){// wait for 5 secs(2)
           location.reload(); // then reload the page.(3)
      }, 2000);
        } else{
            return false;
        }
        });
    });

</script>
