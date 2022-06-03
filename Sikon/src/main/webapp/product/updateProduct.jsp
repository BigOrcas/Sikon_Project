<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<meta charset="EUC-KR">

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
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body{
	font-family: 'Nanum Myeongjo', serif;
}
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 150px;
	font-family: 'Nanum Myeongjo', serif;
}
h1.text-center {
	font-family: 'Nanum Myeongjo', serif;
}
#prodDetail {
	font-family: 'Nanum Myeongjo', serif;
}
div.form-group{
	font-family: 'Nanum Myeongjo', serif;
}
</style>
</style>

<script type="text/javascript">
	function fncUpdateProduct() {

		$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/product/updateProduct").submit();
	}

	
	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			alert($("button.btn.btn-primary").text());
			fncUpdateProduct();
		})
	})

	$(function() {
		$("button.btn-default").on("click", function() {
			// resetData();
			var prodNo = $("#prodNo").val();
			self.location = "/product/getProduct?prodNo="+prodNo
		})
	})

	
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">

		<h1 class="bg-default text-center" style="color:#bc8f8f">상품정보수정</h1>

		<form class="form-horizontal" enctype="multipart/form-data">
		
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-right">
		      <button type="button" class="btn btn-primary"  >수정</button>
			  <button type="button" class="btn btn-default" href="#" >취소</button>
		    </div>
		  </div>
		  
		<hr/>
			<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo }">
			
			<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }">
		    </div>
		  </div>

			<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품간략정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail }">
		    </div>
		  </div>

			<div class="form-group">
			    <label for="prodStock" class="col-sm-offset-1 col-sm-3 control-label">상품재고량</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="prodStock" name="prodStock" value="${product.prodStock }">
			    </div>
			  </div>

			<div class="form-group">
			    <label for="prodPrice" class="col-sm-offset-1 col-sm-3 control-label">정상가</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="prodPrice" name="prodPrice" value="${product.prodPrice }">
			    </div>
			  </div>

			<div class="form-group">
		    <label for="prodDisRate" class="col-sm-offset-1 col-sm-3 control-label">할인율</label>
		    <div class="col-sm-4">
		      <input type="number" step="0.1" class="form-control" id="prodDisRate" name="prodDisRate" value="${product.prodDisRate }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDisPrice" class="col-sm-offset-1 col-sm-3 control-label">할인가</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDisPrice" name="prodDisPrice" value="${product.prodDisPrice }">
		    </div>
		  </div>
		  

			<div class="form-group">
		    <label for="prodThumbnail" class="col-sm-offset-1 col-sm-3 control-label">상품썸네일</label>
		    <div class="col-sm-4">
		    	<c:choose>
		    	<c:when test="${product.prodThumbnail.contains('&')}">
						<c:choose>
						<c:when test="${product.prodThumbnail.contains('mp4')}">
							<c:forEach var="name" items="${product.prodThumbnail.split('&')}">
								<video width="400" height="300" controls autoplay src="/resources/images/uploadFiles/${name}" type="video/mp4"  value="${name}"></video>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${product.prodThumbnail.split('&')}">
								<img src="/resources/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
								<input type="hidden" name="image" value="${name }"/>
							</c:forEach>
						</c:otherwise>
						</c:choose>
				</c:when>
				<c:otherwise>
					<img src="/resources/images/uploadFiles/${product.prodThumbnail}" width="300" height="300" align="absmiddle" class="image" value="${prodThumbnail}"/>
				</c:otherwise>
		    	</c:choose>
		    	
		      <input type="file" id="prodThumbnail" name="uploadfiles[]" multiple="multiple" >
		    </div>
		  </div>
		  
		  <hr/>
		  
		  <div class="form-group">
		    <label for="prodTheme" class="col-sm-offset-1 col-sm-3 control-label">상품테마</label>
		    <div class="col-sm-4">
		      <select class="form-control" name="prodTheme" id="prodTheme">
				  <option value="TW" selected="selected">식기류</option>
				  <option value="CW">조리도구</option>
				  <option value="MK">밀키트</option>
			  </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodStatus" class="col-sm-offset-1 col-sm-3 control-label">판매여부</label>
		    <div class="col-sm-4">
		       <div class="btn-group" data-toggle="buttons">
				    <input type="radio" name="prodStatus" id="option1" value="Y" checked> 판매중
				    <input type="radio" name="prodStatus" id="option2" value="N"> 판매중지
				</div>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="couponApply" class="col-sm-offset-1 col-sm-3 control-label">쿠폰적용여부</label>
		    <div class="col-sm-4">
		       <div class="btn-group" data-toggle="buttons">
				    <input type="radio" name="couponApply" id="option1" value="Y" checked> 적용가능
				    <input type="radio" name="couponApply" id="option2" value="N"> 적용불가
				</div>
		    </div>
		  </div>
		  
		  <hr/>
		  
		  <div class="form-group">
		    <label for="prodContent" class="col-sm-offset-1 col-sm-3 control-label">상품상세내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodContent" name="prodContent" placeholder="썸머노트 예정">
		    </div>
		  </div>
		  
			

		</form>


	</div>


</body>
</html>
