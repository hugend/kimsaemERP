<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<!DOCTYPE>
<html>
<head>
<title>인사관리시스템</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
	<form class="form-horizontal">

		<input type="hidden" name="bo_id" id="id" value="jang">
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">번호</label>
			</div>
			<div class="col-md-8">1</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="bo_div" class="control-label">게시글종류</label>
			</div>
			<div class="col-md-3">
				<select name="category" class="form-control">
					<option value="경조사">경조사</option>
					<option value="사내소식">사내소식</option>
					<option value="게시판" selected="selected">게시판</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">작성자</label>
			</div>
			<div class="col-md-8">jang</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">제목</label>
			</div>
			<div class="col-md-8">에어컨 고쳐주세요</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">작성날짜</label>
			</div>
			<div class="col-md-8">2018-08-08</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="text" class="control-label">내용</label>
			</div>
			<div class="col-md-8"
				style="width: 500px; height: 400px; border: solid 1px;">에어컨이
				고장났나봐요..너무 더워요</div>
		</div>

		<div class="form-group">
			<div class="col-md-10 text-center">
				<input type="submit" class="btn btn-lg btn-primary" value="수정">

				<button type="button" class="btn btn-danger btn-lg"
					onclick="javascript:cancelCheck()">
					<i class="fa fa-fw fa-close"></i> 목록
				</button>
			</div>
		</div>
	</form>

</body>
</html>