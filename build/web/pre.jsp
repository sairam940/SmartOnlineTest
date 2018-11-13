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
        <title>Instructions</title>
    </head>
    <body class="login">
        <jsp:include page="SHeader.jsp"></jsp:include>
        <%!
            String email,fname,lname,age,dob,gender,phone,photo;
        %>
        <%
            email=(String)session.getAttribute("email");
            List<Student> list=StudentModel.getProfile(email);
            if(list!=null || !list.isEmpty()){
                for(Student st:list){
                    fname=st.getFname();
                    lname=st.getLname();
                    email=st.getEmail();
                    age=st.getAge();
                    dob=st.getDob();
                    gender=st.getGender();
                    phone=st.getPhone();
                    photo=st.getPhoto();
                }
            } else {
                response.sendRedirect("index");
            }
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
                    <div class="form-group">
                        <div class="col-sm-6 col-md-6 col-lg-12 text-center" >
                            <img src="<%=photo%>" class="img img-responsive" style="width:120px;height:80px;"/>
                        </div>
                    </div>
                            <div class="mid_content_section home_inner new_penal">
                                <div class="container-fluid">
                                    <div class="inner-block"><hr>
                                        <div class="inner_heading">
                                            <h1>Student Profile</h1>
                                        </div>
                                        <table class="table table-bordered table-responsive" style="min-width: 100%;">
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
                                                    <th scope="row">DOB</th>
                                                    <td colspan="2"><%=dob%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Age</th>
                                                    <td colspan="2"><%=age%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Gender</th>
                                                    <td colspan="2"><%=gender%></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Phone</th>
                                                    <td colspan="2"><%=phone%></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <input class="btn-primary about-image" onclick="window.location.href = 'tests';" type="submit" value="Proceed">
                                        &nbsp;&nbsp;<input class="btn-primary about-image" onclick="window.location.href = 'profile';" type="submit" value="Edit Profile">
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><br><br>
        </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>