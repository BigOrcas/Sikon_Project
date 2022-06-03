<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body{
	padding-top : 50px;
	font-family: 'Nanum Myeongjo', serif;
	font-family: 'Open Sans', sans-serif;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		 $(function() {	
			 $( "button.btn.btn-default" ).on("click" , function() {
				 self.location = "/product/listProduct?menu=search"
			});
			
			 
		});
		
	</script>
	
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info" style="color:#bc8f8f">결제확인</h3>
	    </div>
	
		 <hr/>
		 <h4 align="center">주문상품</h4>
		 <hr/>
		 
		 <div class="row">
		<div class="col-xs-12 col-md-12" align="center">
		
		<c:choose>
		
		<c:when test="${purchase.purchaseProd.prodThumbnail.contains('&')}">
		
			<td class="ct_write01">
				<c:choose>
				<c:when test="${purchase.purchaseProd.prodThumbnail.contains('mp4')}">
					<c:forEach var="name" items="${purchase.purchaseProd.prodThumbnail.split('&')}">
						<video width="400" height="300" controls autoplay src="/resources/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="name" items="${purchase.purchaseProd.prodThumbnail.split('&')}">
						<img src="/resources/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>		
		
			</td>
		
		</c:when>
		
		<c:otherwise>
			<img src="/resources/images/uploadFiles/${purchase.purchaseProd.prodThumbnail}" width="300" height="300" align="absmiddle"/>
		</c:otherwise>
		</c:choose>

		</div>
		</div>
		  
		 <div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.purchaseProd.prodName}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>결제금액</strong></div>
	  		<hr/>
			<div class="col-xs-8 col-md-8">상품가격: ${purchase.purchaseProd.prodDisPrice} 원</div>
			<div class="col-xs-8 col-md-8">+ 배송비: ${purchase.divyFee} 원</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>구매수량</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.purchaseQuantity} 개</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>적립 포인트</strong></div>
			<div class="col-xs-8 col-md-8">+ ${purchase.purchaseProd.prodDisPrice * 0.05} P</div>
		</div>
		  

		 <hr/>
		  <h4 align="center">배송정보</h4>
		  <hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>받는분 이름</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverName }</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>배송지</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyAddr }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>연락처</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverName }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>이메일</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverName }</div>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>배송메시지</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyMessage }</div>
		</div>
		
		
		<hr/>
		  <h4 align="center">쿠폰 / 포인트</h4>
		  <hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>사용 쿠폰</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.usedCoupon }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>사용 포인트</strong></div>
			<div class="col-xs-8 col-md-8">- ${purchase.usedPoint } P</div>
		</div>
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-right ">
	  			<button type="button" class="btn btn-default" id="check">확인</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
</html>