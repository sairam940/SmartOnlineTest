<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.*" %>
<%
    // Establish a connection to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/oes", "root", "");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating Charts with Data from a Database - fusioncharts.com</title>
        <script src=" http://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script> 
        <script src=" http://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"></script>
    </head>
    <body>
        <div id="chart"></div>
        <%@page import="fusioncharts.FusionCharts" %>      
        <% 
            Gson gson1 = new Gson();

            // Form the SQL query that returns the top 10 most populous countries
            String sql1 = "SELECT subject,count(student_name) FROM faculty_student group by subject LIMIT 5";

            // Execute the query
            PreparedStatement pt1 = con1.prepareStatement(sql1);
            ResultSet rs1 = pt1.executeQuery();

            // The 'chartobj' map object holds the chart attributes and data.
            Map<String, String> chartobj = new HashMap<String, String>();

            chartobj.put("caption", "NO. OF STUDENTS IN PARTICULAR SUBJECT");
            chartobj.put("showValues", "0");
            chartobj.put("theme", "zune");

            // Push the data into the array using map object.
            ArrayList arrData = new ArrayList();
            while (rs1.next()) {
                Map<String, String> lv1 = new HashMap<String, String>();
                lv1.put("label", rs1.getString(1));
                lv1.put("value", rs1.getString(2));
                arrData.add(lv1);
            }

            //close the connection.
            rs1.close();

            //create 'dataMap' map object to make a complete FC datasource.
            Map<String, String> dataMap1 = new LinkedHashMap<String, String>();
            /*
             gson.toJson() the data to retrieve the string containing the
             JSON representation of the data in the array.
             */
            dataMap1.put("chart", gson1.toJson(chartobj));
            dataMap1.put("data", gson1.toJson(arrData));

            FusionCharts columnChart1 = new FusionCharts(
                    //type of chart
                    "column2d",
                    //unique chart ID
                    "chart1",
                    //width and height of the chart
                    "700", "400",
                    //div ID of the chart container
                    "chart",
                    //data format
                    "json",
                    //data source
                    gson1.toJson(dataMap1)
            );

        %>
        <!--    Render the chart    -->                
        <%=columnChart1.render()%>
    </body>
</html>
