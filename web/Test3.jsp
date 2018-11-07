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
        <style>
            .table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
                background-color: red;
            }
        </style>
    </head>
    <body class="login">
        <jsp:include page="SHeader.jsp" flush="true"></jsp:include>
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

                        String[] selected = (String[]) session.getAttribute("selected");
                        score = 0;
                        String sub_name = (String) session.getAttribute("sub_name");
                        String ques_level = (String) session.getAttribute("ques_level");
                        String ques_set = (String) session.getAttribute("ques_set");
                        for (int i = 0; i < selected.length; i++) {
                            ArrayList<Question> list = QuestionModel.questionList(sub_name, ques_set, ques_level);
                            Iterator itr = list.iterator();
                            if (itr.hasNext()) {
                                Question q = (Question) itr.next();

                %>
                <tr class="row100 body">
                    <td class="cell100 column1"><%=q.getQuesNumber()%></td>
                    <td class="cell100 column2"><%=q.getQuestion()%></td>
                    <td class="cell100 column3"><%=selected[i]%></td>
                    <td class="cell100 column4"><%=q.getAnswer()%></td>
                    <%
                        if (selected[i].equals(q.getAnswer())) {
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
                    } catch (Exception e) {
                        out.println(e);
                    }
                %>
            </tbody>

        </tbody>
        <tfoot style="background-color: lightgreen"><td></td><td></td><td></td><td><b>Total</b></td><td><b><%=score%></b></td></tfoot>
</table>


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
