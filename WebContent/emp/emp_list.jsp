<%@page import="erp.dto.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%
	String str = "test";
%>
<title>Bootstrap Example</title>
<meta charset="euc-kr">

</head>
<body>

	<div>
		<br />
		<br />
		<p>�λ���</p>
		<table class="table">
			<thead>
				<tr>
					<th>���̵�</th>
					<th>����</th>
					<th>�μ���</th>
					<th>��å</th>
					<th>��������</th>
					<th>�系��ȣ</th>
				</tr>
			</thead>
			<tbody>
			<% 
			ArrayList<DeptDTO> list =(ArrayList<DeptDTO>)request.getAttribute("list");
			%>
				<% for(int i=0; i<list.size(); i++){%>
					<tr>
					<td><a href="#"><%=list.get(i).getId() %></a></td>
					<td><%=list.get(i).getName() %></td>
					<td><%=list.get(i).getDeptname() %></td>
					<td><%=list.get(i).getDuty() %></td>
					<td><a href="/kimsaemERP/emp/empread.do?id=<%=list.get(i).getId()%>">��������</a></td>
					<td><a href="#"><%=list.get(i).getPhoneco() %></a></td>
				</tr>
			<% }%>
			</tbody>
		</table>
		<ul class="pagination" style="">
			<li><a href="#" aria-label='Previous'>&laquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li class="disabled"><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label='Next'>&raquo;</a></li>
		</ul>
	</div>

</body>
</html>
