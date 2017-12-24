<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/ui.jqgrid.css">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript" src = "./js/i18n/grid.locale-en.js"></script>
<script type="text/javascript" src = "./js/jquery.jqGrid.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#grid").jqGrid({
		url:'qna/getQna.jsp',
		pager: '#pager',
		height:'100%',
		rowNum:10,
		rowList:[10,20,30],
		loadonce:true,
		autowidth:true,
		colNames:['분류코드','제목','작성자','등록일'],
		colModel : [
			{name : 'board_id', index : 'board_id', width : '5%'},
			{name : 'title', index : 'title', width :'55%'},
			{name : 'member_id', index:'member_id', width : '20%'},
			{name : 'regdate', index:'regdate', width:'20%'}
		],
		ondblClickRow:function(){
			var selectedRow = $('#grid').getGridParam('selrow');
			rowData = $('#grid').getRowData(selectedRow);
			location.href = "detailQna.do?board_id="+rowData.board_id;
		}
	}).navGrid("#pager",{
		search:true,
		edit:false,
		add:false,
		del:false
	})
	$("#insertbtn").click(function(){
		location.href="insertQna.do";
	})
})
</script>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
	<h2>Q/A</h2>
	<hr>
	<div style="width:100%;">
		<table id = "grid"></table>
		<div id = "pager"></div>
	</div>
	<hr>
	<button id = "insertbtn">새 글 작성</button>
		
	</div>
</body>
</html>