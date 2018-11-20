<%@page import="models.Faculty_StudentModel"%>
<%@page import="entities.Faculty_Student"%>
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
            * {
                box-sizing: border-box;
            }

            #myTable {
                border-collapse: collapse;
                width: 100%;
                border: 1px solid #ddd;
                font-size: 18px;
            }

            #myTable th, #myTable td {
                text-align: left;
                padding: 12px;
            }

            #myTable tr {
                border-bottom: 1px solid #ddd;
            }

            #myTable tr.header, #myTable tr:hover {
                background-color: #f1f1f1;
            }
        </style>
            <!-- page end -->
    <link href="theme/css/style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="theme/js/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </head>
    <body class="login">
        <jsp:include page="SHeader.jsp" flush="true"></jsp:include>
        <%
            String email = (String) session.getAttribute("email");
            if (email != null) {
        %>
        <%!
            String ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9, ans10, ans11, answers;
            int count;
        %>
        <%try {
                answers = "";
                String fees = (String) session.getAttribute("fees");
                String subName = (String) session.getAttribute("sub_name");
                String totalDuration = (String) session.getAttribute("total_time");
                Integer totalMarks = Integer.parseInt(session.getAttribute("total_marks").toString());
                String sname = (String) session.getAttribute("sname");
                Integer totalQuestion = Integer.parseInt(session.getAttribute("total_question").toString());
                String facultyEmail=Faculty_StudentModel.getFacultyEmail(subName);
                System.out.println("facultyEmail: "+facultyEmail);
                String quesLevel = (String) session.getAttribute("ques_level");
                String quesSet = (String) session.getAttribute("ques_set");
                String op1 = (String) session.getAttribute("op1");
                String op2 = (String) session.getAttribute("op2");
                String op3 = (String) session.getAttribute("op3");
                String op4 = (String) session.getAttribute("op4");
                String op5 = (String) session.getAttribute("op5");
                String op6 = (String) session.getAttribute("op6");
                String op7 = (String) session.getAttribute("op7");
                String op8 = (String) session.getAttribute("op8");
                String op9 = (String) session.getAttribute("op9");
                String op10 = (String) session.getAttribute("op10");
                //out.println("op10 is:" + op10);
                int null_count = 0;
                String tokens = "Not Attended";
                if (op1 == null || op1.equals("") || op1.equals("") || op1.isEmpty()) {
                    op1 = tokens;
                    null_count = null_count + 1;
                }
                if (op2 == null || op2.equals("") || op2.isEmpty()) {
                    op2 = tokens;
                    null_count = null_count + 1;
                }
                if (op3 == null || op3.equals("") || op3.isEmpty()) {
                    op3 = tokens;
                    null_count = null_count + 1;
                }
                if (op4 == null || op4.equals("") || op4.isEmpty()) {
                    op4 = tokens;
                    null_count = null_count + 1;
                }
                if (op5 == null || op5.equals("") || op5.isEmpty()) {
                    op5 = tokens;
                    null_count = null_count + 1;
                }
                if (op6 == null || op6.equals("") || op6.isEmpty()) {
                    op6 = tokens;
                    null_count = null_count + 1;
                }
                if (op7 == null || op7.equals("") || op7.isEmpty()) {
                    op7 = tokens;
                    null_count = null_count + 1;
                }
                if (op8 == null || op8.equals("") || op8.isEmpty()) {
                    op8 = tokens;
                    null_count = null_count + 1;
                }
                if (op9 == null || op9.equals("") || op9.isEmpty()) {
                    op9 = tokens;
                    null_count = null_count + 1;
                }
                if (op10 == null || op10.equals("") || op10.isEmpty()) {
                    op10 = tokens;
                    null_count = null_count + 1;
                }
                String[] selected = {op1, op2, op3, op4, op5, op6, op7, op8, op9, op10};
                session.setAttribute("selected", selected);
                //out.println("<br>null_count are:" + null_count);
                String answers = "";
                ArrayList<Question> list = QuestionModel.fetchAnswers(subName, quesSet, quesLevel);
                Iterator itr = list.iterator();
                while (itr.hasNext()) {
                    Question q = (Question) itr.next();
                    String[] ans = {q.getAnswer()};
                    for (String a : ans) {
                        answers = answers + "," + a;
                        //out.println("Answers are:" + answers);
                    }
                }
                String a = answers.substring(0, answers.lastIndexOf(","));
                //out.println("correct answers are:" + answers);
                String split_answers[] = answers.split(",");
                ans1 = split_answers[0].trim();
                ans2 = split_answers[1].trim();
                ans3 = split_answers[2].trim();
                ans4 = split_answers[3].trim();
                ans5 = split_answers[4].trim();
                ans6 = split_answers[5].trim();
                ans7 = split_answers[6].trim();
                ans8 = split_answers[7].trim();
                ans9 = split_answers[8].trim();
                ans10 = split_answers[9].trim();
                ans11 = split_answers[10].trim();
                //ans11 = split_answers[10].trim();
                count = 0;
                //out.println("<br>Hence:   &nbsp;&nbsp;" + ans1 + " " + ans2 + " " + ans3 + " " + ans4 + " " + ans5 + " " + ans6 + " " + ans7 + " " + ans8 + " " + ans9 + " " + ans10);
                if (op1.equals(ans2)) {
                    count = count + 1;
                    //System.out.println(op1 + "=" + ans1);
                }
                if (op2.equals(ans3)) {
                    count = count + 1;
                    //System.out.println(op2 + "=" + ans2);
                }
                if (op3.equals(ans4)) {
                    count = count + 1;
                    //System.out.println(op3 + "=" + ans3);
                }
                if (op4.equals(ans5)) {
                    count = count + 1;
                    //System.out.println(op4 + "=" + ans4);
                }
                if (op5.equals(ans6)) {
                    count = count + 1;
                    //System.out.println(op5 + "=" + ans5);
                }
                if (op6.equals(ans7)) {
                    count = count + 1;
                    //System.out.println(op6 + "=" + ans6);
                }
                if (op7.equals(ans8)) {
                    count = count + 1;
                    // System.out.println(op7 + "=" + ans7);
                }
                if (op8.equals(ans9)) {
                    count = count + 1;
                    //System.out.println(op8 + "=" + ans8);
                }
                if (op9.equals(ans10)) {
                    count = count + 1;
                    //System.out.println(op9 + "=" + ans9);
                }
                if (op10.equals(ans11)) {
                    count = count + 1;
                    //System.out.println(op10 + "=" + ans10);
                }
                //out.println("<br>Total Marks=" + count);

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
                    rs.setFacultyEmail(facultyEmail);
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

        <table id="myTable">
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
                <td><%=remarks%></td>
            </tr>
        </table><br>
    <center>
        <input type="button" value="View Answer" class="btn-form-login" onclick="window.location.href = 'answer';" > &nbsp;&nbsp;&nbsp; <input type="button" value="Take Print" class="btn-form-login" onclick="window.print()">
    </center><br><br>
    <%
        } catch (Exception e) {
            out.println(e);
        }
        } else {
            response.sendRedirect("index");
        }
    %>
</body>
</html>
