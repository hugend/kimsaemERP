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
				<td>�ۼ���</td>
				<td><input type="text" name="bo_id"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="bo_title"></td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<input type="radio" name="bo_div" value="�系�ҽ�">�系�ҽ�
					<input type="radio" name="bo_div" value="ȸ������">ȸ������
					<input type="radio" name="bo_div" value="�Խ���">�Խ���
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="bo_txt"></td>
			</tr>
			
		
		
		</table>
		<input type="submit" value="�ۼ��Ϸ�">
	</div>
	</form>
</body>
</html>