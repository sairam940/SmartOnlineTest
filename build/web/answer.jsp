<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="entities.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.QuestionModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Answers</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/backNoWork.js" type="text/javascript"></script>
    </head>
    <body class="login"><br>
        <center>
    <input type="button" style="font-size: 20px;" value="More Tests" class="btn-form-login" onclick="window.location.href = 'instructions';" > &nbsp;&nbsp;&nbsp; <input class="btn-form-login" style="font-size: 20px;" type="button" value="Logout" onclick="window.location.href = 'logout';" >
</center>
            <br>
        <%!
            int score;
        %>
        <table class="table table-bordered table-striped">
            <thead>
                <tr class="row100 head">
                    <th class="">Q. No.</th>
                    <th class="">Question</th>
                    <th class="">Your Answer</th>
                    <th class="">Correct Answer</th>
                    <th class="">Score</th>
                </tr>
            </thead>
            <tbody>
            <tbody>
                <%
                    try {
                        HttpSession sessions=request.getSession(false);
                        List<String> answerList = (ArrayList<String>) sessions.getAttribute("answerList");
                        List<String> selectedList =(ArrayList<String>) sessions.getAttribute("selectedList");
                        List<String> questionList =(ArrayList<String>) sessions.getAttribute("questionList");
                        score = 0;
                        int count=0;
                        for (int i = 0; i < answerList.size(); i++) {
                            count++;
                %>
                <tr class="row100 body">
                    <td class="cell100 column1"><%=count%></td>
                    <td class="cell100 column2"><%=questionList.get(i)%></td>
                    <td class="cell100 column3"><%=selectedList.get(i)%></td>
                    <td class="cell100 column4"><%=answerList.get(i)%></td>
                    <%
                        if (selectedList.get(i).equals(answerList.get(i))) {
                            score = score + 1;
                            out.println("<td class='cell100 column5'>1</td>");
                        } else {
                            out.println("<td class='cell100 column5'>0</td>");
                        }
                    %>
                </tr>
                <%
                            }
                        }
                     catch (Exception e) {
                        out.println(e);
                    }
                %>
            </tbody>

        </tbody>
        <tfoot style="background-color: lightgreen"><td></td><td></td><td></td><td><b>Total</b></td><td><b><%=score%></b></td></tfoot>
</table>
<br><br>
<script src="js/main.js"></script>
<!-- page end -->
<link href="theme/css/style.css" rel="stylesheet">
<!-- jQuery -->
<script src="theme/js/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- /js files -->
</body>
</html>
