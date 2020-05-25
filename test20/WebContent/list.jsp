<%@page import="test20.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="test20.BoardDAO"/>  
<%
	int pageRecoards = 10;
	int start = 0;
	int end = 10;
	String keyWord = "";
	String keyField = "";
	Vector<BoardBean> vlist = null;
	int listSize = 0;
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center><h2>게시판</h2></center>
<div align="center">
<table width="80%">
<tr>
<td width="20%">번 호</td>
<td width="20%">제 목</td>
<td width="20%">작성자</td>
<td width="20%">날 짜</td>
<td width="20%">조회수</td>
</tr>
<%
	vlist = dao.BoardList(keyWord, keyField, start, end);
	listSize = vlist.size();
	if(vlist.isEmpty()){
		out.println("등록 된 게시글이 없습니다.");
	}else{
		for(int i=0;i<pageRecoards;i++){
			if(i==listSize) break;
			BoardBean bean = vlist.get(i);
			%>
			<tr>
			<td><%=bean.getNum() %></td>
			<td><a href="read.jsp?num=<%=bean.getNum()%>"><%=bean.getSubject() %></a></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getRegdate()%></td>
			<td><%=bean.getCount()%></td>
			</tr>
	<%} %>
<%} %>	

<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td><input type="button" value="글 작성" onclick="location.href='post.jsp'"></td>
</tr>
</table>
</div>
</body>
</html>