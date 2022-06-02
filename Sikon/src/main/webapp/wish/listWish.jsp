<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body{
	 padding-top : 50px;
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}
div.row{
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}
 div{
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}  

</style>
	<script type="text/javascript">
		 $(function() {
			 
		
			 
			 
			 <!-- 장바구니 삭제 -->
			 
			 $( "button.delete" ).on("click" , function() {
				 var wishNo = $(this).val();
				 
				 
					console.log('delete');
					console.log(wishNo);
					self.location = "/wish/deleteWish?wishNo="+wishNo;
			  });
	
		
			 
			 $( "button:contains('구매')" ).on("click" , function() {
				 console.log('구매');
				 
				 $("form").attr("method" , "GET").attr("action" , "/apply/addApply").submit();
				 
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
	
		<div class="page-header text-info">
	       <h3>장바구니</h3>
	    </div>
		
		
      
        <div class="row">
        	<div class="col-md-6 text-center">상품사진</div>            
            <div class="col-md-2 text-center">상품이름</div>
            <div class="col-md-2 text-center">상품수량</div>
            <div class="col-md-2 text-center">가 격</div>
           
        </div>
       

		
		  <c:set var="i" value="0" />
		  <c:forEach var="wish" items="${wish}">
		  <div class="row">
			<c:set var="i" value="${ i+1 }" />
			  
			  <div class="col-md-1 text-center">
			  	
			  	<input type="hidden" name="cookNo" value="${ wish.cookNo}"/>
			  	<input type="hidden" name="userId" value="${ wish.cookStatus}"/>
			  	<input type="hidden" name="cookStatus" value="${ wish.cookStatus}"/>			  	
			  </div>
			  
			  <div class="col-md-6 text-left">
			  <c:choose>
				    <c:when test="${wish.cookFilename.contains('/')}">
					    <c:choose>
						<c:when test="${wish.cookFilename.contains('mp4')}">
							<img src="/images/uploadFiles/${name}" class="image" width="100" height="100">
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${wish.cookFilename.split('/')[0]}">
								<img src="/images/uploadFiles/${name}" class="image" width="100" height="100">
							</c:forEach>
						</c:otherwise>
						</c:choose>
				    </c:when>
				    <c:otherwise>
						<img src="/images/uploadFiles/${wish.cookFilename}" class="img-responsive img-rounded" class="image" width="100" height="100">
					</c:otherwise>
				</c:choose>
				
			  </div>	 
			    <div align="center" class="col-md-2 text-center buy" value="${wish.cookName }">
			
			  	${wish.cookName }
			  
			  </div>  	  
			    	  
			    	  
			  <div align="center" class="col-md-2 text-center buy" value="${wish.cookStatus }">
			
			  	${wish.cookStatus }
			  
			  </div>
			  
			  
			  
			  <div align="center" class="col-md-2 text-center price" value="${wish.cookPrice }" >
			  ${wish.cookPrice} 원
			  </div>
			  
			  
			  
			
			  
			  
			  	<button type="button" class="btn btn-primary btn-sm delete" value="${wish.wishNo}">삭제</button>
           </div>
           <hr/>
          </c:forEach>
        
	    
     
      
	  <hr/>
	  
	  <div align="right">
	 	 
	  	<button class="btn btn-primary btn-sm">구매하기</button>
	  </div>
	  
 	</div>
 	

	
</body>
</html>