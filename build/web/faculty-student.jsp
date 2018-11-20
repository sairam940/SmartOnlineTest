<%@page import="java.util.List"%>
<%@page import="models.StudentModel"%>
<%@page import="entities.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Student</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="Fheader.jsp"></jsp:include>
        <!-- javascript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        </head>
        <body class="login">
        <div class="col-sm-12">
            <div class="login-box">
                <div class="login-header">
                    <h2>ADD STUDENT</h2>
                <%
                    String email = (String) session.getAttribute("femail");
                    if(email!=null){
                    String name = (String) session.getAttribute("name");
                    String subject = (String) session.getAttribute("subject");
                    
                   
                    if (session.getAttribute("error") == null) {

                    } else {
                        session.removeAttribute("error");
                        out.println("<center><div class='' style='color:red;font-size:20px;'>Oops! Something went wrong.</div></center>");
                    }
                   
                    if (session.getAttribute("success") == null) {

                    } else {
                        session.removeAttribute("success");
                        out.println("<center><div class='' style='color:red;font-size:20px;'>Student Added Successfully...</div></center>");
                    }
                    if (session.getAttribute("exist") == null) {

                    } else {
                        session.removeAttribute("exist");
                        out.println("<center><div class='' style='color:red;font-size:20px;'>Student Already Exist...</div></center>");
                    }
                %>
            </div>
            <form action="Faculty_StudentController" method="POST" id="login-form">
                 <div class="login-content" style="min-width: 100%;background-color:#DEDCDC;">
                        <label class="form-label">
                            Faculty Name:
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                            <input name="name" type="text" required readonly="" class="form-control ml-24" value="<%=name%>" aria-describedby="basic-addon1">
                            <input name="femail" type="hidden" value="<%=email%>" >
                        </div>
                        <label class="form-label">
                            Student Name: 
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                            <select class="form-control ml-24" name="email" id="email">
                                    <option>Select Student</option>
                                    <%
                                        List<Student> list = StudentModel.getStudent();
                                        for (Student s : list) {
                                    %>
                                    <option value="<%=s.getEmail()%>,<%=s.getFname()%> <%=s.getLname()%>"><%=s.getFname()%>&nbsp;<%=s.getLname()%></option>
                                    <%
                                        }
                                    %>
                            </select>
                        </div>
                        <label class="form-label">
                            Faculty Name:
                        </label>
                        <div class="input-group input-blue">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-info-sign"></i></span>
                            <input name="subject" type="text" required="" readonly="" class="form-control ml-24" value="<%=subject%>" aria-describedby="basic-addon1">
                            
                        </div><br>
                        <input class="btn-primary about-image" value="Submit"  name="submit" type="submit"><br>
                    </div>                  
            </form>
        </div>
</div>
                            <%
                            } else {
                        response.sendRedirect("faculty-login");
                    }
                %>
    </body>
</html>
