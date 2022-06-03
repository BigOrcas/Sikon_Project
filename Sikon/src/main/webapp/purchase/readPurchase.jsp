<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info" style="color:#bc8f8f">����Ȯ��</h3>
	    </div>
	
		 <hr/>
		 <h4 align="center">�ֹ���ǰ</h4>
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
	  		<div class="col-xs-4 col-md-4"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.purchaseProd.prodName}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�����ݾ�</strong></div>
	  		<hr/>
			<div class="col-xs-8 col-md-8">��ǰ����: ${purchase.purchaseProd.prodDisPrice} ��</div>
			<div class="col-xs-8 col-md-8">+ ��ۺ�: ${purchase.divyFee} ��</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>���ż���</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.purchaseQuantity} ��</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>���� ����Ʈ</strong></div>
			<div class="col-xs-8 col-md-8">+ ${purchase.purchaseProd.prodDisPrice * 0.05} P</div>
		</div>
		  

		 <hr/>
		  <h4 align="center">�������</h4>
		  <hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�޴º� �̸�</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverName }</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�����</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyAddr }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>����ó</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverName }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�̸���</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.receiverName }</div>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��۸޽���</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.divyMessage }</div>
		</div>
		
		
		<hr/>
		  <h4 align="center">���� / ����Ʈ</h4>
		  <hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��� ����</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.usedCoupon }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��� ����Ʈ</strong></div>
			<div class="col-xs-8 col-md-8">- ${purchase.usedPoint } P</div>
		</div>
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-right ">
	  			<button type="button" class="btn btn-default" id="check">Ȯ��</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>