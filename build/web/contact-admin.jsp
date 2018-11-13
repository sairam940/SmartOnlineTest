<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Contact Admin</title>
    </head>
    <body class="login">
        <%
            String name="",email="",phone="";
            String semail=(String)session.getAttribute("email");
            String femail=(String)session.getAttribute("femail");
            if(semail!=null)
            {
                //out.println("in student");
                email=semail;
                name=(String)session.getAttribute("sname");
                phone=(String)session.getAttribute("phone");
                %>
                <jsp:include page="SHeader.jsp"></jsp:include>
                <%
                
            }
            if(femail!=null)
            {
                email=femail;
                //out.println("in faculty");
                name=(String)session.getAttribute("name");
                phone=(String)session.getAttribute("phone");
                %>
                <jsp:include page="Fheader.jsp"></jsp:include>
                <%
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
                                <h5 style="color:red;"><center>Welcome, <%=name%></center></h5>
                            </div>
                    
                            <div class="mid_content_section home_inner new_penal">
                                <div class="container-fluid">
                                    <div class="inner-block"><hr>
                                        <div class="inner_heading">
                                            <h1>Contact Admin</h1>
                                        </div>
                                        <form action="" method="post">
                                            <textarea name="yourComment" placeholder="Writer here..." rows="5" style="min-width: 100%" class="form-control" cols="85"></textarea>
                                            <input type="hidden" name="email" value="<%=email%>">
                                            <input type="hidden" name="phone" value="<%=phone%>">
                                            <input type="hidden" name="name" value="<%=name%>">
                                            <br><input class="btn-primary about-image" type="submit" name="submit" value="Submit">
                                        </form>
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