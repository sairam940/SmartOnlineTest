<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
    <!-- Bootstrap Core Js -->
    <script src="static/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="static/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Jquery Validation Plugin Css -->
    <script src="static/plugins/jquery-validation/jquery.validate.js"></script>

    <!-- JQuery Steps Plugin Js -->
    <script src="static/plugins/jquery-steps/jquery.steps.js"></script>

    <!-- Sweet Alert Plugin Js -->
    <script src="static/plugins/sweetalert/sweetalert.min.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="static/plugins/node-waves/waves.js"></script>
   

    <!-- Custom Js -->
    <script src="static/js/admin.js"></script>
    <script src="static/js/pages/cards/colored.js"></script>

    <!-- Custom Js -->
 
    <script src="static/js/pages/forms/form-validation.js"></script>

    <!-- Demo Js -->
    <script src="static/js/demo.js"></script>
    
    <script src="static/zingcharts/zingchart.min.js"></script>


    <!-- Jquery DataTable Plugin Js -->
    <script src="static/plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="static/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="static/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="static/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="static/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="static/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="static/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="static/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="static/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>
  <script src="static/js/pages/tables/jquery-datatable.js"></script>
</body>

<%
     HttpSession s=request.getSession();
     String admi_email=(String)s.getAttribute("user_email"); 
     if(admi_email==null || admi_email.equalsIgnoreCase(null))
     {
         response.sendRedirect("login");
     }
     
%>