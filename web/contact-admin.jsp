<%@page import="java.util.Iterator"%>
<%@page import="entities.Chat"%>
<%@page import="models.ChatModel"%>
<%@page import="java.util.List"%>
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

            String name = "", email = "", phone = "", userType = "";
            String semail = (String) session.getAttribute("email");
            String femail = (String) session.getAttribute("femail");
            if (semail != null) {
                //out.println("in student");
                email = semail;
                userType = "Student";
                name = (String) session.getAttribute("sname");
                phone = (String) session.getAttribute("phone");
        %>
        <jsp:include page="SHeader.jsp"></jsp:include>
        <%
            }
            if (femail != null) {
                email = femail;
                userType = "Faculty";
                //out.println("in faculty");
                name = (String) session.getAttribute("name");
                phone = (String) session.getAttribute("phone");
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
                                    <%
                                        String added = (String) session.getAttribute("added");
                                        if (added != null) {
                                            session.removeAttribute("added");
                                            out.println("<br><center><h5>Your Comment Added.</h5></center>");
                                        } else {
                                        }
                                        String error = (String) session.getAttribute("error");
                                        if (error != null) {
                                            session.removeAttribute("error");
                                            out.println("<br><center><h5>Oops! Something went wrong.</h5></center>");
                                        } else {
                                        }
                                    %>
                        </div>

                        <div class="mid_content_section home_inner new_penal">
                            <div class="container-fluid">
                                <div class="inner-block"><hr>
                                    <div class="inner_heading">
                                        <h1>Contact Admin</h1>
                                    </div>
                                    <form action="ChatController" method="post">
                                        <textarea name="userComment" placeholder="Writer here..." rows="5" required="" style="min-width: 100%" class="form-control" cols="85"></textarea>
                                        <input type="hidden" name="email" value="<%=email%>">
                                        <input type="hidden" name="userType" value="<%=userType%>">
                                        <input type="hidden" name="phone" value="<%=phone%>">
                                        <input type="hidden" name="name" value="<%=name%>">
                                        <br><input class="btn-primary about-image" type="submit" name="submit" value="Submit">
                                    </form>
                                </div> 
                                <%
                                    List<Chat> cl = ChatModel.getChatByUserEmail(userType,email);
                                    Iterator ic = cl.iterator();
                                    if (ic.hasNext()) {
                                        out.println("<center><h3>Chat History</h3></center><hr style='height:1px;border:none;color:#333;background-color:#333;' />");
                                        while (ic.hasNext()) {
                                            Chat c = (Chat) ic.next();
                                %>
                                <p class="pull-left"><b><%=c.getName()%>:</b>&nbsp;<%=c.getUserComment()%>&nbsp;(<%=c.getCommentDate()%>)</p>
                                <% if (c.getAdminReply() == "" || (c.getAdminReply() == "")) {

                                    } else {
                                %>
                                <br><p class="pull-left"><b>---Admin:</b>&nbsp;<%=c.getAdminReply()%>&nbsp;(<%=c.getReplyDate()%>)</p>
                                <%
                                    }
                                %>
                                <br><br>  
                                <%
                                        }
                                    } else {
                                    }
                                %>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><br><br>


    </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>