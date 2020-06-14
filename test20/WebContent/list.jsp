<%@page import="test20.BoardDAO"%>
<%@page import="test20.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
int pageSize = 2;

String pageNum = request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
int nowPage = Integer.parseInt(pageNum);
int startRow = (nowPage-1)*pageSize+1; //1 1*2+1=3 2*2+1 = 5; 3*2+1 = 7; 4*2+1 = 9; 5*2+1 = 11;
int endRow = pageSize;  	   //2 2*2=4   3*2 = 6;   4*2 = 8;   5*2 = 10;  6*2 = 12;
int count = 0;
BoardDAO dao = new BoardDAO();
count = dao.getAllCount();
Vector<BoardBean> vlist = null;
int listSize = 0;
%>  
<%=count %>
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
	vlist = dao.BoardList(startRow, endRow);
	listSize = vlist.size();
	if(vlist.isEmpty()){
		out.println("등록 된 게시글이 없습니다.");
	}else{
		for(int i=0;i<vlist.size();i++){
			%>
			<tr>
			<td><%=vlist.get(i).getNum()%></td>
			<td><a href="read.jsp?num=<%=vlist.get(i).getNum()%>">
			
			<%=vlist.get(i).getSubject()%></a></td>
			<td><%=vlist.get(i).getName()%></td>
			<td><%=vlist.get(i).getRegdate()%></td>
			<td><%=vlist.get(i).getCount()%></td>
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
<div align="center">

<p>
<%
	if(count>0){
		int pageCount = count/pageSize + ((count%pageSize == 0) ? 0 : 1); 
		//pageCount 전체 페이지 갯수.
		int startPage = ((nowPage-1)/10)*10+1;
		int block = 5;
		int endPage = startPage+block-1;
		
		if(endPage>pageCount) {
			endPage = pageCount;
		}
		
		if(startPage>10){
			%>
			
			<a href="list.jsp?pageNum=<%=startPage-5%>">[이전]</a>
			<%
		}
		for(int i=startPage;i<=endPage;i++){
			if(i==nowPage){
			%>[<%=i%>]<%}else{ %>
			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%			
			}
		}
		if(endPage<pageCount){
			%>
			<a href="list.jsp?pageNum=<%=endPage+10%>">[다음]</a>
			<%
		}
	}

%>
<br/>
</p>
</div>
</body>
</html>