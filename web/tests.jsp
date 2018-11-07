<%@page import="java.util.UUID"%>
<%@page import="entities.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.SubjectModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Tests</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style3.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="SHeader.jsp"></jsp:include>
            <title>Instructions</title>
        </head>
        <body class="login">
        <%!
            String tokens;
        %>
        <%  
            tokens = UUID.randomUUID().toString().replace("-", "");
            HttpSession ses = request.getSession(false);
            String semail = (String) ses.getAttribute("email");
            if (semail != null) {

        %>
        <section id="inner-headline">
            <hr>
        </section>
        <!-- start middle section of page -->
        <!--<div class="middle_area">-->

        <div class="large-8 columns">
            <!-- mid content section start here -->

            <div class="mid_content_section home_inner new_penal">
                <div class="container-fluid">
                    <div class="inner-block">
                        <div class="dashboard-upper">
                            <!-- flash message -->
                            <!--// flash message -->
                        </div>
                        <div class="inner_heading">
                            <h1>Available Skill Tests</h1>
                        </div>

                        <table id="myTable" class="display test-grid">
                            <thead>
                                <tr class="heading-row">
                                    <th>Browse Tests</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <% ArrayList<Subject> al = SubjectModel.subjectList();
                                for (Subject s : al) {
                            %>
                            <tr>
                                <td id="name">
                                    <span id="sub_name"><%=s.getName()%></span>
                                    <p>
                                        Duration: <label id="total_time"><%=s.getTimeDuration()%></label>, No of Questions: <label id="total_question"><%=s.getTotalQuestion()%></label>
                                        , Total Marks: <label id="total_marks"><%=s.getTotalMarks()%></label>
                                    </p>
                                </td>
                                <td></td>
                                <td class="tt">
                                    <input type="submit" id="submit" name="submit" class="cancle_changes" value="Start Test" title="Start Test"/>
                                </td>
                            </tr>
                            <% } %>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <%                } else {
                response.sendRedirect("signin");
            }
        %>
        <br><br>
        <jsp:include page="footer.jsp"></jsp:include>
        </body>
    </html>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            var trdata = "";
            $("#myTable").on('click', '.tt', function() {

                // get the current row
                var currentRow = $(this).closest("tr");
                var ques = currentRow.find("#name span").html(); // get current row 2nd table cell TD value
                var ques1 = currentRow.find("#name p #total_time").html();
                var ques2 = currentRow.find("#name p #total_question").html();
                var ques3 = currentRow.find("#name p #total_marks").html()
                trdata = ques + "," + ques1 + "," + ques2+","+ques3;
                //alert(trdata);
                window.location.href = "info?values=" + trdata + "&tokens=<%=tokens%>";

            });
        });

</script>