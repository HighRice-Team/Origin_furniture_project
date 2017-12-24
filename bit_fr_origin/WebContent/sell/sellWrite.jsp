<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0; ">
		<h2>SELL WRITE</h2><hr>
		<form action="sellWriteOk.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="product_id" value=${ product_id}>
			제목: <input type="text" name="product_name"><br>
			분류: <select name="item">
					<option value="bed">BED</option>
					<option value="sofa">SOFA</option>
					<option value="desk">DESK</option>
					<option value="closet">CLOSET</option>	
				</select><br>
			품질: <input type="radio" name="quality" value="A">A
				<input type="radio" name="quality" value="B">B
				<input type="radio" name="quality" value="C">C<br>
		
			대표이미지: <input type="file" name="main_img"><br>
			서브이미지: <input type="file" name="sub_img"><br>
	
			<input type="submit" value="등록">&nbsp;
			<input type="reset" value="취소">
		</form>
	</div>
</body>
</html>