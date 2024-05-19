<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h1>RepositorySearch</h1>
	<form action="search.do" method="get">
		<p>리포지토리 소유자를 입력해 주세요.</p>
		<input type="search" name="id" placeholder="검색할 유저ID를 입력하세요."/> 
		<input type="button" onclick="submit()" value="검색">
	</form>
</body>
<script>
function submit(){
	$('this').submit();	
}
</script>
</html>