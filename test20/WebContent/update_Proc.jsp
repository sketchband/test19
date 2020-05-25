<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="test20.BoardBean"/>
<jsp:useBean id="dao" class="test20.BoardDAO"/>
<jsp:setProperty property="*" name="bean"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% dao.update_Proc(bean);
   response.sendRedirect("list.jsp");	
%>
</body>
</html>