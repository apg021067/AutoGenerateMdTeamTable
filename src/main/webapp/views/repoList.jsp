<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Repository List</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 20px;
    }
    h2 {
        color: #333;
        text-align: center;
    }
    .table-container {
        position: relative;
        width: 60%;
        margin: 20px auto;
    }
    table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        border: solid 1px #ddd;
        padding: 10px;
    }
    td {
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .button-cell {
        width: 150px;
        text-align: center;
    }
    input[type="button"] {
        background-color: #5cb85c;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        width: 100px;
    }
    input[type="button"]:hover {
        background-color: #4cae4c;
    }
    .back-button {
        position: absolute;
        top: -40px;
        right: 0;
        background-color: #343a40 !important; /* 어두운 회색 배경색 */
        color: white !important; /* 흰색 텍스트 */
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        font-size: 14px;
    }
    .back-button:hover {
        background-color: #23272b !important; /* 더 어두운 회색 배경색 */
    }
</style>
</head>
<body>
    <h2>${id} 유저가 보유한 리포지토리</h2>
    <br/>
    <div class="table-container">
        <input type="button" class="back-button" onclick="location.href='./'" value="뒤로가기"/>
        <table>
            <tr>
                <th>프로젝트 이름</th>
                <th class="button-cell">버튼</th>
            </tr>
            <c:if test="${list.size() == 0 }">
            <tr>
                <th colspan="2">
                    보유한 리포지토리가 없습니다.
                </th>
            </tr>
            </c:if>
            <c:forEach items="${list}" var="item">
            <tr>
                <td>${item.name}</td>
                <td class="button-cell"><input type="button" class="repo-button" data-repo-name="${item.name}" value="선택"/></td>
            </tr>
            </c:forEach>
        </table>
    </div>
<script>
function submit(elem) {
    var thisRepoName = $(elem).data('repo-name');
    var id = '${id}';
    location.href = './result.go?projectName=' + encodeURIComponent(thisRepoName) + '&id=' + encodeURIComponent(id);
}

$(document).ready(function(){
    $('.repo-button').on('click', function(){
        submit(this);
    });
});
</script>
</body>
</html>
