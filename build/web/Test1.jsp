<%@page import="java.util.List"%>
<%@page import="models.ResultModel"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Result"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.QuestionModel"%>
<%@page import="entities.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.UUID"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <style>
            .bs-example{
                    margin: 20px;
                }
        </style>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<!--        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body class="login">
        <jsp:include page="SHeader.jsp" flush="true"></jsp:include>
        <%!
            String ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9, ans10, ans11, answers;
            int count;
        %>
        <%
            try {
                String fees = (String) session.getAttribute("fees");
                String subName = (String) session.getAttribute("sub_name");
                String totalDuration = (String) session.getAttribute("total_time");
                Integer totalMarks = Integer.parseInt(session.getAttribute("total_marks").toString());
                Integer totalQuestion = Integer.parseInt(session.getAttribute("total_question").toString());
                String quesLevel = (String) session.getAttribute("ques_level");
                String quesSet = (String) session.getAttribute("ques_set");
                //System.out.println("total marks:" + total_marks + "ques level: " + ques_level);
                String email = (String) session.getAttribute("email");
                String sname = (String) session.getAttribute("sname");
                String op1 = request.getParameter("op1");
                System.out.println("op1 "+op1);
                String op2 = request.getParameter("op2");
                System.out.println("op2 "+op2);
                String op3 = request.getParameter("op3");
                System.out.println("op3 "+op3);
                String op4 = request.getParameter("op4");
                System.out.println("op4 "+op4);
                String op5 = request.getParameter("op5");
                System.out.println("op5 "+op5);
                String op6 = request.getParameter("op6");
                System.out.println("op6 "+op6);
                String op7 = request.getParameter("op7");
                System.out.println("op7 "+op7);
                String op8 = request.getParameter("op8");
                System.out.println("op8 "+op8);
                String op9 = request.getParameter("op9");
                System.out.println("op9 "+op9);
                String op10 = request.getParameter("op10");
                System.out.println("op10 "+op10);
                List<String> selectedlist=new ArrayList<String>();
                for(int i=1;i<=10;i++){
                    selectedlist.add("op"+i);
                }
                System.out.println("selectedlist: "+selectedlist);
                //System.out.println("Your options are: " + op1 + " " + op2 + " " + op3 + " " + op4 + " " + op5 + " " + op6 + " " + op7 + " " + op8 + " " + op9 + " " + op10);
                //out.println("op10 is:" + op10);
                int null_count = 0;

                if (op1 == null || op1.equals("") || op1.equals("") || op1.isEmpty()) {
                    op1 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op2 == null || op2.equals("") || op2.isEmpty()) {
                    op2 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op3 == null || op3.equals("") || op3.isEmpty()) {
                    op3 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op4 == null || op4.equals("") || op4.isEmpty()) {
                    op4 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op5 == null || op5.equals("") || op5.isEmpty()) {
                    op5 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op6 == null || op6.equals("") || op6.isEmpty()) {
                    op6 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op7 == null || op7.equals("") || op7.isEmpty()) {
                    op7 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op8 == null || op8.equals("") || op8.isEmpty()) {
                    op8 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op9 == null || op9.equals("") || op9.isEmpty()) {
                    op9 = "Not Attended";
                    null_count = null_count + 1;
                }
                if (op10 == null || op10.equals("") || op10.isEmpty()) {
                    op10 = "Not Attended";
                    null_count = null_count + 1;
                }
                String[] selected = {op1, op2, op3, op4, op5, op6, op7, op8, op9, op10};
                session.setAttribute("selected", selected);
                //out.println("<br>null_count are:" + null_count);
                String answers = "";
                List<String> answerlist=new ArrayList<String>();
                ArrayList<Question> list = QuestionModel.fetchAnswers(subName, quesSet, quesLevel);
                Iterator itr = list.iterator();
                while (itr.hasNext()) {
                    Question q = (Question) itr.next();
                    answerlist.add(q.getAnswer());
                    String[] ans = {q.getAnswer()};
                    System.out.println("length "+ans.length);
                    for (String a : ans) {
                        answers = answers+",%#"+a;
                        //out.println("Answers are:" + answers);
                    }
                }
                System.out.println("answerlist: "+answerlist);
                //out.println("correct answers are:" + answers);
                System.out.println("correct answers are:" + answers);
                String split_answers[] = answers.split(",%#");
                ans1 = split_answers[0].trim();
                System.out.println("ans1 "+ans1);
                ans2 = split_answers[1].trim();
                System.out.println("ans2 "+ans2);
                ans3 = split_answers[2].trim();
                System.out.println("ans3 "+ans3);
                ans4 = split_answers[3].trim();
                System.out.println("ans4 "+ans4);
                ans5 = split_answers[4].trim();
                System.out.println("ans5 "+ans5);
                ans6 = split_answers[5].trim();
                System.out.println("ans6 "+ans6);
                ans7 = split_answers[6].trim();
                System.out.println("ans7 "+ans7);
                ans8 = split_answers[7].trim();
                System.out.println("ans8 "+ans8);
                ans9 = split_answers[8].trim();
                System.out.println("ans9 "+ans9);
                ans10 = split_answers[9].trim();
                System.out.println("ans10 "+ans10);
                ans11 = split_answers[10].trim();
                System.out.println("ans11 "+ans11);
                //System.out.println("ans11 "+ans11);
                count = 0;
                //System.out.println("Correct Ansewrs are:" + ans1 + " " + ans2 + " " + ans3 + " " + ans4 + " " + ans5 + " " + ans6 + " " + ans7 + " " + ans8 + " " + ans9 + " " + ans10 + " " + ans11);
                if (op1.equals(ans2)) {
                    count = count + 1;
                    //System.out.println(op1 + "=" + ans2);
                } else {
                    //System.out.println(op1 + "wrong");
                }
                if (op2.equals(ans3)) {
                    count = count + 1;
                    //System.out.println(op2 + "=" + ans3);
                } else {
                    //System.out.println(op2 + "wrong");
                }
                if (op3.equals(ans4)) {
                    count = count + 1;
                    //System.out.println(op3 + "=" + ans4);
                } else {
                    //System.out.println(op3 + "wrong");
                }
                if (op4.equals(ans5)) {
                    count = count + 1;
                    //System.out.println(op4 + "=" + ans5);
                } else {
                    //System.out.println(op4 + "wrong");
                }
                if (op5.equals(ans6)) {
                    count = count + 1;
                    //System.out.println(op5 + "=" + ans6);
                } else {
                    //System.out.println(op5 + "wrong");
                }
                if (op6.equals(ans7)) {
                    count = count + 1;
                    //System.out.println(op6 + "=" + ans7);
                } else {
                    //System.out.println(op6 + "wrong");
                }
                if (op7.equals(ans8)) {
                    count = count + 1;
                    //System.out.println(op7 + "=" + ans8);
                } else {
                    //System.out.println(op7 + "wrong");
                }

                if (op8.equals(ans9)) {
                    count = count + 1;
                    //System.out.println(op8 + "=" + ans9);
                } else {
                    //System.out.println(op8 + "wrong");
                }
                if (op9.equals(ans10)) {
                    count = count + 1;
                    //System.out.println(op9 + "=" + ans10);
                } else {
                    //System.out.println(op9 + "wrong");
                }
                if (op10.equals(ans11)) {
                    count = count + 1;
                    //System.out.println(op10 + "=" + ans11);
                } else {
                    //System.out.println(op10 + "wrong");
                }

                //out.println("Total Marks=" + count);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String addedDate = sdf.format(new Date());
                String updatedDate = addedDate;
                float percentage = (count * 100) / 10;
                int questionAttended = totalQuestion - null_count;
                int marksObtained = count;
                String remarks;
                if (marksObtained <= 3) {
                    remarks = "Fail";
                } else {
                    remarks = "Pass";
                }
                try {
                    Result rs = new Result();
                    rs.setEmail(email);
                    rs.setSname(sname);
                    rs.setSubName(subName);
                    rs.setQuesLevel(quesLevel);
                    rs.setAddedDate(addedDate);
                    rs.setPercentage(percentage);
                    rs.setQuesLevel(quesLevel);
                    rs.setQuesSet(quesSet);
                    rs.setQuestionAttended(questionAttended);
                    rs.setMarksObtained(marksObtained);
                    rs.setTotalDuration(totalDuration);
                    rs.setTotalMarks(totalMarks);
                    rs.setTotalQuestion(totalQuestion);
                    rs.setRemarks(remarks);
                    rs.setUpdatedDate(updatedDate);
                    rs = ResultModel.saveResult(rs);
                    System.out.println("inserted");

                } catch (Exception e) {
                    System.out.println(e);
                }
        %>
        <div class="bs-example">
        <table id="myTable" class="table table-striped table-bordered">
            <tr class="header">
                <th colspan="2" style="width:100%;">Result</th>
            </tr>
            <tr>
                <td>Student Name</td>
                <td><%=sname%></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%=email%></td>
            </tr>
            <tr>
                <td>Subject Name</td>
                <td><%=subName%></td>
            </tr>
            <tr>
                <td>Question Level</td>
                <td><%=quesLevel%></td>
            </tr>
            <tr>
                <td>Question Set</td>
                <td><%=quesSet%></td>
            </tr>
            <tr>
                <td>Total Question</td>
                <td><%=totalQuestion%></td>
            </tr>
            <tr>
                <td>Time Duration</td>
                <td><%=totalDuration%> m</td>
            </tr>
            <tr>
                <td>Question Attended</td>
                <td><%=questionAttended%></td>
            </tr>
            <tr>
                <td>Marks Obtained</td>
                <td><%=marksObtained%></td>
            </tr>
            <tr>
                <td>Total Marks</td>
                <td><%=totalMarks%></td>
            </tr>
            <tr>
                <td>Percentage</td>
                <td><%=percentage%>%</td>
            </tr>
            <tr>
                <td>Remarks</td>
                <td><%=remarks%>%</td>
            </tr>
        </table>
            </div><br>
    <center>
        <input type="button" value="View Answer" class="btn-form-login" onclick="window.location.href = 'answer';" > &nbsp;&nbsp;&nbsp; <input type="button" value="Take Print" class="btn-form-login" onclick="window.print()">
    </center>
    <br><br>
    <%
        } catch (Exception e) {
            out.println(e);
        }
    %>
    <!-- page end -->
    <link href="theme/css/style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="theme/js/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- /js files -->
</body>
</html>