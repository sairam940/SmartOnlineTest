<%@page import="models.ResultModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="entities.Subject"%>
<%@page import="models.StudentModel"%>
<%@page import="entities.Result"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid">

    <!-- Exportable Table -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        STUDENT RESULT
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
                                    <th>STUDENT</th>
                                    <th>SUBJECT</th>
                                    <th>TOTAL TIME</th>
                                    <th>TOTAL QUESTION</th>
                                    <th>TOTAL MARK</th>
                                    <th>QUESTION ATTEND</th>
                                    <th>MARK OBTAINED</th>
                                    <th>PERCENTAGE(%)</th>
                                    <th>LEVEL</th>
                                    <th>SET</th>
                                    <TH>REMARK</TH>
                                </tr>
                            </thead>

                            <tbody id="tbody">
                                <%
                                    try {
					ArrayList<Result> list=ResultModel.getAllResult();
					for(Result rs:list)
					{
                                %>
                                <tr>
                                    <td><%=rs.getId()%></td>
                                    <td><%=rs.getSname()%></td>
                                    <td><%=rs.getSubName()%></td>
                                    <td><%=rs.getTotalDuration()%></td>
                                    <td><%=rs.getTotalQuestion()%></td>
                                    <td><%=rs.getTotalMarks()%></td>
                                    <td><%=rs.getQuestionAttended()%></td>
                                    <td><%=rs.getMarksObtained()%></td>
                                    <td><%=rs.getPercentage()%></td>
                                    <td><%=rs.getQuesLevel()%></td>
                                    <td><%=rs.getQuesSet()%></td>
                                    <td><%=rs.getRemarks()%></td>
                                </tr>
                                <%
                                    } 
                                    }
                                    catch (Exception e) {
                                        System.out.println(e);
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
</div>