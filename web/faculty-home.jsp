<%@page import="java.util.Iterator"%>
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
<%@page import="entities.Result"%>
<%@page import="models.ResultModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <title>Faculty-Home</title>
    </head>
    <body class="login">
        <jsp:include page="Fheader.jsp"></jsp:include>
        <%!
            String email, fname, lname, qualification, phone, subject, facultyName;
        %>
        <%
            email = (String) session.getAttribute("femail");
            if (email != null) {
                List<Faculty> list = FacultyModel.getFacultyProfile(email);
                if (list != null || !list.isEmpty()) {
                    for (Faculty f : list) {
                        fname = f.getFname();
                        lname = f.getLname();
                        email = f.getEmail();
                        phone = f.getPhone();
                        qualification = f.getQualification();
                    }
                } else {
                    out.println("<center><h1>Faculty Not Found.</h1></center>");
                }
                facultyName = fname + " " + lname;
                subject = SubjectModel.subjectAssigned(email);
                List<Subject> al = SubjectModel.getSubjectDetail(subject);
                int totalQuestion = 0, totalMarks = 0;
                String timeDuration = "";
                for (Subject s : al) {
                    totalQuestion = s.getTotalQuestion();
                    totalMarks = s.getTotalMarks();
                    timeDuration = s.getTimeDuration();
                }
                System.out.println(subject + " " + totalQuestion + " " + totalMarks + " " + timeDuration);
                session.setAttribute("subject", subject);
                session.setAttribute("totalQuestion", totalQuestion);
                session.setAttribute("totalMarks", totalMarks);
                session.setAttribute("timeDuration", timeDuration);
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
                                <hr>
                                <jsp:include page="newjsp2.jsp"></jsp:include>
                                <%!
                                    String pieChartData = "", lineChartData = "", areaChartData = "", histoChartData = "", barChartData = "";
                                %> 
                                <hr>
                                <%
                                    List<Result> list1 = ResultModel.getPassCountBySubjectName(subject);
                                    int pass_count = 0;
                                    String bdata = "";
                                    for (Result rs : list1) {
                                        String pass = "Pass";
                                        pass_count += 1;
                                        bdata = "['Pass'," + pass_count + "]" + ",";
                                        barChartData = bdata;
                                        barChartData = barChartData.substring(0, barChartData.length() - 1);
                                    }
                                %>
                                <div id="bar_chart" height="250"></div>
                                <hr>
                                <%
                                    List<Result> list2 = ResultModel.getFailCountBySubjectName(subject);
                                    int fail_count = 0;
                                    String ldata = "";
                                    for (Result rs : list2) {

                                        String fail = "Fail";
                                        fail_count += 1;
                                        ldata = "['Fail'," + fail_count + "]" + ",";
                                        lineChartData = ldata;
                                        //System.out.print("edata3" + str3);
                                        lineChartData = lineChartData.substring(0, lineChartData.length() - 1);
                                        //System.out.println(str3);
                                    }
                                %>
                                <div id="line_chart" height="250"></div><hr>
                                <%
                                    String adata = "";
                                    Session s = HibernateUtil.getSessionFactory().openSession();
                                    s.beginTransaction();
                                    String SQL_QUERY = "select fs.subject,count(fs.studentName) from Faculty_Student fs group by fs.subject";
                                    Query query = s.createQuery(SQL_QUERY);
                                    for (Iterator it = query.iterate(); it.hasNext();) {
                                        Object[] row = (Object[]) it.next();
                                        System.out.print("Subject Name: " + row[0]);
                                        System.out.println(" | Number of Students: " + row[1]);
                                        adata += "['" + row[0] + "'," + row[1] + "],";
                                    }
                                    areaChartData = adata;
                                    System.out.println("adata="+adata);
                                    areaChartData = areaChartData.substring(0, areaChartData.length() - 1);
                                    System.out.println("areaChartData==="+areaChartData);
                                    s.getTransaction().commit();
                                    s.close();
                                %>
                                <div id="radar_chart" height="250"></div>
                                <hr>
                                <%
                                    String data = "";
                                    List<Result> lists = ResultModel.studentScores();
                                    System.out.println("size=" + lists.size());
                                    for (Result r : lists) {
                                        data += "['" + r.getSubName() + "'," + r.getMarksObtained() + "],";
                                    }
                                    pieChartData = data;
                                    pieChartData = pieChartData.substring(0, pieChartData.length() - 1);
                                    System.out.println("pieChartData==" + pieChartData);

                                %> 
                                <div id="piechart_3d" style="width: 700px; height: 400px;"></div>
                                <hr><br>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%    } else {
                response.sendRedirect("faculty-login");
            }
        %>
    </body> 
    <script type="text/javascript">
        // Load google charts
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        // Draw the chart and set the chart values
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'NUMBER OF STUDENTS PASS'],
        <%=barChartData%>
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = {'title': 'NUMBER OF STUDENTS PASS IN SUBJECT <%=subject%>', 'width': 400, 'height': 300};

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.BarChart(document.getElementById('bar_chart'));
            chart.draw(data, options);
        }
    </script>
    <script type="text/javascript">
        // Load google charts
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        // Draw the chart and set the chart values
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'NUMBER OF STUDENTS FAIL'],
        <%=lineChartData%>
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = {'title': 'NUMBER OF STUDENTS FAIL IN SUBJECT <%=subject%>', 'width': 400, 'height': 300};

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.LineChart(document.getElementById('line_chart'));
            chart.draw(data, options);
        }
    </script>
    <script type="text/javascript">
        // Load google charts
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        // Draw the chart and set the chart values
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'NO. OF STUDENTS IN PARTICULAR SUBJECT'],
        <%=areaChartData%>
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = {'title': 'NO. OF STUDENTS IN PARTICULAR SUBJECT', 'width': 400, 'height': 300};

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.AreaChart(document.getElementById('radar_chart'));
            chart.draw(data, options);
        }
    </script>
    <!-- Pie Chart -->         
    <script type="text/javascript">
        google.charts.load("current", {packages: ["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'MARK OBTAIN:'],
        <%=pieChartData%>
            ]);

            var options = {
                title: 'HIGHEST MARKS OBTAIN IN PARTICULAR EXAM',
                is3D: true
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>
    <!-- #END# Pie Chart -->

    <jsp:include page="footer.jsp"></jsp:include>
</html>