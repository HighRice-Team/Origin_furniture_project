<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/ui.jqgrid.css">
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript" src = "./js/i18n/grid.locale-en.js"></script>
<script type="text/javascript" src = "./js/jquery.jqGrid.min.js"></script>
<script type="text/javascript">   
   $(function(){
      $("#tabs").tabs();
      $("#agrid").jqGrid({
  		url:"orderlist/getOrderlistByConditionAjax.jsp",
  		pager:'#apager',
  		loadonce:true,
  		autowidth:true,
  		height:'100%',

  		rowNum: 10,
  		rowList:[10,20,30],
  		colNames:["주문 번호","주문자","상품번호","구매일","렌트시작일", "종료일", "렌트기간"],
  		colModel:[
  			{name:"order_id", index:"order_id"},
  			{name:"member_id", index:"member_id", editable:true },
  			{name:"product_id", index:"product_id", editable:true },
  			{name:"pay_date", index:"pay_date" },
  			{name:"rent_start", index:"rent_start",editable:true },
  			{name:"rent_end", index:"rent_end"},
  			{name:"rent_month", index:"rent_month",editable:true }
  		],
  		ondblClickRow:function(){
  			var selectedRow = $('#agrid').getGridParam('selrow');
  			rowData = $('#agrid').getRowData(selectedRow);
  			location.href = "productListDetail.do?product_id="+rowData.product_id;
  		}
  	}).navGrid('#apager',{
  		search:true,
  		edit:false,
  		add:false,
  		del:true
  	} );
      
      $("#bgrid").jqGrid({
    		url:"orderlist/getOrderlistByConditionAjax.jsp?condition=입금완료",
    		pager:'#bpager',
    		loadonce:true,
    		autowidth:true,
    		height:'100%',
    		rowNum: 10,
    		rowList:[10,20,30],
    		colNames:["주문 번호","주문자","상품번호","구매일","렌트시작일", "종료일", "렌트기간"],
    		colModel:[
    			{name:"order_id", index:"order_id", width:30 },
    			{name:"member_id", index:"member_id", width:30, editable:true },
    			{name:"product_id", index:"product_id", width:100, editable:true },
    			{name:"pay_date", index:"pay_date", width:100 },
    			{name:"rent_start", index:"rent_start", width:100, editable:true },
    			{name:"rent_end", index:"rent_end", width:100 },
    			{name:"rent_month", index:"rent_month", width:100, editable:true }
    		],
    		ondblClickRow:function(){
    			var selectedRow = $('#bgrid').getGridParam('selrow');
    			rowData = $('#bgrid').getRowData(selectedRow);
    			location.href = "productListDetail.do?product_id="+rowData.product_id;
    		}
    	}).navGrid('#bpager',{
    		search:true,
    		edit:false,
    		add:false,
    		del:true
    	} );
      
      $("#cgrid").jqGrid({
  		url:"orderlist/getOrderlistByConditionAjax.jsp?condition=배송중",
  		pager:'#cpager',
  		loadonce:true,
  		autowidth:true,
  		height:'100%',
  		rowNum: 10,
  		rowList:[10,20,30],
  		colNames:["주문 번호","주문자","상품번호","구매일","렌트시작일", "종료일", "렌트기간"],
  		colModel:[
  			{name:"order_id", index:"order_id"},
  			{name:"member_id", index:"member_id", editable:true },
  			{name:"product_id", index:"product_id", editable:true },
  			{name:"pay_date", index:"pay_date" },
  			{name:"rent_start", index:"rent_start",  editable:true },
  			{name:"rent_end", index:"rent_end", },
  			{name:"rent_month", index:"rent_month", editable:true }
  		],
  		ondblClickRow:function(){
  			var selectedRow = $('#cgrid').getGridParam('selrow');
  			rowData = $('#cgrid').getRowData(selectedRow);
  			location.href = "productListDetail.do?product_id="+rowData.product_id;
  		}
  	}).navGrid('#cpager',{
  		search:true,
  		edit:false,
  		add:false,
  		del:true
  	} );
      
      $("#dgrid").jqGrid({
  		url:"orderlist/getOrderlistByConditionAjax.jsp?condition=대여중",
  		pager:'#dpager',
  		loadonce:true,
  		autowidth:true,
  		height:'100%',
  		rowNum: 10,
  		rowList:[10,20,30],
  		colNames:["주문 번호","주문자","상품번호","구매일","렌트시작일", "종료일", "렌트기간"],
  		colModel:[
  			{name:"order_id", index:"order_id", width:30 },
  			{name:"member_id", index:"member_id", width:30, editable:true },
  			{name:"product_id", index:"product_id", width:100, editable:true },
  			{name:"pay_date", index:"pay_date", width:100 },
  			{name:"rent_start", index:"rent_start", width:100, editable:true },
  			{name:"rent_end", index:"rent_end", width:100 },
  			{name:"rent_month", index:"rent_month", width:100, editable:true }
  		],
  		ondblClickRow:function(){
  			var selectedRow = $('#dgrid').getGridParam('selrow');
  			rowData = $('#dgrid').getRowData(selectedRow);
  			location.href = "productListDetail.do?product_id="+rowData.product_id;
  		}
  	}).navGrid('#dpager',{
  		search:true,
  		edit:false,
  		add:false,
  		del:true
  	} );
    
      $("#egrid").jqGrid({
  		url:"orderlist/getOrderlistByConditionAjax.jsp?condition=반납",
  		pager:'#epager',
  		loadonce:true,
  		autowidth:true,
  		height:'100%',
  		rowNum: 10,
  		rowList:[10,20,30],
  		colNames:["주문 번호","주문자","상품번호","구매일","렌트시작일", "종료일", "렌트기간"],
  		colModel:[
  			{name:"order_id", index:"order_id", width:30 },
  			{name:"member_id", index:"member_id", width:30, editable:true },
  			{name:"product_id", index:"product_id", width:100, editable:true },
  			{name:"pay_date", index:"pay_date", width:100 },
  			{name:"rent_start", index:"rent_start", width:100, editable:true },
  			{name:"rent_end", index:"rent_end", width:100 },
  			{name:"rent_month", index:"rent_month", width:100, editable:true }
  		],
  		ondblClickRow:function(){
  			var selectedRow = $('#egrid').getGridParam('selrow');
  			rowData = $('#egrid').getRowData(selectedRow);
  			location.href = "productListDetail.do?product_id="+rowData.product_id;
  		}
  	}).navGrid('#epager',{
  		search:true,
  		edit:false,
  		add:false,
  		del:true
  	} );
      
   })
</script>
<title>Insert title here</title>
</head>
<body>
   <div id="tabs">
      <ul>
         <li><a href="#a">전체</a></li>
         <li><a href="#b">입금완료</a></li>
         <li><a href="#c">배송중</a></li>
         <li><a href="#d">대여중</a></li>
         <li><a href="#e">반납</a></li>
      </ul>
      <div id="a" style="width: 100%">
         <h2>전체</h2>
         <hr>
         <div style="width:100%;">
         <table id = "agrid"></table>
         <div id = "apager"></div>
         </div>
      </div>
      
      <div id="b" style="width: 100%">
         <h2>입금완료</h2><hr>
         <div style="width:100%;">
           <table id = "bgrid"></table>
         <div id = "bpager"></div>
         </div>
      </div>

      <div id="c" style="width: 100%">
         <h2>배송중</h2><hr>
         <div style="width:100%;">
            <table id = "cgrid"></table>
         <div id = "cpager"></div>
         </div>   
      </div>
      
      <div id="d" style="width: 100%">
         <h2>대여중</h2><hr>
         <div style="width:100%;">
            <table id = "dgrid"></table>
         <div id = "dpager"></div>
         </div>   
      </div>
      
      <div id="e" style="width: 100%">
         <h2>반납</h2><hr>
         <div style="width:100%;">
            <table id = "egrid"></table>
         <div id = "epager"></div>
         </div>   
      </div>
   
   </div>
</body>
</html>