<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="test20.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="update.jsp">
<table>
<tr>
<td>비밀번호</td>
</tr>
<tr>
<td><input type="password" name="pw"></td>
</tr>
<tr>
<td><input type="hidden" name = "num" value="<%=bean.getNum()%>"><td>
<td><input type="submit" value="확인">
	<input type="button" value="취소" onclick="history.go(-1)">
</table>
</form>
</body>
</html>