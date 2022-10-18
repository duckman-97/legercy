<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
     <%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix= "fmt" %>
        <%@ include file ="../includes/header.jsp" %>



<div class = "row">
<div class = "col-lg-12">
	<div class = "panel panel-default">
	<div class = "panel-heading">Board Register</div>
	<div class = "panel-body">
	<form role="form" action="/board/register" method = "post">
	<div class = "form-group">
	<label>Title</label>
	<input class = "form-control" name = "title">
	
	</div>
	</form>
	</div>
	</div>
</div>


</div>

