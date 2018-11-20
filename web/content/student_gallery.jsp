<%@page import="models.StudentModel"%>
<%@page import="entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="container-fluid">
    <!-- Image Gallery -->
    <div class="block-header">
        <h2>


        </h2>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        STUDENT GALLERY

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
                    <div id="aniimated-thumbnials" class="list-unstyled row clearfix">
                        <%
                            ArrayList<Student> list = StudentModel.getStudent();
                            for (Student s : list) {
                                int did = s.getId();  
                        %>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" >
                            <a class="pagerlink" href="student-profile?id=<%=did%>" style="text-decoration:none;">
                                <img class="img-responsive thumbnail" src="<%=s.getPhoto()%>" style="height:150px">
                                <h4><center><%=s.getFname() + " " + s.getLname()%></center></h4>
                            </a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
