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
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage)
		
		$("form").attr("method" , "POST").attr("action" , "/apply/listSale").submit();
		
	}
	
	$(function() {	
		
	
		
		
		$( "td.divy" ).on("click" , function() {
			console.log('물건도착');
			var message1 = $(this).attr("value1");
			console.log(message1);
			var message2 = $(this).attr("value2");
			console.log(message2);
			
			self.location ="/apply/updateApplyStatus?menu=search&applyNo="+message1+"&applyStatus="+message2;
		});
		
	$( "td.userid" ).on("click" , function() {
		
		
		var userId = $(this).attr("value");
	
			self.location ="/user/getUser?userId="+userId;
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
	       <h3>판매목록관리</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	   <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
		
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
      
        <thead>
          <tr>
             <th align="center">No</th>
            <th align="center">주문번호</th>
            <th align="center">상품번호</th>
            <th align="center">배송현황</th>
            <th align="center">현재상태</th>
            <th align="center">구매회원</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="apply" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="center">${apply.applyNo}</td>
			  <td align="center" class="prodNum" value1="${apply.classCook.cookNo }" value2="${param.menu}" >
				${apply.classCook.cookNo }
			  
			  	<input type="hidden" value="${apply.classCook.cookNo}">
			 	 </td>
			  <c:choose>
				<c:when test="${apply.applyStatus.equals('000')}">
					<td align="center">현재 신청취소 상태입니다.</td>
				</c:when>
				<c:when test="${apply.applyStatus.equals('100')}">
					<td align="center">현재 신청완료 상태입니다.</td>
				</c:when>
				<c:when test="${apply.applyStatus.equals('200')}">
					<td align="center">현재 수강완료 상태입니다.</td>
				</c:when>
			
			  </c:choose>
			  
			  <c:choose>
					<c:when test="${apply.applyStatus.equals('000') }">
						<td align="center" > 구매취소 </td>
					</c:when>
					<c:when test="${apply.applyStatus.equals('100') }">
						<td align="center" class="divy" value1="${apply.applyNo }" value2="${apply.applyStatus}">수강완료하심</td>			
					</c:when>
					<c:when test="${apply.applyStatus.equals('200') }">
						
						<td align="center"> 수강완료</td>
					</c:when>
				
			
				</c:choose>
			
			  	<td align="center" class="user" value="${apply.applier.userId}">${apply.applier.userId}</td>
				
				
				
				</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 </div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>