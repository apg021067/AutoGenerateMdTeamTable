<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Markdown Table</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4; /* 회색 배경 */
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background-color: white;
        padding: 40px; /* 패딩을 더 크게 설정 */
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* 그림자 크기 조정 */
        text-align: center;
        width: 80%; /* 컨테이너 너비 설정 */
        max-width: 1200px; /* 최대 너비 설정 */
        overflow: auto; /* 컨테이너에서 넘칠 경우 스크롤 가능 */
    }
    h1 {
        color: #333;
    }
    table {
        width: 100%;
        margin: 20px 0;
        border-collapse: collapse;
        max-width: 100%; /* 테이블이 컨테이너를 넘지 않도록 설정 */
    }
    table, th, td {
        border: solid 1px black;
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    img {
        width: 150px;
        height: 150px;
    }
    #copyButton {
        background-color: #5cb85c;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        margin-top: 20px;
    }
    #copyButton:hover {
        background-color: #4cae4c;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>예시</h1>
        <table>
            <tr id="imageRow"></tr>
            <tr id="idRow"></tr>
        </table>
        <button id="copyButton">복사</button>
    </div>
<script>
var imageRow = '';
var idRow = '';
var mdImageRow = '|';
var mdMiddleRow = '|';
var mdIdRow = '|';
var mdContent = '';

function drawTable() {
    <c:forEach items="${result}" var="item">
        imageRow += '<th><img alt="" src="${item.avatar_url}"/></th>';
        idRow += '<th><a href="https://github.com/${item.login}">@${item.login}</a></th>';
        mdImageRow += '<img src="${item.avatar_url}" width="150" height="150"/>|';
        mdMiddleRow += ':-:|';
        mdIdRow += '[@${item.login}](https://github.com/${item.login})|';
    </c:forEach>
    $('#imageRow').html(imageRow);
    $('#idRow').html(idRow);
    mdContent = '## Team \n'
        + mdImageRow + '\n' 
        + mdMiddleRow + '\n' 
        + mdIdRow;
}

$(document).ready(function(){
    drawTable();

    $('#copyButton').click(function(){
        copyToClipboard(mdContent);
        alert('클립보드에 복사되었습니다!');
    });
});

function copyToClipboard(text) {
    var tempInput = $('<textarea>');
    tempInput.val(text);
    $('body').append(tempInput);
    tempInput.select();
    document.execCommand('copy');
    tempInput.remove();
}
</script>
</body>
</html>
