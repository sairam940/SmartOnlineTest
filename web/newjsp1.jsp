<%--
    Document   : newjsp1
    Created on : Apr 20, 2018, 11:13:40 AM
    Author     : Dharmesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta http-equiv="Content-Language" content="en-us">
        <title>Online Quiz</title>
        <script type="text/Javascript">
            var rightAnswer=new Array();
            var questPerPage=2;
            var quests=Array("Quest0","Quest1","Quest2","Quest3","Quest4","Quest5","Quest6","Quest7");
            var answers=Array();
            answers[0]=Array(1,"answer1","answer2","answer3","answer4")
            answers[1]=Array(2,"answer5","answer6","answer7","answer8")
            answers[2]=Array(3,"answer9","answer10","answer11","answer12")
            answers[3]=Array(4,"answer13","answer14","answer15","answer16")
            answers[4]=Array(4,"answer17","answer18","answer19","answer20")
            answers[5]=Array(3,"answer21","answer22","answer23","answer24")
            answers[6]=Array(2,"answer25","answer26","answer27","answer28")
            answers[7]=Array(1,"answer29","answer30","answer31","answer32")

            function showQuestion(){
            htmlStr="";
            for(qpp=0;qpp<questPerPage;qpp++){

            q=Math.floor(Math.random()*quests.length)
            htmlStr+="Q#"+qpp+": "+quests[q]+"<br>A: ";

            rightAnswer[qpp]=answers[q][0]-1;

            for(a=1;a<answers[q].length;a++){
            htmlStr+="<input name='ansr"+qpp+"' type='radio' value=''><label>"+answers[q][a]+"</label>  "
            }
            htmlStr+="<p>";
            }
            document.getElementById("myQuiz").innerHTML=htmlStr
            }

            function check(){
            for (ra=0;ra<rightAnswer.length;ra++){
            radios=document.getElementsByName("ansr"+ra)
            if (radios[rightAnswer[ra]].checked){
            alert("The Answer#"+ra+" is correct");
            }else{
            alert("The Answer#"+ra+" is incorrect");
            }
            }
            showQuestion()
            }
        </script>
    </head>

    <body>

        <h1>Quiz:</h1>
        <form id="myQuiz" action="">


        </form>
        <form action="">
            <input onclick="check()" name="Button1" type="button" value="Check"></form>
        <script>
            showQuestion()
        </script>

    </body>

</html>

