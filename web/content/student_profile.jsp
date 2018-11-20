<%@page import="models.StudentModel"%>
<%@page import="entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.AdminModel"%>
<%@page import="entities.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    STUDENT PROFILE
                </h2>

            </div>
            <div class="body">

                <form>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        //out.println(id);
                        ArrayList<Student> list = StudentModel.getStudentById(id); 
                        for (Student s : list) {
                    %>
                    <img class="pull pull-right" src="<%=s.getPhoto()%>" style="width:130px;height:80px"/><br><br><br>


                    <label>FIRST NAME</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="text" id="email_address" class="form-control"  value="<%=s.getFname()%>" readonly="">
                        </div>
                    </div>
                    <label>LAST NAME</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="email" id="password" class="form-control"  value="<%=s.getLname()%>" readonly="">
                        </div>
                    </div>

                    <label>EMAIL</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="email" id="password" class="form-control"  value="<%=s.getEmail()%>" readonly="">
                        </div>
                    </div>

                    <label>PHONE</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="text" id="password" class="form-control" value="<%=s.getPhone()%>" readonly="">
                        </div>
                    </div>

                    <label>DOB</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="text" id="password" class="form-control"  value="<%=s.getDob()%>" readonly="">
                        </div>
                    </div>

                    <label>AGE</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="text" id="password" class="form-control" value="<%=s.getAge()%>" readonly="">
                        </div>
                    </div>

                    <label>GENDER</label>
                    <div class="form-group">
                        <div class="form-line">
                            <input type="text" id="password" class="form-control" value="<%=s.getGender()%>" readonly="">
                        </div>
                    </div>
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
    </div>
</div>
