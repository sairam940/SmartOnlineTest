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
                    FACULTY'S CHAT
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
                                <th>COMMENT DATE</th>
                                <th>YOUR REPLY</th>
                                <th>REPLY DATE</th>
                                <th>Added DATE</th>
                                <th>ACTION</th>
                            </tr>
                        </thead>

                        <tbody id="tbody">
                            <%
                                String userType="Faculty";
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
                                <td id="userComment"><%=c.getUserComment()%></td>
                                <td id="commentDate"><%=c.getCommentDate()%></td>
                                <td contenteditable="true" id="adminReply"><%=c.getAdminReply()%></td>
                                <td id="replyDate"><%=c.getReplyDate()%></td>
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
         
         var id=currentRow.find("#id").html(); 
         var userType=currentRow.find("#userType").html(); 
         var name=currentRow.find("#name").html(); 
         var email=currentRow.find("#email").html();
         var phone=currentRow.find("#phone").html(); 
         var userComment=currentRow.find("#userComment").html(); 
         var commentDate=currentRow.find("#commentDate").html();
         //var addedDate=currentRow.find("#addedDate").html();
         var adminReply=currentRow.find("#adminReply").html();
         var trdata=id+","+userType+","+name+","+email+","+phone+","+userComment+","+commentDate+","+adminReply;
         //alert(trdata);
                var acti = "edit";
                $.ajax({
                    method: "POST",
                    url: "ChatController",
                    data: {all: trdata, act: acti},
                    success: function(data)
                    {
                        var msg = $.trim(data);
                        //alert(msg);
                        if (msg === "updated")
                        {
                              $("#sub_up").show();
                              $("#sub_up").fadeOut(4000);
                              location.reload();
                        }
                        trdata = "";
                    
                   } 
                  });
               });
        });
</script>
