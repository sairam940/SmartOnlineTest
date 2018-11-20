<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.google.gson.*" %>
<%
    // Establish a connection to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/oes", "root", "");

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
            String subject = null;
            subject = (String) session.getAttribute("subject");
            Gson gson = new Gson();

            // Form the SQL query that returns the top 10 most populous countries
            String sql = "SELECT sname,marks_obtained FROM result where sub_name='" + subject + "' ORDER BY marks_obtained DESC LIMIT 5";

            // Execute the query
            PreparedStatement pt = con.prepareStatement(sql);
            ResultSet rs = pt.executeQuery();

            // The 'chartobj' map object holds the chart attributes and data.
            Map<String, String> chartobj = new HashMap<String, String>();

            chartobj.put("caption", "HIGHEST MARKS BY STUDENTS UNDER SUBJECT: " + subject + "");
            chartobj.put("showValues", "0");
            chartobj.put("theme", "zune");

            // Push the data into the array using map object.
            ArrayList arrData = new ArrayList();
            while (rs.next()) {
                Map<String, String> lv = new HashMap<String, String>();
                lv.put("label", rs.getString("sname"));
                lv.put("value", rs.getString("marks_obtained"));
                arrData.add(lv);
            }

            //close the connection.
            rs.close();

            //create 'dataMap' map object to make a complete FC datasource.
            Map<String, String> dataMap = new LinkedHashMap<String, String>();
            /*
             gson.toJson() the data to retrieve the string containing the
             JSON representation of the data in the array.
             */
            dataMap.put("chart", gson.toJson(chartobj));
            dataMap.put("data", gson.toJson(arrData));

            FusionCharts columnChart = new FusionCharts(
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
                    gson.toJson(dataMap)
            );

        %>
        <!--    Render the chart    -->                
        <%=columnChart.render()%>
    </body>
</html>
