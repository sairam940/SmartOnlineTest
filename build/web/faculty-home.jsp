<%@page import="models.SubjectModel"%>
<%@page import="models.FacultyModel"%>
<%@page import="entities.Faculty"%>
<%@page import="java.util.List"%>
<%@page import="models.StudentModel"%>
<%@page import="entities.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Faculty-Home</title>
    </head>
    <body class="login">
        <jsp:include page="Fheader.jsp"></jsp:include>
        <%!
            String email,fname,lname,qualification,phone,subject,facultyName;
        %>
        <%
            email=(String)session.getAttribute("femail");
            if(email!=null)
            {
            List<Faculty> list=FacultyModel.getFacultyProfile(email);
            if(list!=null || !list.isEmpty()){
                for(Faculty f:list){
                    fname=f.getFname();
                    lname=f.getLname();
                    email=f.getEmail(); 
                    phone=f.getPhone();
                    qualification=f.getQualification();
                }
            } else {
                out.println("<center><h1>Faculty Not Found.</h1></center>");
            }
            facultyName=fname+" "+lname;
            subject=SubjectModel.subjectAssigned(facultyName);
        %>
            <hr>
            <div class="large-8 columns">
                <div class="mid_content_section home_inner new_penal">
                    <div class="container-fluid">
                        <div class="inner-block">
                            <div class="dashboard-upper">
                                <!-- flash message -->
                                <!--// flash message -->
                                <h5 style="color:red;"><center>Welcome, <%=fname%>&nbsp;<%=lname%></center></h5>
                            </div>
                            <div class="mid_content_section home_inner new_penal">
                                <div class="container-fluid">
                                    <div class="inner-block"><hr>
                                        <div class="inner_heading">
                                            <h1>Faculty Profile</h1>
                                        </div>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th scope="col">First Name</th>
                                                    <td><%=fname%></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Last Name</th>
                                                    <td><%=lname%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Email</th>
                                                    <td><%=email%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Qualification</th>
                                                    <td colspan="2"><%=qualification%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Subject Assigned</th>
                                                    <td colspan="2"><%=subject%></td>
                                                </tr> 
                                                <tr>
                                                    <th scope="row">Phone</th>
                                                    <td colspan="2"><%=phone%></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <input class="btn-primary about-image" onclick="window.location.href = 'profile';" type="submit" value="Edit Profile">
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><br><br>
        </body>

<%
            }else {
                response.sendRedirect("faculty-login");
            }
%>
    <jsp:include page="footer.jsp"></jsp:include>
</html>