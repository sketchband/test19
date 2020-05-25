<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int num = Integer.parseInt(request.getParameter("num"));  %>
<center><h2>본인확인</h2></center>
<form method="post" action="PwCheck_Proc.jsp">
<div align="center">
<table>
<tr>
<td align="center">비밀번호를 입력해주세요.</td>
</tr>
<tr>
<td align="center"><input type="password" name="pw">
	<input type="hidden" value="<%=num %>" name="num">
</td>
</tr>

<tr>
<td align="center"><input type="submit" value="확인">
	<input type="button" value="취소" onclick="history.go(-1)">
</td>
</tr>
</table>
</div>
</form>
</body>
</html>