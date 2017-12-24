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
		$("#tabs").tabs();
		var customDialog = {
				onclickSubmit:function(params){
					var selectedRow = $('#product_grid').getGridParam('selrow');
					rowData = $('#product_grid').getRowData(selectedRow);
					location.href="";
					return {product_id : rowData.product_id};
				}
		}
		
		$("#product_grid").jqGrid({
			url:"admin/getProductList.jsp",
			editurl:'admin/editProduct.jsp',
			pager:'#product_pager',
			loadonce:true,
			autowidth:true,
			height:'100%',
			rowNum: 10,
			rowList:[10,20,30],
			colNames:["제품 코드","제품분류","제품명","등록자","배송상태", "주소", "물품상태", "가격"],
			colModel:[
				{name:"product_id", index:"product_id"},
				{name:"item", index:"item", editable:true },
				{name:"product_name", index:"product_name", editable:true },
				{name:"m_member_id", index:"m_member_id"},
				{name:"condition", index:"condition", editable:true },
				{name:"a_address2", index:"a_address2"},
				{name:"quality", index:"quality", editable:true },
				{name:"price", index:"price", editable:true }
			],
			ondblClickRow:function(){
				var selectedRow = $('#product_grid').getGridParam('selrow');
				rowData = $('#product_grid').getRowData(selectedRow);
				location.href = "productListDetail.do?product_id="+rowData.product_id;
			}
		}).navGrid('#product_pager',{
			search:true,
			edit:true,
			add:false,
			del:true
		},customDialog,{},customDialog,customDialog,{} );
		
		var customDialog = {
				onclickSubmit:function(params){
					var selectedRow = $('#order_grid').getGridParam('selrow');
					rowData = $('#order_grid').getRowData(selectedRow);
					location.href="";
					return {order_id : rowData.order_id};
				}
		}
		
		$("#order_grid").jqGrid({
			url:"admin/getOrderList.jsp",
			editurl:'admin/editOrder.jsp',
			pager:'#order_pager',
			loadonce:true,
			autowidth:true,
			height:'100%',
			rowNum: 10,
			rowList:[10,50,100],
			colNames:["주문 코드","주문고객","제품","상태","판매고객", "주소", "대여시작", "대여종료", "대여기간", "가격"],
			colModel:[
				{name:"order_id", index:"order_id"},
				{name:"o_member_id", index:"o_member_id"},
				{name:"p_item", index:"p_item"},
				{name:"condition", index:"condition", editable:true },
				{name:"p_member_id", index:"p_member_id" },
				{name:"address2", index:"address2"},
				{name:"rent_start", index:"rent_start", editable:true},
				{name:"rent_end", index:"rent_end"},
				{name:"rent_month", index:"rent_month",editable:true },
				{name:"price", index:"price" }
			]
		}).navGrid('#order_pager',{
			search:true,
			edit:true,
			add:false,
			del:false
		},customDialog,{},customDialog,customDialog,{} );
			var customDialog = {
					onclickSubmit:function(params){
						var selectedRow = $('#grid').getGridParam('selrow');
						rowData = $('#grid').getRowData(selectedRow);
						return {ID : "'"+rowData.ID+"'"};
					}
			}
			
			$("#member_grid").jqGrid({
				url:"admin/getMemberList.jsp",
				editurl:'admin/editMember.jsp',
				pager:'#member_pager',
				loadonce:true,
				autowidth:true,
				height:'100%',
				rowNum: 10,
				rowList:[10,20,30],
				colNames:["ID","이름","주소","전화번호","판 물건", "산 물건"],
				colModel:[
					{name:"ID", index:"ID"},
					{name:"name", index:"name", editable:true },
					{name:"address", index:"address", editable:true },
					{name:"tel", index:"tel", editable:true },
					{name:"sellProduct", index:"sellProduct" },
					{name:"rentProduct", index:"rentProduct"}
				],
				ondblClickRow:function(){
					var selectedRow = $('#member_grid').getGridParam('selrow');
					rowData = $('#member_grid').getRowData(selectedRow);
					location.href = "memberListDetail.do?member_id="+rowData.ID;
				}
			}).navGrid('#member_pager',{
				search:true,
				edit:true,
				add:false,
				del:false
			},customDialog,{},{},customDialog,{} );
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="tabs">
		<ul>
			<li><a href="#a">물품관리</a></li>
			<li><a href="#b">주문관리</a></li>
			<li><a href="#c">회원관리</a></li>
		</ul>
		<div id="a">
			<h2>물품관리</h2>
			<hr>
			<div>
				<table id="product_grid"></table>
				<div id="product_pager"></div>
			</div>
		</div>

		<div id="b">
			<h2>주문관리</h2>
			<hr>
			<div>
				<table id="order_grid"></table>
				<div id="order_pager"></div>
			</div>
		</div>

		<div id="c">
			<h2>회원관리</h2>
			<hr>
			<div>
				<table id="member_grid"></table>
				<div id="member_pager"></div>
			</div>
		</div>
	</div>
</body>
</html>