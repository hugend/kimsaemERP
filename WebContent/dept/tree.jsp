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
		//매번 부서명을 클릭할때마다 runAjax가 호출되고 mydeptno로 클릭한 부서의 부서번호가 전달된다.
		deptno = mydeptno;	//뒤에서명으로 사용할 값
		//alert(deptno);
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = readyCallback;
		xhr.open("GET", "/kimsaemERP/emptree.do?deptno="+deptno, true);
		xhr.send();
	}
	function readyCallback(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			//alert(xhr.responseText);
			//html, txt, json 인 경우
			//서버로부터 전달된 json 형식의 문자열을 파싱해서 자바스크립트에서 제어할 수 있는 
			// JSON 객체로 변환
			var myjsonObj = JSON.parse(xhr.responseText);
			//alert(myjsonObj.emplist[0].name);
			//작업중인객체구하기 - 작업중인 객체의 하위로 접근
/* 			deptnode = document.getElementById(mydeptno);
			deptchilds = deptnode.childNodes;
			alert(deptchilds.length);
			//myjsonObj.emplist 에서 하나씩 객체를 꺼내서 i에 전달하고
			//myjsonObj.emplist 안+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++에 저장된 object의 갯수만큼 for문이 실행
			for(i in myjsonObj.emplist){
				
			} */
			//해당 ul노드에 json 객체에서 추출한 name 을 추가하기 - innerHTML
			var deptnode = document.getElementById(deptno);
			//alert(myjsonObj.emplist.length)
			//myjsonObj.emplist에 저장된 JSONObject를 하나씩 꺼내서 i 에 할당
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
	
	
	//emp정보를 ajax로 요청
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

	<h1 id="banner">ERP 조직도</h1>
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
					<legend>선택한 사원의 기본 정보입니다.</legend>
				</div>
				<div class="form-group">
					<p class="col-sm-4">
						<img src=""
							id="userImage" style="width: 100px">
					</p>
					<div class="col-sm-7" style="color: blue;">직원 정보가 보여지는 곳으로
						수정을 원하시면 부서별인사조회를 선택하고 작업하세요.</div>

				</div>
				<div class="form-group">
					<!-- 부서코드 -->
					<label class="control-label col-sm-4" for="orgcode">부서코드</label>
					<div class="control-label col-sm-3" id="deptno">
						<!-- 여기에 부서코드를 출력하세요  -->
					</div>
				</div>
				
				 	<div class="form-group">
						<!-- 부서코드 -->
						<label class="control-label col-sm-4" for="orgcode">부서명</label>
						<div class="control-label col-sm-3">
							<!-- 여기에 부서코드를 출력하세요  -->
						</div>
					</div> 

				<div class="form-group">
					<!-- 성명-->
					<label class="control-label col-sm-4" for="name">성명</label>
					<div class="control-label col-sm-3" id="name">
					</div>
				</div>
				<div class="form-group">
					<!-- 사번-->
					<label class="control-label col-sm-4" for="id">사번</label>
					<div class="control-label col-sm-3" id="id">
						<!-- 여기에 사번을 출력하세요  -->
					</div>
					<span id="checkVal"></span>
				</div>


				<div class="form-group">
					<!-- 직위-->
					<label class="control-label col-sm-4" for="birthday">직위</label>
					<div class="control-label col-sm-3" id="position">
						<!-- 여기에 직위 출력하세요  -->
					</div>
				</div>
				<div class="form-group">
					<!-- 직책-->
					<label class="control-label col-sm-4" for="birthday">직책</label>
					<div class="control-label col-sm-3" id="duty">
						<!-- 여기에 직책 출력하세요  -->
					</div>
				</div>



			</fieldset>
		</form>
	</div>
	
	
</body>
</html>