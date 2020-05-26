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
		dao.deleteBoard(num);
		%>
		<script type="text/javascript">
		location.href="list.jsp";
		</script>
	<%}else{
		%>
		<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
		</script>
		
	<%}

%>
</body>
</html>