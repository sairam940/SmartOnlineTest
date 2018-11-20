<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
                HttpSession s = request.getSession(false);
                String name = (String) s.getAttribute("user_name");
                String email = (String) s.getAttribute("user_email");
                
                if(email==null || email=="")
                {
                    response.sendRedirect("login.jsp");
                }

%>
<html>
    <!-- #Start Top Bar -->
    
    <jsp:include page="template/header.jsp"></jsp:include>
    
    <!-- #End Top Bar -->
    
    <!-- #Start Sidebar Bar -->
    <jsp:include page="template/sidebar.jsp"></jsp:include>
     <!-- #End Sidebar Bar -->
     
     <!-- #Start content Bar -->
     
    <section class="content">
    <jsp:include page="content/faculty-chat.jsp"></jsp:include>
    
    </section>
    
    <!-- #End content Bar -->
   
     <!-- #Start footer  -->
    <section class="footer">
        
    <jsp:include page="template/footer.jsp"></jsp:include>
    
    </section>
    
     <!-- #End footer  -->
    
</html>
