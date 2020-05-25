<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="test20.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>  \
<jsp:useBean id="dao" class="test20.BoardDAO"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% dao.UPdateBoard(bean);
   response.sendRedirect("list.jsp");
%>
</body>
</html>