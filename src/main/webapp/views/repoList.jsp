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
	table, th, td{
		border-collapse: collapse;
		border: solid 1px black;
		padding: 10px 5px;
	}
</style>
</head>
<body>
	<h2>${id} 유저가 보유한 리포지토리</h2>
	<table>
		<tr>
			<th>프로젝트 이름</th>
			<th>버튼</th>
		</tr>	
		<c:forEach items="${list}" var="item">
		<tr>
			<td>${item.name}</td>
			<td><input type="button" class="${item.name}" onclick="submit(this)" value="선택"/>
		</tr>
		</c:forEach>
	</table>
</body>
<script>
function submit(elem){

	var thisRepoName = $(elem).attr('class');
	var id = '${id}';
	console.log(thisRepoName);
    location.href='./result.go?projectName='+thisRepoName+'&id='+id;
}
</script>
</html>