<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="dao" class="test20.BoardDAO"/>   
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
<% if(pw.equals(dao.PwCheck(num))){
	%>
	<script type="text/javascript">location.href="update2.jsp?num=<%=num%>"</script>
<%}else{
	%><script type="text/javascript">
	alert("비밀번호 틀림");
	history.go(-1);
	</script>
<%}%>
</body>
</html>