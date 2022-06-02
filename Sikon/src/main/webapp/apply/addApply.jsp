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


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
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
		alert("��� �����մϴ�");
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
		alert("��ٱ��� ��Ⱑ�� ������ �ʰ��Ǿ����ϴ�");
		return;
	}
	
	
	$("form").attr("method" , "POST").attr("action" , "/wish/addWish").submit();
	
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncAddApply();
	});
});	
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-warning" ).on("click" , function() {
		console.log('��ٱ���');
		fncAddWish();
	});
});

$(function() {
	$('#divyDate').datepicker({
		dateFormat: "yy-mm-dd"

	});
	
});	
	 
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-defualt text-center">��ŷŬ������û</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="cookNo" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  name="cookNo" placeholder="��ŷŬ������ȣ" value="${cook.cookNo}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookName" name="cookName" placeholder="��ǰ��" value="${cook.cookName}" readonly>
		    </div>
		  </div>
		  
		 
		  
		  
		  <div class="form-group">
		    <label for="cookDifficuty" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookDifficuty" name="cookDifficuty" placeholder="��ŷŬ�������̵�" value="${cook.cookDifficuty}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookRegdate" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������ϳ�¥</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookRegdate" name="cookRegdate" placeholder="��ŷŬ������ϳ�¥" value="${cook.cookRegdate}" readonly>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookPrice" name="cookPrice" placeholder="��ŷŬ��������" value="${cook.cookPrice}" readonly>
		    </div>
		  </div>
		  
		  	  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">��û�ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="��û�ھ��̵�" value="${user.userId}" readonly>
		    </div>
		  </div>
		  
		  	  
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <select 	name="paymentOption"		class="form-control" >
				<option value="1" selected="selected">īī�����̱���</option>
				<option value="2">���̹����̱���</option>
			</select>
		    </div>
		  </div>
		  
		  	<input type="hidden" id="userName"  value="${user.userName }" />  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="�������̸�" value="${user.userName}"> 
		    </div>
		  </div>
		   <input type="hidden" id="phone"  value="${user.phone }" />
		    <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">��û�ڿ���ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="��û�ڿ���ó"  value="${user.phone}">
		    </div>
		  </div>
		   <input type="hidden" id="cookStock"  value="${cook.cookStock }" />
		      <div class="form-group">
		    <label for="cookStatus" class="col-sm-offset-1 col-sm-3 control-label">��û�ڼ�</label>
		    <div class="col-sm-4">
		      <input type="number" min="0"  class="form-control" id="cookStatus" name="cookStatus" placeholder="���� ��� : ${cook.cookStock}">
		    </div>
		  </div>
	  	  
		  <div class="form-group">
		    <label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookLocation" name="cookLocation" placeholder="��ŷŬ�������" value="${cook.cookLocation}"> 
		    </div>
		  </div>		  
		  
		     
  
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script>
  
	
	$(function() {
		$("button.kakao").on("click" , function() {
			console.log("����");		
			payment();	
		});
	});	
	
function payment(data) {
	
	
	IMP.init('imp21089180'); 
    
    IMP.request_pay({
    	pg : "html5_inicis", 
        pay_method : 'card',
        merchant_uid : '8913',
        name : '����',
        amount : 100,
        buyer_email : 'sweetcorn09@naver.com',
        buyer_name : '����ȣ',
        buyer_tel : '010-4242-4242',
        buyer_addr : '����Ư���� ������ �Ż絿',
        buyer_postcode : '������ �ּ�',
        m_redirect_url : '01181'
    }, function(rsp) {
        if ( rsp.success ) {
            alert("����! imp_uid: "+rsp.imp_uid+" / merchant_uid(orderkey): "+rsp.merchant_uid);
            self.location = "/cook/listCook?menu=search";
        } else {
        	alert("����.. �ڵ�: "+rsp.error_code+" / �޽���: "+rsp.error_msg);
            
        }
    });
	
}
    
    
    </script>
		
		  
		
		  
		  
		
		
		<div class="text-left">
			<button type="button" class="kakao" id="kakao">�����ϱ�</button>	
		</div>
		
		
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button"  class="btn btn-primary"  >��&nbsp;��</button>
		      <button type="button"  class="btn btn-warning"  >��ٱ���</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
			  <form method="post" action="/kakao/kakaoPay">
		    <button>īī������</button>
		</form>
		 </div>
		  </div>
		  

			<div class="text-left">
			<button type="button" class="kakao" id="kakao">�����ϱ�</button>	
		</div>
 
	
</body>

</html>