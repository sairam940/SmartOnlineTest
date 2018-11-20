<%@page import="models.FacultyModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="models.ResultModel"%>
<%@page import="entities.Result"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.StudentModel"%>
<%@page import="models.SubjectModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <div class="container-fluid">
        <div class="block-header">
            <h2>DASHBOARD</h2>
        </div>
        <!-- Widgets -->
        <div class="row clearfix">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="info-box bg-light-green hover-expand-effect">
                    <div class="icon">
                        <i class="material-icons">person_add</i>
                    </div>
                    <div class="content">
                        <%
                            long facultyCount = 0l;
                            facultyCount = FacultyModel.facultyCount();
                        %>
                        <div class="text">TOTAL FACULTY</div>
                        <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"><h4><span class="badge" style="color:wheat;"><%=facultyCount%></span></h4></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="info-box bg-cyan hover-expand-effect">
                    <div class="icon">
                        <i class="material-icons">book</i>
                    </div>
                    <div class="content">

                        <div class="text">TOTAL SUBJECT</div>
                        <%
                            long count1 = 0l;
                            count1 = SubjectModel.getSubjectCount();
                        %>
                        <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"><span class="badge" ><%=count1%></span></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="info-box bg-light-green hover-expand-effect">
                    <div class="icon">
                        <i class="material-icons">person_add</i>
                    </div>
                    <div class="content">
                        <%
                            long count = 0l;
                            count = StudentModel.studentCount();
                        %>
                        <div class="text">TOTAL STUDENT</div>
                        <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"><h4><span class="badge" style="color:wheat;"><%=count%></span></h4></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="height:auto">
                <div class="info-box bg-orange hover-expand-effect">
                    <div class="icon">
                        <i class="material-icons">perm_contact_calendar</i>
                    </div>
                    <div class="content" style="margin-top: -5px;">
                        <div class="text"> </div>
                        <div id="Date" style="font-size:15px;"></div>
                        <div class="digital-clock" style="font-size:15px;">00:00:00</div>
                        <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Widgets -->


        <div class="row clearfix">
            <!-- Task Info -->
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="card">
                    <div class="header">
                        <h2>RECENT EXAM RESULT</h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="table-responsive">
                            <table class="table table-hover dashboard-task-infos">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>STUDENT</th>
                                        <th>SUBJECT</th>
                                        <th>TOTAL TIME</th>
                                        <th>TOTAL QUESTION</th>
                                        <th>TOTAL MARK</th>
                                        <th>QUESTION ATTENDED</th>
                                        <th>MARK OBTAINED</th>
                                        <th>PERCENTAGE (%)</th>
                                        <th>LEVEL</th>
                                        <th>SET</th>
                                        <TH>REMARK</TH>
                                    </tr>
                                </thead>
                                <%!
                                    String str = "";
                                    String edata = "";

                                    String str1 = "";
                                    String edata1 = "";

                                    String str2 = "";
                                    String edata2 = "";

                                    String str3 = "";
                                    String edata3 = "";
                                %>
                                <%
                                    List<Result> list = ResultModel.getResult1();
                                    for (Result rs : list) {
                                %>
                                <tr>
                                    <td><%=rs.getId()%></td>
                                    <td><%=rs.getSname()%></td>
                                    <td><%=rs.getSubName()%></td>
                                    <td><%=rs.getTotalDuration()%></td>
                                    <td><%=rs.getTotalQuestion()%></td>
                                    <td><%=rs.getTotalMarks()%></td>
                                    <td><%=rs.getQuestionAttended()%></td>
                                    <td><%=rs.getMarksObtained()%></td>
                                    <td>
                                        <%
                                            if (rs.getPercentage() <35) {
                                        %>   
                                        <div class="progress" style="height:20px;">
                                            <div class="progress-bar bg-red" role="progressbar" aria-valuenow="<%=rs.getPercentage()%>" title="<%=rs.getPercentage()%>%" aria-valuemin="0" aria-valuemax="100" style="width:<%=rs.getPercentage()%>%">
                                                <%=rs.getPercentage()%>%
                                            </div>
                                        </div>
                                        <%
                                        } 
                                            else 
                                            {
                                        %>
                                        <div class="progress" style="height:20px;">
                                            <div class="progress-bar bg-green" role="progressbar" aria-valuenow="<%=rs.getPercentage()%>" title="<%=rs.getPercentage()%>%" aria-valuemin="0" aria-valuemax="100" style="width:<%=rs.getPercentage()%>%">
                                                <%=rs.getPercentage()%>%
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>

                                    </td>
                                    <td><%=rs.getQuesLevel()%></td>
                                    <td><%=rs.getQuesSet()%></td>
                                    <%
                                        if (rs.getRemarks().equalsIgnoreCase("pass")) {
                                    %>
                                    <td><span class="label bg-green" ><%=rs.getRemarks()%></span></td>
                                        <%
                                        } else {
                                        %>
                                    <td><span class="label bg-red" ><%=rs.getRemarks()%></span></td>

                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                        edata += "[" + (char) 34 + rs.getSubName() + (char) 34 + "," + rs.getPercentage() + "]" + ",";
                                        str = edata;
                                        //System.out.print("edata" + str);
                                        str = str.substring(0, str.length() - 1);

                                        //System.out.println(str);

                                        edata1 += "[" + (char) 34 + rs.getSubName() + (char) 34 + "," + rs.getMarksObtained()+ "]" + ",";
                                        str1 = edata1;
                                        //System.out.print("edata1" + str1);
                                        str1 = str1.substring(0, str1.length() - 1);

                                        //System.out.println(str1);

                                    }

                                    edata = "";
                                    edata1 = "";
                                    List<Result> list1 = ResultModel.getPassCount();
                                    int pass_count = 0;
                                    for (Result rs : list1) {
                                        String pass = "Pass";
                                        pass_count += 1;
                                        edata2 = "[" + (char) 34 + pass + (char) 34 + "," + pass_count + "]" + ",";
                                        str2 = edata2;
                                        str2 = str2.substring(0, str2.length() - 1);
                                    }
                                    edata = "";
                                    edata1 = "";
                                    edata2 = "";
                                    List<Result> list2 = ResultModel.getFailCount();
                                    int fail_count = 0;
                                    for (Result rs : list2) {
                                
                                        String fail = "Fail";
                                        fail_count += 1;
                                        edata3 = "[" + (char) 34 + fail + (char) 34 + "," + fail_count + "]" + ",";
                                        str3 = edata3;
                                        //System.out.print("edata3" + str3);
                                        str3 = str3.substring(0, str3.length() - 1);
                                        //System.out.println(str3);
                                    }

                                    edata = "";
                                    edata1 = "";
                                    edata2 = "";
                                    edata3 = "";

                                %>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Task Info -->
            <!-- Browser Usage -->

            <!-- #END# Browser Usage -->
        </div>

    </div>

    <div class="container-fluid">
        <div class="block-header">
            <h2>

            </h2>
        </div>
        <div class="row clearfix">
            <!-- Line Chart -->
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>LINE CHART</h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div id="line_chart" height="150"></div>
                    </div>
                </div>
            </div>
            <!-- #END# Line Chart -->
            <!-- Bar Chart -->
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>BAR CHART</h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div id="bar_chart" height="150"></div>
                    </div>
                </div>
            </div>
            <!-- #END# Bar Chart -->
        </div>

        <div class="row clearfix">
            <!-- Radar Chart -->
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>AREA CHART</h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div id="radar_chart" height="150"></div>
                    </div>
                </div>
            </div>
            <!-- #END# Radar Chart -->
            <!-- Pie Chart -->
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>PIE CHART</h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <i class="material-icons">more_vert</i>
                                </a>
                                <ul class="dropdown-menu pull-right">
                                    <li><a href="javascript:void(0);">Action</a></li>
                                    <li><a href="javascript:void(0);">Another action</a></li>
                                    <li><a href="javascript:void(0);">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div id="pie_chart" height="150"></div>
                    </div>
                </div>
            </div>
            <!-- #END# Pie Chart -->
        </div>
    </div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>                   
    <script type="text/javascript">
        // Load google charts
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        // Draw the chart and set the chart values
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'NUMBER OF STUDENTS FAIL'],
        <%=str3%>
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = {'title': 'NUMBER OF STUDENTS FAIL', 'width': 400, 'height': 300};

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
                ['Task', 'NUMBER OF STUDENTS PASS'],
        <%=str2%>
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = {'title': 'NUMBER OF STUDENTS PASS', 'width': 400, 'height': 300};

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
                ['Task', 'MARK OBTAIN:'],
        <%=str1%>
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = {'title': 'RECENT EXAM RESULT MARK', 'width': 400, 'height': 300};

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.AreaChart(document.getElementById('radar_chart'));
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
                ['Task', 'Hours per Day'],
        <%=str%>
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = {'title': 'RECENT EXAM RESULT PERCENTAGE ', 'width': 400, 'height': 300};

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));//change to PieChart to all chart name only
            chart.draw(data, options);
        }
    </script>
    <script>
        $(document).ready(function ()
        {
            clockUpdate();
            setInterval(clockUpdate, 1000);
        });

        function clockUpdate() {
            var date = new Date();
            $('.digital-clock').css({'color': '#fff', 'text-shadow': '0 0 6px #ff0'});
            function addZero(x) {
                if (x < 10) {
                    return x = '0' + x;
                } else {
                    return x;
                }
            }

            function twelveHour(x) {
                if (x > 12) {
                    return x = x - 12;
                } else if (x == 0) {
                    return x = 12;
                } else {
                    return x;
                }
            }

            var h = addZero(twelveHour(date.getHours()));
            var m = addZero(date.getMinutes());
            var s = addZero(date.getSeconds());

            $('.digital-clock').text(h + ':' + m + ':' + s);
        }
    </script>
    <script>
        $(document).ready(function () {
            // Create two variables with names of months and days of the week in the array
            var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

            // Create an object newDate()
            var newDate = new Date();
            // Retrieve the current date from the Date object
            newDate.setDate(newDate.getDate());
            // At the output of the day, date, month and year    
            $('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

            setInterval(function () {
                // Create an object newDate () and extract the second of the current time
                var seconds = new Date().getSeconds();
                // Add a leading zero to the value of seconds
                $("#sec").html((seconds < 10 ? "0" : "") + seconds);
            }, 1000);

            setInterval(function () {
                // Create an object newDate () and extract the minutes of the current time
                var minutes = new Date().getMinutes();
                // Add a leading zero to the minutes
                $("#min").html((minutes < 10 ? "0" : "") + minutes);
            }, 1000);

            setInterval(function () {
                // Create an object newDate () and extract the clock from the current time
                var hours = new Date().getHours();
                // Add a leading zero to the value of hours
                $("#hours").html((hours < 10 ? "0" : "") + hours);
            }, 1000);

            $("#p").text(hours + ":" + minutes + ":" + seconds);

        });
    </script>



