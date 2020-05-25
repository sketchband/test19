<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int pos = Integer.parseInt(request.getParameter("pos"));
	int depth = Integer.parseInt(request.getParameter("depth"));
%>
<center><h2>답글 작성</h2></center>
<form method="post" action="reply_Proc.jsp">
<div align="center">
<table>
<tr>
<td>제목</td>
<td><input name="subject" value="[re] "></td>
</tr>

<tr>
<td>이름</td>
<td><input name="name"></td>
</tr>
<tr>
<td>이메일</td>
<td><input name="email"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input name="pw" type="password"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="15" cols="60" name="content"></textarea>
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="pos" value="<%=pos%>">
	<input type="hidden" name="depth" value="<%=depth%>">
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="작성">
	<input type="button" value="취소" onclick="history.go(-1)">
	</td>
	</tr>
</table>
</div>
</form>
</body>
</html>