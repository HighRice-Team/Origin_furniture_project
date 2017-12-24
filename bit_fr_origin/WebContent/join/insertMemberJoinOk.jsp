<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/jquery-ui.min.css">


<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#loginDialog").dialog({
        autoOpen:false,
        modal:true,
        resizable:false,
        buttons:{
           "로그인":function(){
              var id = $("#login_member_id").val()
              var pwd = $("#login_pwd").val()
              var data = {"member_id":id,"pwd":pwd};
              $.ajax({
                 url:"login/loginAjax.jsp",
                 data:data,
                 success:function(data){
                    data = eval("("+data+")");
                    if(data.str==""){
                       location.href="index.do";
                       $("#loginDialog").dialog("close")
                    }else{
                       $("#msg").html("*"+data.str);
                    }
                 }
              })
           },
           "취소":function(){
              $("#loginDialog").dialog("close")
           }
        }
	})
	
	$("#loginBtn").click(function(){
		$("#loginDialog").dialog("open");
	})
	$("#goMain").click(function(){
		location.href = "index.do";
	})
})	
</script>
</head>
<body>
	<div
		style="margin: 0 15% 0 15%; padding: 40px 0 40px 0; text-align: left;">
		<h2>JOIN</h2>
		<hr>
		<c:if test="${re==1 }">
		
			<table align="center" width="400" height="200" border="1">
				<tr>
					<td align="center">가입이 완료되었습니다.<br> 입력하신 정보로 로그인하여 주시기
						바랍니다.
					</td>
				</tr>
			</table>
			<p align="center">
				<button id="loginBtn">로그인</button>
				<button id="goMain">메인으로</button>
			</p>
			
			<div id="loginDialog" title="로그인">
                  <form id="loginForm" >
                     <table>
                        <tr>
                           <td>ID:</td>
                           <td><input type="text" id="login_member_id" name="login_member_id"></td>
                        </tr>
                        <tr>
                           <td>PW:</td>
                           <td><input type="password" id="login_pwd" name="login_pwd"></td>
                        </tr>
                        <tr>
                        	<td colspan="2" style="color: red" id="msg"></td>
                        </tr>                       
                     </table>
                  </form><br>
               </div>
		</c:if>

		<c:if test="${re!=1 }">
		등록실패
	</c:if>
	</div>
</body>
</html>