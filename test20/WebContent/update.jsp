<%@page import="test20.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="test20.BoardDAO"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
int num = Integer.parseInt(request.getParameter("num"));  
BoardBean bean = dao.BoardRead(num); %>
<center><h2>게시글 수정</h2></center>
<form method="post" action="update_Proc.jsp">
<div align="center">
<table>
<tr>
<td>제목</td>
<td><input name="subject" value="<%=bean.getSubject()%>"></td>
</tr>

<tr>
<td>이름</td>
<td><input name="name" value="<%=bean.getName()%>"></td>
</tr>
<tr>
<td>이메일</td>
<td><input name="email" value="<%=bean.getEmail()%>"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input name="pw" type="password"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea rows="15" cols="60" name="content"><%=bean.getContent()%></textarea></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="수정">
	<input type="button" value="취소" onclick="location.href='list.jsp'">
	</td>
	</tr>
</table>
</div>
</form>
</body>
</html>