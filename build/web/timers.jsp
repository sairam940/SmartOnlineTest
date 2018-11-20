<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!----How to create countdown timer using javascript-->
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
            var timer = 60;//1 minute timer
            var min = 0;
            var sec = 0;
            function startTimer() {
                min = parseInt(timer / 60);
                sec = parseInt(timer % 60);

                if (timer < 1) {
                    window.location = "tests.jsp";
                }

                document.getElementById("time").innerHTML = "<b>Time Left: </b>" + min.toString() + ":" + sec.toString();
                timer--;
                setTimeout(function() {
                    startTimer();
                }, 1000);
            }
        </script>
    </head>
    <body onload="startTimer();">

        <div>
            <center><b>[<span id="time" ></span></b>]</center>
        </div>
    </body>
</html>

