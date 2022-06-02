<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

	
<head>
	<meta charset="EUC-KR">
	<meta charset="utf-8"/>
	

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<link rel="stylesheet"
	href="resources/css/plugin/datepicker/bootstrap-datepicker.css">


<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script
	src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet"
	href="resources/css/plugin/datepicker/bootstrap-datepicker.css">



<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 30px;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">



function fncAddApply() {
	
	var cookStock=$("#cookStock").val();
	var cookStatus=$("input[name='cookStatus']").val();
	console.log(cookStock);
	console.log(cookStatus);
	if (cookStock < cookStatus) {
		alert("재고가 부족합니다");
		return;
	}
	
	
	$("form").attr("method" , "POST").attr("action" , "/apply/addApply").submit();	
}
function fncAddWish() {
	
	var cookStock=$("#cookStock").val();
	var cookStatus=$("input[name='cookStatus']").val();
	console.log(cookStock);
	console.log(cookStatus);
	if (cookStock < cookStatus) {
		alert("장바구니 담기가능 개수가 초과되었습니다");
		return;
	}
	
	
	$("form").attr("method" , "POST").attr("action" , "/wish/addWish").submit();
	
}

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddApply();
	});
});	
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-warning" ).on("click" , function() {
		console.log('장바구니');
		fncAddWish();
	});
});

$(function() {
	$('#divyDate').datepicker({
		dateFormat: "yy-mm-dd"

	});
	
});	
	 
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	


</script>



</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-defualt text-center">쿠킹클래스신청</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="cookNo" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="cookNo" placeholder="쿠킹클래스번호" value="${cook.cookNo}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookName" name="cookName" placeholder="상품명" value="${cook.cookName}" readonly>
		    </div>
		  </div>
		  
		 
		  
		  
		  <div class="form-group">
		    <label for="cookDifficuty" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스난이도</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookDifficuty" name="cookDifficuty" placeholder="쿠킹클래스난이도" value="${cook.cookDifficuty}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookRegdate" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스등록날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookRegdate" name="cookRegdate" placeholder="쿠킹클래스등록날짜" value="${cook.cookRegdate}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookPrice" name="cookPrice" placeholder="쿠킹클래스가격" value="${cook.cookPrice}" readonly>
		    </div>
		  </div>
		  
		  	  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">신청자아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="신청자아이디" value="${user.userId}" readonly>
		    </div>
		  </div>
		  
		  	  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">결제방법</label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption"		class="form-control" >
				<option value="1" selected="selected">카카오페이구매</option>
				<option value="2">네이버페이구매</option>
			</select>
		    </div>
		  </div>
		  
		  	<input type="hidden" id="userName"  value="${user.userName }" />  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="구매자이름" value="${user.userName}"> 
		    </div>
		  </div>
		   <input type="hidden" id="phone"  value="${user.phone }" />
		    <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">신청자연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="신청자연락처"  value="${user.phone}">
		    </div>
		  </div>
		   <input type="hidden" id="cookStock"  value="${cook.cookStock }" />
		      <div class="form-group">
		    <label for="cookStatus" class="col-sm-offset-1 col-sm-3 control-label">신청자수</label>
		    <div class="col-sm-4">
		      <input type="number" min="0"  class="form-control" id="cookStatus" name="cookStatus" placeholder="남은 재고량 : ${cook.cookStock}">
		    </div>
		  </div>
	  	  
		  <div class="form-group">
		    <label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스장소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookLocation" name="cookLocation" placeholder="쿠킹클래스장소" value="${cook.cookLocation}"> 
		    </div>
		  </div>		  
		  
		     
  
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script>
  
	
	$(function() {
		$("button.kakao").on("click" , function() {
			console.log("시작");		
			payment();	
		});
	});	
	
function payment(data) {
	
	
	IMP.init('imp21089180'); 
    
    IMP.request_pay({
    	pg : "html5_inicis", 
        pay_method : 'card',
        merchant_uid : '8913',
        name : '낭만',
        amount : 100,
        buyer_email : 'sweetcorn09@naver.com',
        buyer_name : '김태호',
        buyer_tel : '010-4242-4242',
        buyer_addr : '서울특별시 강남구 신사동',
        buyer_postcode : '구매자 주소',
        m_redirect_url : '01181'
    }, function(rsp) {
        if ( rsp.success ) {
            alert("성공! imp_uid: "+rsp.imp_uid+" / merchant_uid(orderkey): "+rsp.merchant_uid);
            self.location = "/cook/listCook?menu=search";
        } else {
        	alert("실패.. 코드: "+rsp.error_code+" / 메시지: "+rsp.error_msg);
            
        }
    });
	
}
    
    
    </script>
		
		  
		
		  
		  
		
		
		<div class="text-left">
			<button type="button" class="kakao" id="kakao">결제하기</button>	
		</div>
		
		
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button"  class="btn btn-primary"  >구&nbsp;매</button>
		      <button type="button"  class="btn btn-warning"  >장바구니</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
			  <form method="post" action="/kakao/kakaoPay">
		    <button>카카오페이</button>
		</form>
		 </div>
		  </div>
		  

			<div class="text-left">
			<button type="button" class="kakao" id="kakao">결제하기</button>	
		</div>
 
	
</body>

</html>