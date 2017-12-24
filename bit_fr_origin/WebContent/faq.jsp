<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/jquery-ui.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.0.min.js"></script>
<script type="text/javascript" src = "./js/jquery-ui.min.js"></script>
<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true,
			heightStyle : "content",
			active : false
		});
	});
</script>
</head>
<body>
	<div style="margin: 0 15% 0 15%; padding: 40px 0 40px 0;">
		<h2>FAQ</h2>
		<hr>
	</div>
	<div id="accordion" style="margin: 0 15% 0 15%; padding: 40px 0 40px 0; text-align: left;">
		<h3>Q. 회원으로 가입해야만 상품을 구입할 수 있나요?</h3>
		<div>
			<p>
				예, 저희 BIT FR Company는 가구 대여사이트로 대여후 반납이 확인되어야 함으로,<br> 회원제로
				운영되고 있습니다. 그래서 가구 대여를 원하시면 회원으로 가입을 하셔야 합니다.<br>
			</p>
		</div>
		<h3>Q. 해외 배송이 가능한가요?</h3>
		<div>
			<p>
				1. 해외주소는 주문메세지에 적어주시고 주문서를 모두 작성하신 후<br>(신용카드 또는 무통장 입금 모두
				선택가능)<br> 2. 전화나 게시판을 통해 해외배송을 요청하시면<br> 3. 저희가 상자 무게를
				측정해서 EMS 해외배송료를 알려드립니다.<br> 4. 배송료와 함께 입금하시면 해외로 보내드립니다.<br>
				자세한 내용은 1800-8914 2번<br> (해외에서 전화하실 때는 070-7416-9124 2번)으로
				전화주세요. 감사합니다. ^^ <br> *해외배송의 경우, 나라별로 부과될 수 있는 관세, 기타 세금은 고객님
				부담입니다.<br> *특정 제품(예: 이형제 스프레이)은 항공배송이 불가합니다.<br> *간혹 도착지
				세관에서 제품 검사할 때 물품을 빼버리는 경우가 있습니다.<br> *멀리 보내지는 물품이기에 최대한 더 신경써서
				보내드리고 있습니다만 파손,<br> 오배송은 사후 재배송처리가 어렵습니다. 중간에 검수를 하셔야 하는 경우는
				국내의 친지 주소로 제품을 받으신 뒤, 한 번 확인하시고 해외로 보내시는 것이 좋습니다.<br>
			</p>
		</div>
		<h3>Q. 배송 받아야하는데 집에 사람이 없네요. 택배는 몇시에 도착하나요?</h3>
		<div>
			<p>
				고객님께서 계신 지역에 따라 택배가 도착하는 시간은 오전이 될 수도 있고, 늦은 오후가 될 수도 있습니다.<br>
				통상적으로 택배 배달기사님들은 미리 정해진 대략적인 루트를 따라 택배배송을 하게 되는데, 캔들베이커리에서는 도착시간을 미리
				알 수 없습니다. <br> 상품이 출고된 후 다음날 오전에 배송조회를 해보시면 고객님께서 주문하신 상품의 위치를
				아실 수 있습니다. <br> 인터넷으로 주문조회페이지에서 배송조회를 하시면 고객님께 상품을 배달하실 기사님의
				연락처가 나옵니다. <br> 또는 CJ택배에 전화하셔서 운송장번호를 말씀하시고 문의하시면 상품 도착시간을 아실 수
				있을 것입니다. <br> 택배기사님께 전달되어져야 하는 "부재시 경비실에 맡겨주세요" "부재시 OOO에 놔두세요"
				등의 메모는 배송메세지에 남겨주시면 저희가 운송장에 메모를 출력해드리겠습니다.<br>
			</p>
		</div>
		<h3>Q. 배송료는 얼마인가요?</h3>
		<div>
			<p>
				[일반회원] <br> 기본배송료는 2,500원이며 5만원 이상 구매하실 경우 택배 무료로 보내드립니다.<br>
				제주도 및 도서 산간지역등은 별도의 운송요금을 추가로 지불하시게 되며 지역 및 상품무게에 따라 요금이 달라지게 됩니다.<br>
				[도매회원] <br> 도매상품은 택배비를 부담하셔야 합니다.<br> 캔들웍스 쇼핑몰 시스템이 부담하시게
				될 택배비를 자동계산해드리며 상품과 함께 결제하시면 됩니다.<br> [오토바이 퀵/고속버스/항공특송] <br>
				배송료를 착불로 부담하시면 서울/경기권은 오토바이 또는 다마스로, 그 외의 도심지역은 고속버스 및 항공특송이 가능합니다.<br>
				자세한 내용은 전화문의 부탁드립니다.<br>
			</p>
		</div>
		<h3>Q. 가구 렌탈 절차</h3>
		<div>
			<p>
				1.고객님이 가장 선호하는 패키지를 고르세요.<br> 2.전화, E-메일 또는 문의하기를 통해서 문의 하시기
				바랍니다.<br> 3.예상가격 책정서를 이메일로 보내드립니다.<br> 4.계약하기<br>
				고객님께서 계약서에 명시된 날짜에 렌트비용을 지불하시면, 에이스렌트와 고객님,<br> 양측은 계약서에 명시된 모든
				조항을 동의한 것으로 인정됩니다.<br> * 렌트비용은 선불입니다.<br> 5.배송<br>
				고객님께서 편리하신 시간과 장소로 배송해 드립니다.<br> 6.무상 A/S 및 교체가능<br> 제품 하자
				발생시, 무상 수리 및 교체가능 합니다.<br> 그러나 사용자의 부주의로 인한 손해 및 계약시 발견되지 않았던
				손해에 대해서는 사용자가 전적으로 책임져야 합니다.<br> 7.계약 연장<br> 계약연장을 원하실 때는,
				계약만료 4주전에 미리 알려주셔야 합니다.<br> 8.계좌번호<br> 은행 : 외환은행<br>
				예금주 : 김 재 우<br> 계좌번호 : 160-18-15288-0<br>
			</p>
		</div>
		<h3>Q. 대여한 가구가 고장났어요.....</h3>
		<div>
			<p>
				고객님 부주의에 의한 고장일 경우 고객님께 A/S비용이 청구됩니다.<br> 외부충격으로 인한 고장이나 파손이 아닌
				소모에 의한것으로 판단될 시 진렌탈에서 수리비 부담합니다.<br> 고객님 부주의에 의해 대여기간중 장비가
				파손되거나 고장났을 경우<br> 일단 당사에 반납하시고 진렌탈에서 직접 해당업체에 A/S 진행한 후 비용 발생 시
				고객님께 해당 비용 청구 및 지불하시면 되빈다.<br> A/S 처리사항은 고객님께 증빙 자료로 제공해드립니다.<br>
				- 항상 고객을 최고로 생각하는 진렌탈이 되겠습니다. <br>
			</p>
		</div>
	</div>
</body>
</html>