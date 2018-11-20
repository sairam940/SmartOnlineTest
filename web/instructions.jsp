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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Instructions</title>
        <jsp:include page="SHeader.jsp"></jsp:include>
    </head>
<body class="login"> 
    <br>
    <div class="container">
<%!
String sub_name;
%>        
<%
    String email=(String)session.getAttribute("email");
    if(email!=null){
            
            String name=(String)session.getAttribute("sname");
            String data = request.getParameter("values");
            String[] values = data.split(",");
            sub_name = values[0];
            System.out.println("sub_name="+sub_name);
            String total_time = values[1];
            int total_question = Integer.parseInt(values[2]);;
            int total_marks = Integer.parseInt(values[3]);
            session.setAttribute("sub_name", sub_name);
            session.setAttribute("total_question", total_question);
            session.setAttribute("total_time", total_time);
            session.setAttribute("total_marks", total_marks);
            boolean status=StudentModel.testCount(email, sub_name);
            if(!status) {
        %>
        
            <div class="container-fluid">
                <span id="t"><jsp:include page="timers.jsp"></jsp:include></span>
                                <div class="inner-block">
                                    <div class="dashboard-upper upper-detailsec">
                                        <ul class="test-detail">
                                            <li><span>Test name:</span><%=sub_name%></li>
                                            <li><span>Available time:</span><%=total_time%></li>
                                            <li><span>No of Questions:</span><%=total_question%></li>
                                            <li><span>Total Marks:</span><%=total_marks%></li>
                                        </ul>
                                    </div>                          
                                </div>
            </div>
                
                <fieldset>
                    <legend>Test Direction</legend>
                    <p>Your test will be start in few minute.Please go through the instructions carefully will also be accessible using the <b>'HELP'</b> button the whole duration of the Exam.</p>
                    <p>Your Exam ID for this exam is &nbsp;<b><%=name%> </b>Please note it down at a secure place for future reference.</p>
                <hr>
                <h3>Instructions:</h3>
                <ol type="1">
                    <li> Each module has a fixed number of questions and an alloted time.The time remaining for the module is shown
                        on the <b>right corner</b> of the screen throughout the exam.</li>
                    <li>You may take an <b>Emergency Break</b> at any other Time.However the time will <b>Not</b> stop in such
                        cases.</li>
                    <li>Be at your seat until the completion of the exam.Don't talk and do not indulge any cheating.Your condiature
                        may be <b>Canceled</b> for any infractions.</li>
                    <li>In case of any problem with the question please <b>Note</b> down it for share it with us with email after
                        you finish your test.</li>
                </ol>
                <ol type="1">
                    <h3>How to answer the question:</h3>
                    <li>Each question has direction on how to answer the question.</li>
                    <li>you can chose the appropriate answer by clicking the checkbox on it.</li>
                    <li>Once you have completed the Exam,press the submit button</li>
                </ol>
            </fieldset>
            <br>
            <center>
                <input type="submit" id="start_test" class="cancle_changes" onclick="window.location.href = 'level';" title="Start Test" value="Start Test"/> 
            </center>
</div>
                <br><br>
            <jsp:include page="footer.jsp" ></jsp:include>
    </body>
    
</html>
            <%
            } else{
                out.println("<div class='container'><h1 style='color:red;'><center>you have already given this test.</center></h1></div><br>");
                String referer = request.getHeader("Referer");
                out.println("<center><a class='btn-primary about-image' href='"+referer+"'>Go Back</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='btn-primary about-image' href='history?subName="+sub_name+"'>View its Result</a></center>");
            }
                } else {
                    response.sendRedirect("index");
                }
            %>
        
        