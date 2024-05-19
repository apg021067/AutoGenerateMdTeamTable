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
table, th, td {
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
		<tr id="imageRow"></tr>
		<tr id="idRow"></tr>
    </table>
    <button id="copyButton">복사</button>
</body>
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
        idRow += '<th>${item.login}</th>';
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
        alert('클립보드에 복사!');
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
</html>
