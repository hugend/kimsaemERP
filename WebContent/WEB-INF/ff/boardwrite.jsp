<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$("input[name='bo_div']:checked").each(function(){
		
		console.log($(this).val())
	
	});

</script>
<body>
	<form action="/kimsaemERP/board/insert.do" method="post">
		<div>
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="bo_id"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bo_title"></td>
			</tr>
			<tr>
				<td>구분</td>
				<td>
					<input type="radio" name="bo_div" value="사내소식">사내소식
					<input type="radio" name="bo_div" value="회사일정">회사일정
					<input type="radio" name="bo_div" value="게시판">게시판
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="bo_txt"></td>
			</tr>
			
		
		
		</table>
		<input type="submit" value="작성완료">
	</div>
	</form>
</body>
</html>