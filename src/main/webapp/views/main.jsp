<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Repository Search</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    h1 {
        color: #333;
    }
    input[type="search"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="submit"] {
        background-color: #5cb85c;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #4cae4c;
    }
    .alert {
        color: red;
        font-weight: bold;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Repository Search</h1>
        <form id="searchForm" action="search.do" method="get">
            <p>리포지토리 소유자를 입력해 주세요.</p>
            <input type="search" name="id" id="searchInput" placeholder="검색할 유저ID를 입력하세요."/> 
            <input type="submit" value="검색">
        </form>
        <div class="alert" id="alertMsg" style="display: none;">존재하지 않는 유저 이거나 소유한 리포지토리가 없습니다.</div>
    </div>
<script>
$(document).ready(function() {
    var msg = '${result}';
    if (msg != '') {
        $('#alertMsg').show();
    }

    $('#searchForm').on('submit', function(e) {
        var searchInput = $('#searchInput').val().trim();
        if (searchInput === '') {
            alert('검색할 유저ID를 입력하세요.');
            e.preventDefault();
        }
    });
});
</script>
</body>
</html>
