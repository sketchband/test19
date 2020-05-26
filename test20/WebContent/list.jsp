<%@page import="test20.BoardDAO"%>
<%@page import="test20.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	int count = 0;
	int number = 0;
	
	int nowPage = Integer.parseInt(pageNum);
	
	BoardDAO dao = new BoardDAO();
	
	count = dao.getAllCount();
	
	int startRow = (nowPage-1) * pageSize+1;
	int endRow = nowPage*pageSize;
	
	number = count-(nowPage-1) * pageSize;
	int start = 0;
	int end = 10;
	String keyWord = "";
	String keyField = "";
	Vector<BoardBean> vlist = dao.BoardList(startRow, endRow);
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
	//vlist = dao.BoardList(keyWord, keyField, startRow, endRow);
	listSize = vlist.size();
	if(vlist.isEmpty()){
		out.println("등록 된 게시글이 없습니다.");
	}else{
		for(int i=0;i<vlist.size();i++){
			//if(i==listSize) break;
			BoardBean bean = vlist.get(i);
			%>
			
			<tr>
			<td><%=number-- %></td>
			<td><a href="read.jsp?num=<%=bean.getNum()%>">
			<%
				if(bean.getPos()>1){
					for(int j=0;j<(bean.getPos()-1)*5;j++){
						%>&nbsp;
					<%}
				}
			%>
			<%=bean.getSubject() %></a></td>
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
<div align="center">


<p>
<%
	if(count>0){
		int pageCount = count/pageSize + (count%pageSize ==0 ? 0 : 1);
		int startPage = 1;
		if(nowPage%10!=0){
			startPage = (int)(nowPage/10)*10+1;
		}else{
			startPage = ((int)(nowPage/10-1))*10+1;
		}
		
		int pageBlock=10;
		int endPage = startPage+pageBlock-1;
		if(endPage>pageBlock) endPage = pageCount;
		
		if(startPage>10){
			%>
			<a href="list.jsp?pageNum=<%=startPage-10%>">[이전]</a>
			<%
			
		}
		
		for(int i = startPage;i<=endPage;i++){
			%>
			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%			
		}
		if(endPage<pageCount){
			%>
			<a href="list.jsp?pageNum=<%=startPage+10%>">[다음]</a>
			<%
		}
	}
%>
</p>
</div>
</body>
</html>