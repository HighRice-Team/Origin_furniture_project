<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/ui.jqgrid.css">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<style>
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript" src = "./js/i18n/grid.locale-en.js"></script>
<script type="text/javascript" src = "./js/jquery.jqGrid.min.js"></script>
<script type="text/javascript">
	$(function() {

		function custom_link(cellvalue, options, rowdata, action) {
			var html = '<img src="img/product/'+cellvalue+'" width="50">'
			return html;
		}

//상태가 '등록' 외에는 수정, 삭제를 비활성화 (미완 상태)
		var customDialog = {
			onclickSubmit : function(params) {
				var selectedRow = $("#tb").getGridParam("selrow")
				rowData = $("#tb").getRowData(selectedRow)
				var condition = rowData.condition.toString()
				if (condition != '등록') {
					return;
				}
				return {
					product_id : rowData.product_id
				}
			}
		}

		$("#tb").jqGrid({
			url : "sell/getSellList.jsp?member_id="+$("member_id").val(),
			editurl : "sell/editSell.jsp",
//editurl에 선택된 행의 product_id값을 보내야 하는지 여부 확인 필요
			pager : "#pager",
			caption : "등록 물품 목록",
			height : "100%",
			rowNum : 10,
			loadonce : true,
			autowidth:true,
			colNames : [ '번호', '물품명', '품목', '품질', '현황', '메인 이미지', '서브 이미지' ],
			colModel : [ {
				name : 'product_id',
				index : 'product_id',
				width : 50
			}, {
				name : 'product_name',
				index : 'product_name',
				width : 200,
				editable : true,
				edittype : 'text'
			}, {
				name : 'item',
				index : 'item',
				width : 100,
				editable : true,
				edittype : 'select',
				editoptions : {
					value : "1:SOFA; 2:BED; 3:DESK; 4:CLOSET;"
				}
			}, {
				name : 'quality',
				index : 'quality',
				width : 100,
				editable : true,
				edittype : 'select',
				editoptions : {
					value : "1:A; 2:B; 3:C;"
				}
			}, {
				name : 'condition',
				index : 'condition',
				width : 100
			}, {
				name : 'main_img',
				index : 'main_img',
				formatter : custom_link,
				editable : true,
				edittype : 'file'
			}, {
				name : 'sub_img',
				index : 'sub_img',
				formatter : custom_link,
				editable : true,
				edittype : 'file'
			} ]
		}).navGrid("#pager", {
			search : true,
			edit : true,
			add : true,
			del : true
		}, {}, customDialog, customDialog)
	})
</script>
</head>
<body>
	<h2>SELL LIST</h2>
	<hr>
	<table id="tb" border="1" width="80%" cellpadding="0" cellspacing="0">
	</table>
	<input type="hidden" id = "member_id" value="${list.member_id}">
	<div id="pager"></div>
	
</body>
</html>