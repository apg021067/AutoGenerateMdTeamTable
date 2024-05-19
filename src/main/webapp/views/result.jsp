<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
table, th, th{
	border: solid 1px black;
	border-collapse: collapse;
}
img {
	width: 50px;
	height: auto;
}
</style>
</head>
<body>
	<h1>예시</h1>
	<table>
		<tr id="imageRow">
		</tr>
		<tr id="idRow">
		</tr>
	</table>
	
</body>
<script>

function drawTable() {
	var imageRow = '';
	var idRow = '';
	var mdContent = '';
	<c:forEach items="${result}" var="item">
		imageRow += '<th><img alt="" src="${item.avatar_url}"/></th>';
		idRow += '<th>${item.login}</th>';
	</c:forEach>
	$('#imageRow').html(imageRow);
	$('#idRow').html(idRow);
}
$(document).ready(function(){
    drawTable();
});
</script>
</html>