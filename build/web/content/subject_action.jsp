<%@page import="java.util.Iterator"%>
<%@page import="models.FacultyModel"%>
<%@page import="entities.Faculty"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Subject"%>
<%@page import="models.SubjectModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Exportable Table -->

<%
       String deleted=(String)session.getAttribute("deleted");
       if(deleted!=null)
       {
           session.removeAttribute("deleted");
           %>
                <div class="alert bg-pink alert-dismissible" role="alert">
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <center> <strong>Subject deleted Successfully. .</strong> </center>
               </div>
           <%
           
       }
           %>
                <div class="alert bg-green alert-dismissible" role="alert" id="sub_up">
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <center> <strong>Subject Updated Successfully. .</strong> </center>
               </div>
<div class="row clearfix">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="card">
            <div class="header">
                <h2>
                    VIEW SUBJECT
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
                                <th>SUBJECT</th>
                                <th>FACULTY</th>
                                <th>TOTAL QUESTION</th>
                                <th>TOTAL TIME</th>
                                <th>TOTAL MARKS</th>
                                <th>UPDATED DATE</th>
                                <th>EDIT</th>
                                <th>DELETE</th>
                            </tr>
                        </thead>

                        <tbody id="tbody">
                            <%
                                ArrayList<Subject> list = SubjectModel.getSubject();
                                int count=0;
                                String name="";
                                for (Subject s : list) {
                                    int did = s.getId();
                                    count++;
                                    List<Faculty> lists=FacultyModel.getFacultyName(s.getFacultyEmail());
                                    Iterator itr=lists.iterator();
                                    if(itr.hasNext())
                                    {
                                        Faculty f=(Faculty)itr.next();
                            %>
                            <tr>
                                <td><%=count%></td>
                                <td id="id"><%=s.getId()%></td>
                                <td contenteditable="true" id="name"><%=s.getName()%></td>
                                <td id="facultyName"><%=f.getFname()%> <%=f.getLname()%></td>
                                <td style="display: none;" id="facultyEmail"><%=s.getFacultyEmail()%></td>
                                <td contenteditable="true" id="ques"><%=s.getTotalQuestion()%></td>
                                <td contenteditable="true" id="td"><%=s.getTimeDuration()%></td>
                                <td contenteditable="true" id="tm"><%=s.getTotalMarks()%></td>
                                <td id="upd"><%=s.getUpdatedDate()%></td>
                                <td class="click"><a id="<%=did%>" class="pagerlink1 btn btn-success"><i class="glyphicon glyphicon-edit"></i></a></td>
                                <td><a id="<%=s.getId()%>" class="pagerlink btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a></td>
                            </tr>
                            <%
                                    }
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
</div>
<script>
    $(document).ready(function()
    {
        $('a.pagerlink').click(function()
        {
            var id = $(this).attr('id');
            var actio = "delete";
            if(confirm("Are you sure you want to delete this subject?")){
                $(this).attr("href", "addSubject?id=" + id + "&actio=" + actio);
            $("#sub_del").show().fadeOut(4000);
            }else{
                return false;
            }                
        });

    });
  
</script>
<script>
    $(document).ready(function() {
        var trdata = "";
        $("#sub_up").hide();  
         $("#table_items").on('click','.click',function(){     
         // get the current row
         var currentRow=$(this).closest("tr"); 
         
         var id=currentRow.find("#id").html(); 
         var facultyName=currentRow.find("#facultyName").html();
         var facultyEmail=currentRow.find("#facultyEmail").html();
         var name=currentRow.find("#name").html(); 
         var ques=currentRow.find("#ques").html();
         var td=currentRow.find("#td").html(); 
         var tm=currentRow.find("#tm").html(); 
         var upd=currentRow.find("#upd").html();
        
         var trdata=id+","+facultyName+","+facultyEmail+","+name+","+ques+","+td+","+tm;
         //alert(trdata);
                var acti = "edit";
                $.ajax({
                    method: "POST",
                    url: "addSubject",
                    data: {all: trdata, act: acti},
                    success: function(data, textStatus, jqXHR)
                    {
                        var msg = $.trim(data);
                        //alert(msg);
                        if (msg === "updated")
                        {
                              $("#sub_up").show();
                              $("#sub_up").fadeOut(4000);
                              setTimeout(function() {// wait for 5 secs(2)
                            location.reload(); // then reload the page.(3)
                        }, 2000);
                        }
                        trdata = "";
                   } 
                  });
               });
        });
</script>
