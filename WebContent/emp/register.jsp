<%@page import="erp.dto.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

	function runAjax() {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				document.getElementById("checkVal").innerHTML = xhr.responseText;
			}
		}
		xhr.open("POST", "/kimsaemERP/IdCheck.do", true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send("id=" + myform.id.value);
	}
</script>
 </head>
<body>
	<div class="container-fluid">
			<form role="form" class="form-horizontal"
				action="/kimsaemERP/insert.do" method="POST" 
				name="myform" enctype="multipart/form-data">
				<fieldset>
					<div id="legend">
						<legend>�Ʒ� ����� �ۼ����ּ���.</legend>
					</div>
					<div class="form-group" style="padding: 40px">
						<p class="centered">
							<img src="/kimsaemERP/images/myphoto.jpg" 
							 id="userImage" style="width: 100px">
						</p>
						<div>
							<input type="file" name="userImage"
								 onchange="document.getElementById('userImage').src = window.URL.createObjectURL(this.files[0])"
								accept="image/*">
						</div>
					</div>
					
					<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-2" for="orgcode">�μ��ڵ�</label>
						<div class="col-sm-3">
							<select name="deptno" class="form-control" >
							<% ArrayList<DeptDTO> list =  (ArrayList<DeptDTO>)request.getAttribute("list"); 
							%>
							<% for(int i=0; i<list.size(); i++){
								%>
								<option value="<%=list.get(i).getDeptno() %>"><%=list.get(i).getDeptname() %>
							<% }%>
								
							</select>
						</div>
					</div>
		
					
					
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-2" for="orgname">����</label>
						<div class="col-sm-3">
							<input type="text" id="orgname" name="name"
								placeholder="����" class="form-control"  required>

						</div>
					</div>
					<div class="form-group">
						<!-- ���-->
						<label class="control-label col-sm-2" for="id">���</label>
						<div class="col-sm-3">
							<input type="text" id="id" name="id"
								placeholder="���" class="form-control" 
								required onkeyup="runAjax()">
							
						</div>
						<span id="checkVal"></span>
					</div>
					<div class="form-group">
						<!-- �н�����-->
						<label class="control-label col-sm-2" for="pass">�н�����</label>
						<div class="col-sm-3">
							<input type="text" id="pass" name="pass"
								placeholder="�н�����" class="form-control">

						</div>
					</div>
					<div class="form-group">
						<!-- �ֹι�ȣ-->
						<label class="control-label col-sm-2" for="ssn">�ֹι�ȣ</label>
						<div class="col-sm-3">
							<input type="text" id="ssn" name="ssn"
								placeholder="�ֹι�ȣ" class="form-control" 
								 >

						</div>
					</div>
					<div class="form-group">
						<!-- ����-->
						<label class="control-label col-sm-2" for="birthday">�������</label>
						<div class="col-sm-3">
							<input type="text" id="birthday" name="birthday"
								placeholder="�������" class="form-control" 
								>

						</div>
					</div>
					<div class="form-group">
						<!-- ��ȥ����-->
						<label class="control-label col-sm-2" for="marry">��ȥ����</label>
						<div class="col-sm-3">
							<input type="checkbox" id="marry" name="marry"
								placeholder="��ȥ����">��ȥ����

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">�����ȣ</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="zipcode"
								id="zipcode" >
						</div>
						<div class="col-sm-2">
							<button type="button"
								class="btn btn-round btn-primary form-control">�����ȣ �˻�</button>
						</div>
					</div>
					<div class="form-group">
						<!-- �ּ�-->
						<label class="control-label col-sm-2" for="addr">�ּ�</label>
						<div class="col-sm-6">
							<input type="text" id="addr" name="addr" 
							placeholder="�ּ�"
								class="form-control"  required>
							
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label"></label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="detailaddr"
								id="detailaddr" >
						</div>
					
					</div>
					<div class="form-group">
						<!-- ����ȭ-->
						<label class="control-label col-sm-2" for="phonehome">����ȭ</label>
						<div class="col-sm-5">
							<input type="text" id="phonehome" name="phonehome" 
							placeholder="����ȭ"
								class="form-control"  required>

						</div>
					</div>
					<div class="form-group">
						<!-- ȸ����ȭ-->
						<label class="control-label col-sm-2" for="phoneco">ȸ����ȭ</label>
						<div class="col-sm-5">
							<input type="text" id="phoneco" name="phoneco" 
							placeholder="ȸ����ȭ"
								class="form-control"  required>

						</div>
					</div>
					<div class="form-group">
						<!-- ����ȭ-->
						<label class="control-label col-sm-2" for="phonehome">�ڵ�����ȣ</label>
						<div class="col-sm-5">
							<input type="text" id="phonecell" name="phonecell" 
							placeholder="�ڵ�����ȣ"
								class="form-control" required>

						</div>
					</div>
					<div class="form-group">
						<!-- ���-->
						<label class="control-label col-sm-2" for="grade">�̸���</label>
						<div class="col-sm-3">
							<input type="text" id="email" name="email" 
							placeholder="�̸���"
								class="form-control"  required>

						</div>
					</div>
					<div class="form-group">
						<!-- Button -->
						<div class="col-sm-3 col-sm-offset-2">
							<input type="submit" value="�����ϱ�" class="btn btn-success"/>
						</div>
					</div>
				</fieldset>
			</form>
	</div>
	<div><a href="/serverweb/emp/emp_list.jsp">ȸ����Ϻ���</a></div>
</body>
</html>