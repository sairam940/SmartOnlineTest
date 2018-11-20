<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="models.SubjectModel"%>
<%@page import="entities.Subject"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="entities.Result"%>
<%@page import="models.ResultModel"%>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <body>
      <%!
            String histogramData = null;
            String subName = null;
        %>
        <%
            subName = "CPP";
            String data = "";
            List<Subject> list = SubjectModel.getSubject();
            System.out.println("size=" + list.size());
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.beginTransaction();

            String SQL_QUERY = "select fs.subject,count(fs.studentName) from Faculty_Student fs group by fs.subject";
            Query query = s.createQuery(SQL_QUERY);
            for (Iterator it = query.iterate(); it.hasNext();) {
                Object[] row = (Object[]) it.next();
                System.out.print("Subject Name: " + row[0]);
                System.out.println(" | Number of Students: " + row[1]);
                data+="['"+row[0]+"',"+row[1]+"],";
            }            
            histogramData = data;
            System.out.println(data);
            histogramData = histogramData.substring(0, histogramData.length() - 1);
            System.out.println(histogramData);
            s.getTransaction().commit();
            s.close();
        %>
        <div id="chart_div" style="width: 100%; height: 500px;"></div>
  </body>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2013',  1000,      400],
          ['2014',  1170,      460],
          ['2015',  660,       1120],
          ['2016',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</html>
