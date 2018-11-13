<%@page import="java.util.List"%>
<%@page import="models.ContactModel"%>
<%@page import="entities.Contact"%>
<%@page import="models.ResultModel"%>
<%@page import="DB.DB"%>
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
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Message</th>
                                    <th>Added Date</th>
                                </tr>
                            </thead>

                            <tbody id="tbody">
                                <%
                                    try {
					List<Contact> list=ContactModel.getContact();
					for(Contact c:list)
					{
                                %>
                                <tr>
                                    <td><%=c.getId()%></td>
                                    <td><%=c.getName()%></td>
                                    <td><%=c.getEmail()%></td>
                                    <td><%=c.getPhone()%></td>
                                    <td><%=c.getMessage()%></td>
                                    <td><%=c.getAddedDate()%></td>
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