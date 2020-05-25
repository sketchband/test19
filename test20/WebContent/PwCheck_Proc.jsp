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
<% String pw = request.getParameter("pw");
   int num = Integer.parseInt(request.getParameter("num"));
   if(pw.equals(dao.PwCheck(num))){
	  %>
	  <script>
	  location.href="update.jsp";
	  </script>
  <% }else{%>
	   alert("비밀번호를 확인해 주십시오.");
	   history.go(-1);<%
   }
%>
</body>
</html>