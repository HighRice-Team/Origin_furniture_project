<%@page import="com.bit_fr.vo.QnaVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="qna/style.css">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<style type="text/css">
 #content_area{
 	text-align: left;
 }

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#updatebtn").click(function(){
			location.href = $("#update").val()
		})
		
		$("#delbtn").click(function(){
			location.href = $("#del").val()
		})
		
		$("#rebtn").click(function(){
			location.href = $("#reply").val()
		})
		
	})
</script>
</head>
<body>	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
	<h2>상세페이지</h2>
	
	<table bgcolor="#E6E5ED" cellpading="1" cellspacing="1" class = "ui-widget ui-corner-all">
	<tr id = "detail_title" class = "ui-widget-header">
		<td class = "left" style = "width:15%; text-align: center;">제목 </td> 
		<td class = "left" colspan="2">${q.title}</td>
		
	</tr>
	<tr id = "detail_value" class= "ui-widget-content">
		<td class="left" style="text-align: center;">글쓴이 </td>
		<td class="left" style="text-align: center;">${q.member_id}</td>
		<td style="text-align: right;">${q.regdate}</td>
	</tr>
	</table>
	<br>
	<hr>
	
	<div id="content_area" class = "ui-widget-header ui-corner-all">&nbsp;${q.content}</div>
	<br>
	<hr>
	</div>
	<div style="text-align: center;">
<%-- 		<span class="ui-corner-all ui-widget-header"><a href = "updateQna.do?board_id=${q.board_id}&detailMember=${q.member_id}">수정</a></span> --%>
<%-- 		<span><a href = "deleteQna.do?board_id=${q.board_id}&detailMember=${q.member_id}">삭제</a></span> --%>
<%-- 		<span><a href = "insertReply.do?b_ref=${q.b_ref}">답글달기</a></span> --%>
		<input type = "hidden" id = "update" value="updateQna.do?board_id=${q.board_id}&detailMember=${q.member_id}">
		<input type = "hidden" id = "del" value="deleteQna.do?board_id=${q.board_id}&detailMember=${q.member_id}">
		<input type="hidden" id = "reply" value = "insertReply.do?b_ref=${q.b_ref}">
		
		<button id = "updatebtn">수정</button>
		<button id = "delbtn">삭제</button>
		<button id = "rebtn">답글달기</button>
		
	</div>
	
</body>
</html>