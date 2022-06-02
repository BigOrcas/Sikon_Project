<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
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
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage);
	   
	   console.log(currentPage);

		$("form").attr("method" , "POST").attr("action" , "/apply/listApply").submit();
	}
	
	
	
	
	
	   	$(function() {	   	
	   		
			$( "td.tran" ).on("click" , function() {
				
				
				var applyNo = $(this).attr("value");
			
					self.location ="/apply/getApply?applyNo="+applyNo;
			});
		
		$( "td.userid" ).on("click" , function() {
			
			
			var userId = $(this).attr("value");
		
				self.location ="/user/getUser?userId="+userId;
		}); 
		
		$( "td.divy" ).on("click" , function() {
			console.log('���ǵ���');
			var applyNo = $(this).attr("value1");
			console.log(applyNo);
			var applyStatus = $(this).attr("value2");
			console.log(applyStatus);
			
			self.location ="/apply/updateApplyStatus?menu=search&applyNo="+applyNo+"&applyStatus="+applyStatus;
		});
		$( "td.cancel" ).on("click" , function() {
			console.log('�������');
			var applyNo = $(this).attr("value1");
			console.log(applyNo);
			var applyStatus = $(this).attr("value2");
			console.log(applyStatus);
			
			self.location ="/apply/cancel?applyNo="+applyNo+"&applyStatus="+applyStatus;
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
	
		<div class="page-header text-info">
	       <h3>�����̷�</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			
				  
				
				  
				  
				  
		
				  
			
				  
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->

      <table class="table table-hover table-striped">
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="center" >ȸ��ID</th>            
          
            <th align="center">�����Ȳ</th>
             <th align="center">�������</th>
            
          </tr>
        </thead>
       
		<tbody>

	
	
	
		<c:set var="i" value="0" />
	<c:forEach var="apply" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		

			<tr class="ct_list_pop">
		
			<td align="center"	class="tran"  value="${apply.applyNo}">${ i }</td>
		
			<td align="center"	class="userid"  value="${apply.applier.userId}">
			
			${apply.applier.userId}</td>

		
	
		<c:choose>
		<c:when test="${apply.applyStatus=='000'}">
		<td align="center">���� ���� ��ҵ� ��ǰ�Դϴ�.</td>
		</c:when>
		<c:when test="${apply.applyStatus=='100' }">
		<td align="center">���� ��û�Ϸ� ���� �Դϴ�.</td>
		</c:when>
		<c:when test="${apply.applyStatus=='200' }">
		<td align="center">�����Ϸ��Դϴ�.</td>
		</c:when>
	
		</c:choose>
			
		
		<c:choose>
		<c:when test="${apply.applyStatus=='200'}">
		<td align="right" class="divy" value1="${apply.applyNo }" value2="${apply.applyStatus}">�����Ϸ�</td>	
		</c:when>
		<c:when test="${apply.applyStatus=='100'}">
		<td align="right" class="cancel" value1="${apply.applyNo }" value2="${apply.applyStatus}">��û���</td>	
		</c:when>
		<c:when test="${apply.applyStatus=='000'}">
		<td align="right" class="complete" >������ҵǾ����ϴ�</td>	
		</c:when>
			
			  	</c:choose>
		
	</tr>
	<tr>

		<td id="${apply.applyNo}" colspan="11" bgcolor="#ffffff" height="1">
		<input type="hidden" value="${apply.applyNo}">
		</td>
		
	</tr>
		</c:forEach>
		
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 </div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>