<%@page import="java.util.ArrayList"%>
<%@page import="models.AdminModel"%>
<%@page import="entities.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                PROFILE
                            </h2>
                           
                        </div>
                        <div class="body">
                            <form>
                                <%
                                     String name="",email="";
                                     ArrayList<Admin> list=AdminModel.getProfile();
                                     for(Admin a:list)
                                     {
                                         name=a.getName();
                                         email=a.getEmail();
                                     }
                                %>
                                <label for="email_address">Your Name</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="text" id="email_address" class="form-control" placeholder="Your Name" value="<%=name%>" readonly="">
                                    </div>
                                </div>
                                <label for="password">Your Email</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input type="email" id="password" class="form-control" placeholder="Your email address" value="<%=email%>" readonly="">
                                    </div>
                                </div>    
                            </form>
                        </div>
                    </div>
                </div>
            </div>
