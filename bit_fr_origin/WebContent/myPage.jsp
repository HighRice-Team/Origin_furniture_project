<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/jquery-ui.min.css">
<style type="text/css">
.over {
		
		background-color:#606060;  
		text-align:center; transition:all 0.8s, color 0.3s 0.3s;  
		color:#504f4f; cursor: pointer;  
	}

.over:hover{
		box-shadow:
			400px 0 0 0  rgba(0,0,0,0.25) inset, 
			-400px 0 0 0  rgba(0,0,0,0.25) inset;
	}
.over a{
	color : white;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function () {
		$(document).on("mouseover",".hover1",function(){
			$(this).addClass("over");
		})
		$(document).on("mouseout",".hover1",function(){
			$(this).removeClass("over");
		})
		
		$("#changePwd").dialog({
			width:400,
			maxWidth:400,
			minWidth:400,
			autoOpen:false,
			modal:true,
			buttons:{
				"수정":function(){
					var oldPwd = $("#oldPwd").val();
					var pwd = $("#newPwd").val();
					var pwd2 = $("#chk_newPwd").val();
					var data ={"pwd":pwd,"pwd2":pwd2,"oldPwd":oldPwd};
						$.ajax({
							url:"./login/pwdChk2.jsp",
							data:data,
							success:function(data){
								data = eval("("+data+")");
								data = data.str;
								if(data=="일치"){
									data = {"pwd":pwd}
									$.ajax({
										url:"./login/updatePwdAjax.jsp",
										data:data,
									})
									alert("비밀번호 변경 완료");
									location.href="";
									$("#changePwd").dialog("close")
								}else{
									alert(data)
								}
							}
						})
					
				},
				"취소":function(){
					$("#changePwd").dialog("close")
				}
			}
		});
		
		$("#change_pwd").click(function(){
			$("#changePwd").dialog("open")
		})
		
		$("#dialog").dialog({
			width:800,
			maxWidth:800,
			minWidth:800,
			autoOpen:false,
			modal:true,
			buttons:{
				"수정":function(){
					var str="";
					var data = $("#myForm").serializeArray();
					$.ajax({url:"./login/updateMemberOkAjax.jsp",data:data,success:function(str){
						str = eval("("+str+")");
						alert(str.str)
						if(str.str=="회원정보 변경 완료")
						{
							location.href="";
							$("#dialog").dialog("close");
						}						
					}})
					
				},
				"취소":function(){
					$("#dialog").dialog("close");
				}
			}
		});
		$("input[value=로그아웃]").click(function(){
			 if(confirm("로그아웃 하시겠습니까?")){
		         $.ajax({
		            url:"login/logoutAjax.jsp",
		            success:function(){
		               alert("로그아웃 완료");
		               location.href="index.do";
		            }
		            
		         })
		      }
		})
		$("input[value=회원정보수정]").click(function(){
			$.getJSON("./login/updateMemberAjax.jsp",function(data){
				$("#member_id").html(data.member_id);
				$("#name").html(data.name);
				$("#jumin").html(data.jumin);
				$("#account_no").val(data.account_no);
				$("#address3").val(data.address3);
				$("#tel").val(data.tel);
				$("#pwd_a").val(data.pwd_a);
				$("#pwd_q").val(data.pwd_q);
				$("#bank").val(data.bank);
				$("#address1").val(data.address1);
				$("#address2").val(data.address2);
			})
			$("#dialog").dialog("open");
		})
		$("input[value=삭제]").click(function(){
// 			location.href="productDelete.do?product_id="+$(this).parent().find("#product_id").val();
			if(confirm("상품을 삭제하시겠습니까?")){
				var product_id=$(this).parent().find("#product_id").val();
				data = {"product_id":product_id};
				$.ajax({
					url:"product/deleteProductAjax.jsp",
					data:data,
					success:function(){
						alert("삭제완료")
					}
				})
				location.href="";
				
			}
		})
		
		
		
	})
</script>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
		<h2>MY PAGE</h2><hr>
		<div style="border: 1px solid; height: 100px;">
			<div style="width: 100px; float: left; margin-left:  0px ">
				<img src="img/myPage.JPG"  style="position:absolute; height: 100px; width:100px; background: grey;">
			</div>
			<div style="width: 80%; float: right;">
				<p>${member.name }회원님 저희 비트가구 대여 사이트를 이용해 주셔서 감사합니다.
		 	</div>
		</div>
		<div style="height: 40px; text-align: right;">
			<input type="button" value="회원정보수정" >
			<input type="button" value="비밀번호변경" id="change_pwd">
			<input type="button" value="로그아웃" >
		</div>
		<div>
			<table border="0" width="100%">
				<tr><td><h2>SELL</h2></td><td><h2>MY RENT</h2></td></tr>
				<tr><td rowspan="4" width="30%" style="border: 1px solid;"><a href="sellWrite.do"><img src="img/SELL.JPG" style="width:100%; background: grey;"></a></td><td style="border: 1px solid;"><a href="orderlistByCondition.do"><b>입금완료 : ${rent1 }</b></a></td></tr>		
				<tr><td style="border: 1px solid;"><a href="orderlistByCondition.do"><b>배송중 : ${rent2 }</b></a></td></tr>		
				<tr><td style="border: 1px solid;"><a href="orderlistByCondition.do"><b>대여중 : ${rent3 }</b></a></td></tr>		
				<tr><td style="border: 1px solid;"><a href="orderlistByCondition.do"><b>반납 : ${rent4 }</b></a></td></tr>		
			</table>	
		</div>
		<div style="height: 100px;"></div>
		<div style="height: 30px;"><h2>SELL LIST</h2></div>
		<table width="100%" cellspacing="20">
			<tr>
				<c:if test="${min>=2 }">
					<td width="2%"><a href="myPage.do?min=${min-1 }"><img src="img/left.jpg" style="width:60%;"></a></td>
				</c:if>
				<c:forEach items="${list }" var="list">
					<td class="hover1" width="15%" style="border:1px solid; height: 250px;"><a href="productDetail.do?product_id=${list.product_id }"><center>${list.main_img}<br>${list.product_name }<br>${list.condition }<br>${list.quality }<br>${list.price } <input type="hidden" value="${list.product_id }" id="product_id"></a><c:if test="${list.condition=='등록' }"><br><br><br><input type="button" value="삭제"></c:if></center></td>
				</c:forEach>
				<c:if test="${len%4!=0}">
					<c:forEach var="i" begin="1" end="${4-(len%4) }">
						<td width="15%"></td>
					</c:forEach>
				</c:if>
				
				<c:if test="${min+3<total }">
					<td width="2%"><a href="myPage.do?min=${min+1 }"><img src="img/right.jpg" style="width:60%;"></a></td>	
				</c:if>
			</tr>		
		</table>
	</div>
	
	<div id="changePwd">
		<table>
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" id="oldPwd"></td>
			</tr>
			<tr>
				<td>변경할 비밀번호</td>
				<td><input type="password" id="newPwd"></td>
			</tr>
			<tr>
				<td>변경할 비밀번호 확인</td>
				<td><input type="password" id="chk_newPwd"></td>
			</tr>
		</table>
	</div>
	
	<div id="dialog">
		<center><h1>회원정보 수정</h1></center><br><br>
		<form id="myForm">
			<table border="1" cellpadding="5" cellspacing="0" width="100%">
			<tr>
				<td id="title" width="15%">아이디</td>
				<td colspan="3" id="member_id" name="member_id"></td>
			</tr>

			<tr>
				<td id="title">비밀번호</td>
				<td width="20%"><input type="password" name="j_pwd"
					maxlength="50" required="required"></td>
				<td id="title">비밀번호 확인</td>
				<td><input type="password" id="pwdcheck" maxlength="50"required="required" name="pwd_chk"></td>
			</tr>

			<tr>
				<td id="title">이름</td>
				<td colspan="4" id="name" name="name"></td>
			</tr>

			<tr>
				<td id="title">주민번호</td>
				<td colspan="4" id="jumin" name="jumin"></td>
			</tr>

			<tr>
				<td id="title">계좌번호</td>
				<td colspan="4"><input type="hidden" id="account_id" value="${v.getAccount_id() }">

				<input type="hidden" value="${account_v.getBank()}" id="getBank">
				<select id="bank" name="bank">
						<option value="kb">한국은행</option>
						<option value="sh">신한은행</option>
						<option value="nh">농협</option>
						<option value="bs">부산은행</option>
						<option value="wr">우리은행</option>
				</select> <input type="text" id="account_no" name="account_no" size="40" value="" required="required"></td>
			</tr>

			<tr>
				<td id="title">주소</td>
				<input type="hidden" value="${address_v.getAddress1()}" id="getAddress1">
				<input type="hidden" value="${address_v.getAddress2()}" id="getAddress2" >
				<td colspan="4"><input type="hidden" name="n2" value="${n2 }">
					<select id="address1"  name="address1">
						<option value="서울시">서울시</option>
						<option value="경기도">경기도</option>
						<option value="충남">충남</option>
						<option value="세종시">세종시</option>
					</select> 
					<select id="address2" name="address2">
						<option value="마포구">마포구</option>
						<option value="고양시">고양시</option>
						<option value="천안시">천안시</option>
						<option value="다정동">다정동</option>
						<option value="중랑구">중랑구</option>
				</select> <input type="text" id="address3" name="address3" size="50" value="" required="required"></td>
			</tr>
			<tr>
				<td id="title">핸드폰번호</td>
				<td colspan="4"><input type="text" id="tel" name="tel" size="50" value="" required="required">
				</td>
			</tr>
			<tr>
				<td id="title">비밀번호 힌트</td>
				<input type="hidden" value="${v.getPwd_q()}" id="getPwd_q" >
				<td colspan="4"><select id="pwd_q" name="pwd_q">
						<option value="a">a</option>
						<option value="b">b</option>
						<option value="c">c</option>
						<option value="d">d</option>
						<option value="e">e</option>
						<option value="f">f</option>
						<option value="g">g</option>
						<option value="h">h</option>
						<option value="i">i</option>
				</select></td>
			</tr>
			<tr>
				<td id="title">힌트 답</td>
				<td colspan="4"><input type="text" name="pwd_a" id="pwd_a" maxlength="50" value="" required="required">
				</td>
			</tr>
			
		</table>
		</form>
		</div>
</body>
</html>