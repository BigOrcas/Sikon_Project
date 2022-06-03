<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	

<link rel="stylesheet" href="/css/admin.css" type="text/css">

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

 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>


body>div.container {
	border: 3px solid #630606;
	margin-top: 150px;
	font-family: 'Nanum Myeongjo', serif;
}

#aaa{
	background: #630606 
}
#bbb{
	background: #BB6464
}
#ccc{
	background: #F7F7F7
}
#ddd{
	background: #D0C9C0
}
#eee{
	background: #5F7161
}
#fff{
	background: #6D8B74
}





</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#iamportPayment" ).on("click" , function() {
				alert('����');
				fncAddPurchase();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				history.go(-1);
			});
		});	
	
		//============= �ּҰ� ǥ�� =============
		 $(function() {	
			var addr = $("input:hidden[name='divyAddr']").val();
			console.log(addr);
			///*
			if(addr.indexOf('/',0) != -1){
				var list = addr.split('/');
				
				$("#sample6_postcode").val(list[0]);
				$("#sample6_address").val(list[1]);
				$("#sample6_detailAddress").val(list[2]);
				$("#sample6_extraAddress").val(list[3]);
				
			}else{
				$("#sample6_address").val(addr);
			}
			//*/
		 });	

		//====================================================
		function fncAddPurchase() {
			
			
			var addr = $("#sample6_postcode").val() + "/" +  $("#sample6_address").val() + "/" +  $("#sample6_detailAddress").val() + "/" + $("#sample6_extraAddress").val();
			console.log('submit');
			console.log(addr);
			$("input:hidden[name='divyAddr']").val( addr );
			
			$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();

			
		}
		


		
	
		 
	</script>		
<!-- �ּҷ� --> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script> 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
  

/*	
	$(function() {
		$("button.iamportPayment").on("click" , function() {
			console.log("������Ʈ");		
			payment();	
		});
	});	
	
function payment(data) {
	

	
	IMP.init('imp05238113'); 
    
    IMP.request_pay({
    	pg : "html5_inicis", 
        pay_method : 'card',
        merchant_uid : '1012',
        name : '�׽�Ʈ',
        amount : 100,
        buyer_email : 'pjn39@naver.com',
        buyer_name : 'pjw',
        buyer_tel : '010-4242-4242',
        buyer_addr : '����Ư���� ������ �Ż絿',
        buyer_postcode : '������ �ּ�',
        m_redirect_url : '01181'
    }, function(rsp) {
        if ( rsp.success ) {
            alert("����! imp_uid: "+rsp.imp_uid+" / merchant_uid(orderkey): "+rsp.merchant_uid);
            self.location = "/product/listProduct?menu=search";
        } else {
        	alert("����.. �ڵ�: "+rsp.error_code+" / �޽���: "+rsp.error_msg);
            
        }
    });
	
}
    //*/
    


    </script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
        <jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-defualt text-center" style="color:#bc8f8f">�����ϱ�</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <input type="hidden" name="prodNo" value="${product.prodNo }" />
		  <input type="hidden" name="userId" value="${user.userId }" />
		  
		  
		  <hr/>
		  <h4 align="center">�ֹ���ǰ</h4>
		  <hr/>
		  
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      ${product.prodName}
		    </div>
		  </div>
		  
		
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      ${product.prodDisPrice} ��
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">��ۺ�</label>
		    <div class="col-sm-4">
		      3000 ��
		      <input type="hidden" class="form-control" id="divyFee" name="divyFee" value="3000">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="purchaseQuantity" class="col-sm-offset-1 col-sm-3 control-label">���ż���</label>
		    <div class="col-sm-4">
		    ${quantity} ��
		      <input type="hidden" min="0" class="form-control" id="purchaseQuantity" name="purchaseQuantity" value="${quantity}">
		    </div>
		  </div>
		  
		  <c:if test="${product.couponApply == 'N' }">
			  <div class="form-group">
			    *��������Ұ�
			  </div>
		  </c:if>
		  
		  <hr>
		  
		   <div class="form-group">
		  <label for="purchaseQuantity" class="col-sm-offset-1 col-sm-3 control-label">���� ����Ʈ</label>
		    <div class="col-sm-4">
		      + ${product.prodDisPrice * 0.05 } P
		    </div>
		  </div>
		 
		  
		  
		  <hr/>
		  <h4 align="center">�������</h4>
		  <hr/>
		  
		  	  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�޴º� �̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}"> 
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�����</label>
		    <div class="col-sm-4">
		        <input type="text" id="sample6_postcode" name="postcode" placeholder="�����ȣ" value="">
				<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
				<input type="text" id="sample6_address" name="address" placeholder="�ּ�" value=""><br>
				<input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="���ּ�" value=""><br>
				<input type="text" id="sample6_extraAddress" name="extraAddress" placeholder="�����׸�" value="">
		    </div>
		    <input type="hidden" name="divyAddr" value="${user.addr}">
		  </div>
		  
		    <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
		    </div>
		  </div>
		  
		  <c:if test="${param.menu }">
		  <div class="form-group">
		    <label for="receiverEmail" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverEmail" name="receiverEmail" placeholder="��ȸ�� ����" >
		    </div>
		  </div>
		  </c:if>
		  
		  
		   <div class="form-group">
		    <label for="divyMessage" class="col-sm-offset-1 col-sm-3 control-label">��۸޽���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyMessage" name="divyMessage" placeholder="��û������ �����ּ���."  >
		    </div>
		  </div>

		  
		  <hr/>
		  <h4 align="center">���� / ����Ʈ</h4>
		  <hr/>
		  
		 
		 <div class="form-group">
		    <label for="usedCoupon" class="col-sm-offset-1 col-sm-3 control-label">���� ���</label>
		    <div class="col-sm-4">
		   	  <c:if test="${product.couponApply == 'Y' }">
		      	<input type="text" class="form-control" id="usedCoupon" name="usedCoupon" placeholder="����� ������ �������ּ���" >
		      </c:if>
		      <c:if test="${product.couponApply == 'N' }">
		      	<input type="text" class="form-control" id="usedCoupon" name="usedCoupon" placeholder="���������� �Ұ��� ��ǰ�Դϴ�." readonly >
		      </c:if>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="usedPoint" class="col-sm-offset-1 col-sm-3 control-label">����Ʈ ���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="usedPoint" name="usedPoint" value="0">
		      <button type="button" class="point" id="point">��� ���</button>
		      <h5>���� ����Ʈ ${user.holdpoint } P</h5>	
		    </div>
		  </div>
		  
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		<div class="text-center">
			<button type="button" class="btn btn-default btn-block iamportPayment" id="iamportPayment">�����ϱ�</button>	
			<a class="btn btn-default btn-block" href="#" role="button">�� ��</a>
		</div>
		
		<br/>
 	</div>
	
	
</body>

</html>