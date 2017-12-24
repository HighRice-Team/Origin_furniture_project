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
		url:"admin/getDetailProduct.jsp?product_id="+$("#product").val(),
		editurl:'admin/editProduct.jsp',
		pager:'#pager',
		loadonce:true,
		autowidth:true,
		height:'100%',
		rowNum: 10,
		rowList:[10,20,30],
		colNames:["분류","값"],
		colModel:[
			{name:"key", index:"key", width:30 },
			{name:"value", index:"value", width:30, editable:true }
		]
	}).navGrid('#pager',{
		search:true,
		edit:true,
		add:false,
		del:false
	},customDialog,{},{},customDialog,{} );
})
</script>

</head>
<body>
<div>

	<h2>물품관리</h2><hr>
	<div style="width:100%;">
	<table id = "grid"></table>
	<div id = "pager"></div>
	</div>	
	<br>
	<input type="hidden" id = "product" value="${list.product_id}">
		</div>
</body>
</html>