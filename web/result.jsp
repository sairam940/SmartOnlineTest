<%@page import="models.Faculty_StudentModel"%>
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
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link href="theme/css/style.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="theme/js/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/backNoWork.js" type="text/javascript"></script>
</head>
<body class="login">
    <%!
        String ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9, ans10, ans11, answers;
        
    %>
    <%
        try {
            String email=null,subName=null,quesSet=null,quesLevel=null,sname=null,totalDuration=null;
            int totalMarks=0,totalQuestion=0;
            HttpSession sessions = request.getSession(false);
            subName = (String) sessions.getAttribute("sub_name");
            System.out.println("subName " + subName);
            totalDuration = (String) sessions.getAttribute("total_time");
            totalMarks = (Integer) sessions.getAttribute("total_marks");
            totalQuestion = (Integer) sessions.getAttribute("total_question");
            quesLevel = (String) sessions.getAttribute("quesLevel");
            quesSet = (String) sessions.getAttribute("ques_set");
            email = (String) sessions.getAttribute("email");
            sname = (String) sessions.getAttribute("sname");
            String facultyEmail = Faculty_StudentModel.getFacultyEmail(subName);
            System.out.println("facultyEmail: " + facultyEmail);
            List<String> answerList = (ArrayList<String>) sessions.getAttribute("answerList");
            int size = answerList.size() + 1;
            List<String> selectedList = new ArrayList<String>();
            List<String> selectedList1 = new ArrayList<String>();
            for (int i = 1; i < size; i++) {
                selectedList.add(request.getParameter("op" + i + ""));
                System.out.println("options are: "+request.getParameter("op" + i + ""));
            }
            String options = "";
            int nullCount = 0;
            for (int i = 0; i < size - 1; i++) {
                options = selectedList.get(i);
                if (selectedList.get(i) == null) {
                    nullCount++;
                    options = "Not Attended";
                    selectedList.set(i, options);
                }
            }
//            System.out.println(selectedList);
//            System.out.println(answerList);
//            System.out.println("size of selectedList="+selectedList.size()+" "+"size of answerList="+answerList.size());
            session.setAttribute("selectedList", selectedList);
            int count = 0;
            for (int i = 0; i < answerList.size(); i++) {
                //System.out.println("Selected answer is " + selectedList.get(i));
                if (selectedList.get(i).equals(answerList.get(i))) {
                    count = count + 1;
                } else {
                    count = count + 0;
                }
            }
            int marksObtained = count;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String addedDate = sdf.format(new Date());
            String updatedDate = addedDate;
            float percentage = (count * 100) / 10;
            int questionAttended = totalQuestion - nullCount;
            
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
                <td><%=totalDuration%></td>
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
        </table>
    </div><br>
<center>
    <input type="button" value="View Answer" class="btn-form-login" onclick="window.location.href = 'answer';" > &nbsp;&nbsp;&nbsp; <input type="button" value="Take Print" class="btn-form-login" onclick="window.print()">
    &nbsp;&nbsp;&nbsp;<input type="button" value="Logout" class="btn-form-login" onclick="window.location.href = 'logout';" >
</center>
<br><br>
<%
    } catch (Exception e) {
        out.println(e);
    }
%>
</body>
</html>