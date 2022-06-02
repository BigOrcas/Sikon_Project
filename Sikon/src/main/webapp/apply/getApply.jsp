<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 30px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function() {	
	

	 
		 $( "td.ct_btn01:contains('Ȯ��')" ).on("click" , function() {

			 self.location = "/cook/listCook?menu=search"
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
	        <h3 class=" text-info" >��û�����ȸ</h3>
	      
	    </div>
	
	

	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ������ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${apply.classCook.cookNo}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��û�ڼ�</strong></div>
			<div class="col-xs-8 col-md-4">${apply.cookStatus}</div>
		</div>

	
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��û�ھ��̵�</strong></div>
			<div class="col-xs-8 col-md-4">${apply.applier.userId}</div>
	</div>
	

	



		
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${user.phone}</div>
		</div>		
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${user.addr}</div>
		</div>		

	

	

		<div class="row">
	  		<div class="col-md-12 text-right ">
	  		
	  		
	<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
			
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						Ȯ��
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
	  		
	  			
	  		
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>