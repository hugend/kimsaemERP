<%@page import="erp.dto.LoginDTO"%>
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

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
<script src="/kimsaemERP/common/js/jquery.cookie.js"></script>
<script src="/kimsaemERP/common/js/jquery.treeview.js"
	type="text/javascript"></script>
<script src="/kimsaemERP/common/js/demo.js" type="text/javascript"></script>

<script type="text/javascript">
	function runAjax(mydeptno) {
		//�Ź� �μ����� Ŭ���Ҷ����� runAjax�� ȣ��ǰ� mydeptno�� Ŭ���� �μ��� �μ���ȣ�� ���޵ȴ�.
		deptno = mydeptno;	//�ڿ��������� ����� ��
		//alert(deptno);
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = readyCallback;
		xhr.open("GET", "/kimsaemERP/emptree.do?deptno="+deptno, true);
		xhr.send();
	}
	function readyCallback(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			//alert(xhr.responseText);
			//html, txt, json �� ���
			//�����κ��� ���޵� json ������ ���ڿ��� �Ľ��ؼ� �ڹٽ�ũ��Ʈ���� ������ �� �ִ� 
			// JSON ��ü�� ��ȯ
			var myjsonObj = JSON.parse(xhr.responseText);
			//alert(myjsonObj.emplist[0].name);
			//�۾����ΰ�ü���ϱ� - �۾����� ��ü�� ������ ����
/* 			deptnode = document.getElementById(mydeptno);
			deptchilds = deptnode.childNodes;
			alert(deptchilds.length);
			//myjsonObj.emplist ���� �ϳ��� ��ü�� ������ i�� �����ϰ�
			//myjsonObj.emplist ��+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++�� ����� object�� ������ŭ for���� ����
			for(i in myjsonObj.emplist){
				
			} */
			//�ش� ul��忡 json ��ü���� ������ name �� �߰��ϱ� - innerHTML
			var deptnode = document.getElementById(deptno);
			//alert(myjsonObj.emplist.length)
			//myjsonObj.emplist�� ����� JSONObject�� �ϳ��� ������ i �� �Ҵ�
			mydata="";
			for (i in myjsonObj.emplist) {
				var id = myjsonObj.emplist[i].id;
					mydata = mydata+
					"<li><span class='file' onclick=empInfo('"+id+"')>"+
					myjsonObj.emplist[i].name+"</span></li></a>";
			}
			deptnode.innerHTML = mydata;
		}
		
	}
	
	
	//emp������ ajax�� ��û
	function empInfo(empid){
		id = empid
		alert("test:"+id);
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = readyCallback1;
		xhr.open("GET", "/kimsaemERP/getEmpInfo.do?id="+id, true);
		xhr.send();
	}
	
	function readyCallback1(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			mydiv = document.getElementById("empinfo")
			mydiv.setAttribute("style", "display:block");
			alert(xhr.responseText);
			var rootjson = JSON.parse(xhr.responseText);
			var deptnode = document.getElementById("deptno");
				deptnode.innerHTML = "<div>"+rootjson.empjson.deptno+"</div>";
			 	document.getElementById("name").innerHTML = "<div>"+rootjson.empjson.name+"</div>";
			 	document.getElementById("id").innerHTML = "<div>"+rootjson.empjson.id+"</div>";
			 	document.getElementById("position").innerHTML = "<div>"+rootjson.empjson.position+"</div>";
			 	document.getElementById("duty").innerHTML = "<div>"+rootjson.empjson.duty+"</div>";
			 	document.getElementById("userImage").src="/kimsaemERP/images/"+rootjson.empjson.profile_photo;
		}
	}
	</script>
</head>
<%	ArrayList<DeptDTO> list = (ArrayList<DeptDTO>) request.getAttribute("list");
		 LoginDTO user = (LoginDTO)session.getAttribute("loginUser");
	%>
<body>

	<h1 id="banner">ERP ������</h1>
	<div id="deptlist" class="col-sm-6" style="margin: 20px">
		<ul id="browser" class="filetree">
			<%	for (int i = 0; i < list.size(); i++) {	%>
			<li class="closed" id=""><span class="folder"
				onclick="runAjax('<%=list.get(i).getDeptno()%>')"><%=list.get(i).getDeptname()%></span>
				<ul id="<%=list.get(i).getDeptno()%>">
					<!-- 		<li><span id="result" class="file"></span></li> -->
				</ul> <%
					}
				%></li>
		</ul>
	</div>
	
	<div style="margin-top: 20px; height: 400px; display: none;" class=col-sm-5" id="empinfo" >
		<form role="form" class="form-horizontal"
			action="/kimsaemERP/getEmpInfo.do" method="get" name="myform">
			<fieldset>
				<div id="legend">
					<legend>������ ����� �⺻ �����Դϴ�.</legend>
				</div>
				<div class="form-group">
					<p class="col-sm-4">
						<img src=""
							id="userImage" style="width: 100px">
					</p>
					<div class="col-sm-7" style="color: blue;">���� ������ �������� ������
						������ ���Ͻø� �μ����λ���ȸ�� �����ϰ� �۾��ϼ���.</div>

				</div>
				<div class="form-group">
					<!-- �μ��ڵ� -->
					<label class="control-label col-sm-4" for="orgcode">�μ��ڵ�</label>
					<div class="control-label col-sm-3" id="deptno">
						<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
					</div>
				</div>
				
				 	<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-4" for="orgcode">�μ���</label>
						<div class="control-label col-sm-3">
							<!-- ���⿡ �μ��ڵ带 ����ϼ���  -->
						</div>
					</div> 

				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-4" for="name">����</label>
					<div class="control-label col-sm-3" id="name">
					</div>
				</div>
				<div class="form-group">
					<!-- ���-->
					<label class="control-label col-sm-4" for="id">���</label>
					<div class="control-label col-sm-3" id="id">
						<!-- ���⿡ ����� ����ϼ���  -->
					</div>
					<span id="checkVal"></span>
				</div>


				<div class="form-group">
					<!-- ����-->
					<label class="control-label col-sm-4" for="birthday">����</label>
					<div class="control-label col-sm-3" id="position">
						<!-- ���⿡ ���� ����ϼ���  -->
					</div>
				</div>
				<div class="form-group">
					<!-- ��å-->
					<label class="control-label col-sm-4" for="birthday">��å</label>
					<div class="control-label col-sm-3" id="duty">
						<!-- ���⿡ ��å ����ϼ���  -->
					</div>
				</div>



			</fieldset>
		</form>
	</div>
	
	
</body>
</html>