<%@page import="entities.Subject"%>
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
        <title>View Subject</title>
    </head>
    <body class="login">
        <jsp:include page="Fheader.jsp"></jsp:include>
        <%!
            String email,subName;
        %>
        <%
            email=(String)session.getAttribute("femail");
            int count=0;
            if(email!=null)
            {
            
        %>
            <hr>
            <div class="large-8 columns">
                <div class="mid_content_section home_inner new_penal">
                    <div class="container-fluid">
                        <div class="inner-block">
                            <div class="dashboard-upper">
                                <!-- flash message -->
                                <!--// flash message -->
                            </div>
                            <div class="mid_content_section home_inner new_penal">
                                <div class="container-fluid">
                                    <div class="inner-block"><hr>
                                        <div class="inner_heading">
                                            <h1>Subject List</h1>
                                        </div>
                                        <table class="table table-bordered">
                                            <tr>
                                                <th scope="col">Sr. No</th>
                                                <th scope="row">Subject</th>
                                            </tr>
                                            <%
                                                List<Subject> list=SubjectModel.subjectList();
                                                if(list!=null || !list.isEmpty()){
                                                for(Subject s:list){
                                                    subName=s.getName();
                                                    count++;
                                                    %>
                                            <tbody>
                                                <tr>    
                                                    <td><%=count%></td>
                                                    <td><a href="view-question?subName=<%=subName%>"><%=subName%></a></td>
                                                </tr>
                                            </tbody>
                                            <%
                                            
                                             }
            } else {
                out.println("<center><h1>Faculty Not Found.</h1></center>");
            }
                                            %>
                                        </table>
                                        
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