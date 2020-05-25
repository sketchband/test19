<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>   
<jsp:useBean id="dao" class="test20.BoardDAO"/>
<jsp:useBean id="bean" class="test20.BoardBean"/>
<jsp:setProperty property="*" name="bean"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int num = Integer.parseInt(request.getParameter("num")); 
   String pw = request.getParameter("pw");
%>
<%
	if(pw.equals(dao.PwCheck(num))){
		%>맞음
	<%}else{
		%>틀림
	<%}
%>
</body>
</html>