<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int num = Integer.parseInt(request.getParameter("num")); %>
<form method="post" action="delete2.jsp">
<table>
<tr>
<td>비밀번호</td>
</tr>
<tr>
<td><input type="password" name="pw"></td>
</tr>
<tr>
<td><input type="hidden" name = "num" value="<%=num %>"><td>
<td><input type="submit" value="확인">
	<input type="button" value="취소" onclick="history.go(-1)">
</table>
</form>
</body>
</html>