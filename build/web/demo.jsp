<%-- 
    Document   : demo
    Created on : 13 Aug, 2018, 10:29:20 PM
    Author     : Dharmesh Mourya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>registration form creation</title>
<!--        <script type="text/javascript">
            function register() {
                var pass, pass1, first, last, email, user, dob;
                first = document.f1.first.value;
                last = document.f1.last.value;
                email = document.f1.email.value;
                dob = document.f1.dob.value;
                user = document.f1.user.value;
                pass = document.f1.pass1.value;
                pass1 = document.f1.pass2.value;
                if (first == "")
                    alert("Please Enter First Name");
                else if (isNaN(first) == false)
                    alert("First name should not contain any number");
                else if (last == "")
                    alert("Please Enter Last Name");
                else if (isNaN(last) == false)
                    alert("Last name should not contain any number");
                else if (email == "")
                    alert("Please Enter Email id");
                else if (dob == "")
                    alert("Please Enter Date of Birth");
                else if (user == "")
                    alert("Please Enter User Name");
                else if (pass == "")
                    alert("Please Enter Password");
                else if (pass1 == "")
                    alert("Please Enter Confirm Password");
                else if (pass != pass1)
                    alert("Password and Confirm password do not match");
                else
                    alert("Confirm password do not match");
            }
        </script> -->
        <style type="text/css">
            h1{
                font-size: 50px;
                color: #3038b2;    
            }
            .label{
                font-size: 25px;
                color: #3038b2;
            }
            .fields{
                height: 50px;
                width: 300px;

            }
            .btn{
                width: 100%;
                height: 50px;
            }
        </style>
    </head>
    <body style="background-color: #42d1f4">
    <center>

        <h1>Registration form</h1>
        <form name="myForm" action="tests.jsp"method="post">
            <table style="padding-top: 30px" cellpadding="10px" cellspacing="10px">
                <tr><td class="label">First Name:</td><td><input class="fields" type="text" name="first" placeholder="Enter First Name"/></td></tr>
                <tr><td class="label">Last Name:</td><td><input class="fields" type="text" name="last" placeholder="Enter Last Name"/></td></tr>
                <tr><td class="label">Email:</td><td><input class="fields" type="email" name="email" placeholder="Enter Email id"/></td></tr>
                <tr><td class="label">Date of Birth:</td><td><input class="fields" type="date" name="dob"/></td></tr>
                <tr><td class="label">User name:</td><td><input class="fields" type="password" name="user" placeholder="Enter User Name"/></td></tr>
                <tr><td class="label">Enter Password*:</td><td><input class="fields" type="password" name="pass1" placeholder="Enter your password"/></td></tr>
                <tr><td class="label">Confirm Password*:</td><td><input class="fields" type="password" name="pass2" placeholder="Re-Enter your password"/></td></tr>
                <tr><td class="label">Gender:</td><td><input type="radio"  name="gender" id="rd1"/>MALE <input type="radio" name="gender" id="rd2"/>FEMALE</td></tr>
                <tr><td><input class="btn" type="reset"/></td><td><input class="btn" type="submit" value="Register" onclick="return validate();"></td></tr>
            </table>
        </form>
    </center>
    <script type="text/javascript">
        <!--
         // Form validation code will come here.
        function validate()
        {

            if (document.myForm.first.value === "")
            {
                alert("Please provide your first name!");
                document.myForm.first.focus();
                return false;
            }

            if (document.myForm.last.value === "")
            {
                alert("Please provide your last name!");
                document.myForm.last.focus();
                return false;
            }
            if (document.myForm.email.value === "")
            {
                alert("Please provide your Email!");
                document.myForm.email.focus();
                return false;
            }

            if (document.myForm.dob.value === "")
            {
                alert("Please provide your dob!");
                document.myForm.dob.focus();
                return false;
            }

            if (document.myForm.user.value === "")
            {
                alert("Please provide your username!");
                document.myForm.user.focus();
                return false;
            }
            if (document.myForm.pass1.value === "")
            {
                alert("Please provide your confirm password!");
                document.myForm.pass1.focus();
                return false;
            }

            if (document.myForm.pass2.value === "")
            {
                alert("Please provide your password!");
                document.myForm.pass2.focus();
                return false;
            }
            if (document.myForm.pass1.value !== document.myForm.pass2.value)
            {
                alert("password and confirm password does not match.");
                document.myForm.pass2.focus();
                return false;
            }
            

//            if (document.myForm.gender.value === "")
//            {
//                alert("Please provide your gender!");
//                document.myForm.gender.focus();
//                return false;
//            }

            if ((document.myForm.gender[0].checked === false) || (form.gender[1].checked === false))
            {
                alert("Please choose your Gender: Male or Female");
                return false;
            }
   //         if( document.myForm.Zip.value === "" ||
   //         isNaN( document.myForm.Zip.value ) ||
   //         document.myForm.Zip.value.length != 5 )
   //         {
   //            alert( "Please provide a zip in the format #####." );
   //            document.myForm.Zip.focus() ;
   //            return false;
   //         }
   //         
   //         if( document.myForm.Country.value == "-1" )
   //         {
   //            alert( "Please provide your country!" );
   //            return false;
   //         }
            return(true);
        }
        //-->
    </script>
</body>
</html>


