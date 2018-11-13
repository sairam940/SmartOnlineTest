<%@page import="models.ChatModel"%>
<%@page import="entities.Chat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Subject"%>
<%@page import="models.SubjectModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Exportable Table -->

    <div class="alert bg-green alert-dismissible" role="alert" id="sub_up">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <center> <strong>Your reply posted Successfully...</strong> </center>
    </div>
<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    STUDENT'S CHAT
                </h2>
                <ul class="header-dropdown m-r--5">
                    <li class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="material-icons">more_vert</i>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="javascript:void(0);">Action</a></li>
                            <li><a href="javascript:void(0);">Another action</a></li>
                            <li><a href="javascript:void(0);">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover dataTable js-exportable" id="table_items">
                        <thead>
                            <tr>
                                <th>SR. NO</th>
                                <th>ID</th>
                                <th>USER TYPE</th>
                                <th>NAME</th>
                                <th>EMAIL</th>
                                <th>PHONE</th>
                                <th>FACULTY'S COMMENT</th>
                                <th>YOUR REPLY</th>
                                <th>DATE</th>
                                <th>REPLY</th>
                            </tr>
                        </thead>

                        <tbody id="tbody">
                            <%
                                String userType="Student";
                                ArrayList<Chat> list = ChatModel.getChatByUserType(userType);
                                int count=0;
                                for (Chat c : list) {
                                    int cid = c.getId();
                                    count++;
                            %>
                            <tr>
                                <td><%=count%></td>
                                <td id="id"><%=c.getId()%></td>
                                <td id="userType"><%=c.getUserType()%></td>
                                <td id="name"><%=c.getName()%></td>
                                <td id="email"><%=c.getEmail()%></td>  
                                <td id="phone"><%=c.getPhone()%></td>
                                <td id="yourComment"><%=c.getYourComment()%></td>
                                <td contenteditable="true" id="adminReply"><%=c.getAdminReply()%></td>
                                <td id="addedDate"><%=c.getAddedDate()%></td>
                                <td class="click"><a id="<%=cid%>" class="pagerlink1 btn btn-success"><i class="glyphicon glyphicon-edit"></i></a></td>
                                
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- #END# Exportable Table -->
<script>
    $(document).ready(function() {
        var trdata = "";
        $("#sub_up").hide();

          
         $("#table_items").on('click','.click',function(){
             
         // get the current row
         var currentRow=$(this).closest("tr"); 
         
         var id=currentRow.find("#id").html(); // get current row 1st table cell TD value
         var userType=currentRow.find("#userType").html(); // get current row 2nd table cell TD value
         var name=currentRow.find("#name").html(); // get current row 2nd table cell TD value
         var email=currentRow.find("#email").html(); // get current row 3nd table cell TD value
         var phone=currentRow.find("#phone").html(); // get current row 4nd table cell TD value
         var yourComment=currentRow.find("#yourComment").html(); // get current row 5nd table cell TD value
         var adminReply=currentRow.find("#adminReply").html(); // get current row 6nd table cell TD value
         var addedDate=currentRow.find("#addedDate").html(); // get current row 7nd table cell TD value
        
         var trdata=id+","+userType+","+name+","+email+","+phone+","+yourComment+","+adminReply+","+addedDate;
         //alert(trdata);
                var acti = "edit";
                $.ajax({
                    method: "POST",
                    url: "ChatController",
                    data: {all: trdata, act: acti},
                    success: function(data, textStatus, jqXHR)
                    {
                        var msg = $.trim(data);
                        //alert(msg);
                        if (msg === "updated")
                        {
                              $("#sub_up").show();
                              $("#sub_up").fadeOut(4000);
                        }
                        trdata = "";
                    
                   } 
                  });
               });
        });
</script>
