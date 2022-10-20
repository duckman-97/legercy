<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
     <%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix= "fmt" %>
     
       <%@ include file ="../includes/header.jsp" %>
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                            <button id='regBtn' type="button" class= "btn btn-xs pull-right">Register new Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table  class="table table-striped table-bordered table-hover" >
                                <thead>
                                     <tr>
                                        <th>#번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                 <c:forEach items = "${list}" var = "board">
                                <tr>
                                <td><c:out value="${board.bno}" /></td>
                                <td><a href = '/board/get?bno=<c:out value = "${board.bno }"/>'>
                                <c:out value="${board.title}" /> </a></td>
                               
                                
                                <td><c:out value="${board.writer}" /></td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
                                	</tr>
                                	
                                	</c:forEach>
                               
                            </table>
                            
                            
                            <div class ="pull-right">
                            
                            
                            <ul class = "pagination">
                       
                            <c:if test = "${pageMaker.prev}">
                            	<li class = "paginate_button previous"><a href = "${pageMaker.startPage -1}"> Previous</a>
                            	</li>
                            	
                            	</c:if>
                            	
                            	
                            	<c:forEach var = "num" begin = "${pageMaker.startPage}"
                            	end="${pageMaker.endPage }">
                            	<li class = "paginate_button  ${pageMaker.cri.pageNum==num ? "active":""} "><a href = "${num} ">${num} </a>
                            	</li>
                            	</c:forEach>
                            	
                            	<c:if test = "${pageMaker.next }">
                            	<li class = "paginate_button next"><a href="${pageMaker.endPage + 1} }">Next</a>
                            	</li>
                            	</c:if>
                            	
                            	
                            	
                            	
                            	
                            </ul>
                            
                            <!-- - end Pagination -->
                            </div>
                            
                            
                            
                            
                            
                            
                            <!--  Modal 추가 -->
                            <div class = "modal fade" id = "myModal" tabindex = "-1" role = "dialog"
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            
                            <div class = "modal-dialog">
                            <div class = "modal-content">
                            <div class = "modal-header">
                            <button type = "button" class = "close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                            <h4 class ="modal-title" id = "myModalLabel">Modal title</h4>
                            </div>
                            <div class = "modal-body">처리가 완료되었습니다</div>
                            
                            <div class= "modal-footer">
                            <button type="button" class = "btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save Changes</button>
                            
                          	</div>
                            </div>
                            <!-- /.modal-content -->
                            </div>
                            </div>
                            
                            
                      
                       
                                  
               				<div>
                            <form id = 'actionForm' action = "/board/list" method = 'get'>
                            <input type = 'hidden' name = 'pageNum' value = '${pageMaker.cri.pageNum}' >
                            <input type = 'hidden' name = 'amount' value = '${pageMaker.cri.amount }'>
                            </form>
                            </div>
                
                            
                            
                            
                            
                            </div>
                            
                            <!--  end panel-body -->
                            </div>
                            <!-- end panel -->
                            </div>
                            </div>
                            <!--  ./row  -->
                           
                           
                
                         <script type = "text/javascript">
                       $(document).ready(function(){
                    	   
                    	   var result = '<c:out value = "${result}"/>';
                    	   
                    	   checkModal(result);
                    		   
                    		 history.replaceState({},null,null);
                    		 
                    		   
                    		  function checkModal(result){
                    		   if(result === '' || history.state){
                    			  return;
                    			   
                    			   
                    		   }
                    		   
                    		   if(parseInt(result)>0){
                    			   
                    			   $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
                    			   
                    			   
                    		   }
                    		   
                    		   $("#myModal").modal("show");   
                    	   }
                    	   
                    	   
                    	  $("#regBtn").on("click",function(){
                    			self.location = "/board/register";
                    		  
                    		  
                    	  });
                    	  
                    	  
                    	   var  actionForm = $("#actionForm");
                    	   
                    	   $(".paginate_button a").on("click",function(e){
                    		   e.preventDefault();
                    		   console.log("click");
                    		   
                    		   actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
                    		   
                    		   actionForm.submit();
                    		   
                    	   })
                    	   
                    	   
                    	   
                    	   
                    	   

                       });
   
                         
                         </script>
                           
                          
       <%@ include file ="../includes/footer.jsp" %>

</body>
</html>