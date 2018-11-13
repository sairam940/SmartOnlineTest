<%@page import="models.StudentModel"%>
<%@page import="entities.Result"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="container-fluid">
    <div class="well well-sm">
        <h2>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="result.jsp">Result Management</a></li>
                <li class="breadcrumb-item">Result</li>
                 <li class="breadcrumb-item active">Student Result</li>
            </ol>
        </h2>
    </div>

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
                                <th>QUESTION</th>
                                <th>OPTION 1</th>
                                <th>OPTION 2</th>
                                <th>OPTION 3</th>
                                <th>OPTION 4</th>
                                <th>ANSWER</th>
                                <th>LEVEL</th>
                                <th>UPDATED DATE</th>
                                <th>EDIT</th>
                                <th>DELETE</th>
                            </tr>
                        </thead>

                        <tbody id="tbody">
                             <%
                                ArrayList<Result> lis =StudentModel.getStudentResult();
                                for (Result s : lis)
                                {
                                    int did = s.getId(); 
                             %>
                            <tr>

                                <td id="id"><%=s.getId()%></td>
                                
                                <td contenteditable="true" id="name"><%=s.getSname()%></td>
                                <td contenteditable="true" id="op1"></td>
                                <td contenteditable="true" id="op2"></td>
                                <td contenteditable="true" id="op3"></td>
                                <td contenteditable="true" id="op4"></td>
                                <td contenteditable="true" id="ans"></td>
                                <td contenteditable="true" id="level"></td>
                                <td contenteditable="true" id="upd"></td>
                                <td class="click"><a id="<%=did%>" class="pagerlink1 btn btn-success"><i class="glyphicon glyphicon-edit"></i></a></td>
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
</div>