<%@page import="java.util.ArrayList"%>
<%@page import="board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
	<% ArrayList<BoardDTO> list = (ArrayList<BoardDTO>)request.getAttribute("boardlist"); %>
	<h1>게시판</h1>
	<table class="table">
		<thead>
			<tr>	
				<th>구분</th>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th></th>
			</tr>
				</thead>
				<tbody>
					<%for(int i=0; i<list.size(); i++){
				%>
					<tr>
						<td><%= list.get(i).getBo_div() %></td>
						<td><%=list.get(i).getBo_no() %></td>
						<td><%=list.get(i).getBo_title() %></td>
						<td><%=list.get(i).getBo_id() %></td>
						<td><%=list.get(i).getBo_date() %></td>
						<td><a
							href="/kimsaemERP/board/delete.do?bo_no=<%=list.get(i).getBo_no()%>">삭제</a></td>
					</tr>
					<% }%>
				</tbody>
		</table>
	<a href="/kimsaemERP/board/insert.do">글쓰기</a>
	</div>
</body>
</html>