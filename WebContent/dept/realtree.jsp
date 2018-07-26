<%@page import="erp.dto.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<title>jQuery treeview</title>

<link rel="stylesheet" href="/kimsaemERP/common/css/jquery.treeview.css" />
<!-- <link rel="stylesheet" href="/kimsaemERP/common/css/screen.css" /> -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/kimsaemERP/common/js/jquery.cookie.js"></script>
<script src="/kimsaemERP/common/js/jquery.treeview.js" type="text/javascript"></script>
<script src="/kimsaemERP/common/js/demo.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".folder").on("click", function() {
			deptname = $(this).text().trim();
			//this�� �������� ����
			ulnode = $(this).next();
			//ul ����� id�Ӽ����� ���ϱ�
			deptno = $(ulnode).attr("id");
			//alert(deptno)
			$.get("kimsaemERP/emptree.do", {"deptno": deptno}, getData, "json");
	
		});
		// �������� ������ ���(ajax �������� �߰��� �±�)�� �̺�Ʈ�� �����ϴ� ���
		// 1 �Ű� ���� - �̺�Ʈ ����, 2 �Ű����� - � �±׿� �̺�Ʈ�� ������ ������ ����
		// 3 �Ű� ���� - �̺�Ʈ�� �߻��Ҷ� ������ �Լ�
		$(document).on("click", ".file", function(){
			alert("test");
		})
		
	});
	function getData(data) {
		//alert(data.emplist[0].name);
		myli = "";
		for(i in data.emplist){
			myli = myli+"<li><span class='file' id='"+
				data.emplist[i].id+"'>"+
				data.emplist[i].name+"</span></li>";
		}
	}
</script>
</head>
	<%	ArrayList<DeptDTO> list = (ArrayList<DeptDTO>) request.getAttribute("list"); %>
<body>
	<h1 id="banner">ERP ������ - ��������ǥ��</h1>
		<ul id="browser" class="filetree">
			<%	for (int i = 0; i < list.size(); i++) {	%>
			<li class="closed" id="" value="">
			<span class="folder" id="deptnobtn"><%=list.get(i).getDeptname()%></span>
			<ul id="<%=list.get(i).getDeptno()%>">
			</ul>
				<%
					}
				%></li>
		</ul>

</body>
</html>