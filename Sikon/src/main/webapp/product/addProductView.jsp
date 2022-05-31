<%@ page contentType="text/html; charset=euc-kr"%>

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


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">

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

<script type="text/javascript">



	function fncAddProduct() {
		//Form ��ȿ�� ����
		

		$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/product/addProduct").submit();
		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();
	}


	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			
			console.log($('input[name=prodDisRate]').val());
			alert($("button.btn.btn-primary").text());
			fncAddProduct();
		})
	})

	$(function() {
		$("a[href='#' ]").on("click", function() {
			// resetData();
			$("form")[0].reset();
		})
	})

	//function resetData(){
	//	document.detailForm.reset();
	//}
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />


	<div class="container">

		<h1 class="text-center"  style="color:#bc8f8f">��ǰ���</h1>

		<form class="form-horizontal" enctype="multipart/form-data">
		

			<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��">
		    </div>
		  </div>

			<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ�������� �Է�">
		    </div>
		  </div>

			<div class="form-group">
			    <label for="prodStock" class="col-sm-offset-1 col-sm-3 control-label">��ǰ���</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="prodStock" name="prodStock" placeholder="�����Է�">
			    </div>
			  </div>

			<div class="form-group">
		    <label for="prodPrice" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodPrice" name="prodPrice" placeholder="����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDisRate" class="col-sm-offset-1 col-sm-3 control-label">������</label>
		    <div class="col-sm-4">
		      <input type="number" step="0.1" class="form-control" id="prodDisRate" name="prodDisRate" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDisPrice" class="col-sm-offset-1 col-sm-3 control-label">���ΰ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDisPrice" name="prodDisPrice" placeholder="���ΰ�">
		    </div>
		  </div>

			<div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�����</label>
		    <div class="col-sm-4">
		      <input type="file" id="fileName" name="uploadfiles[]" multiple="multiple" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodContent" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�󼼳���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodContent" name="prodContent" placeholder="��ӳ�Ʈ ����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodTheme" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�׸�</label>
		    <div class="col-sm-4">
		      <select class="form-control" name="prodTheme" id="prodTheme">
				  <option value="TW" selected="selected">�ı��</option>
				  <option value="CW">��������</option>
				  <option value="MK">��ŰƮ</option>
			  </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodStatus" class="col-sm-offset-1 col-sm-3 control-label">�Ǹſ���</label>
		    <div class="col-sm-4">
		       <div class="btn-group" data-toggle="buttons">
				    <input type="radio" name="prodStatus" id="option1" value="Y" checked> �Ǹ���
				    <input type="radio" name="prodStatus" id="option2" value="N"> �Ǹ�����
				</div>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="couponApply" class="col-sm-offset-1 col-sm-3 control-label">�������뿩��</label>
		    <div class="col-sm-4">
		       <div class="btn-group" data-toggle="buttons">
				    <input type="radio" name="couponApply" id="option1" value="Y" checked> ���밡��
				    <input type="radio" name="couponApply" id="option2" value="N"> ����Ұ�
				</div>
		    </div>
		  </div>

			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >���</button>
			  <button type="button" class="btn btn-default" href="#" >�ʱ�ȭ</button>
		    </div>
		  </div>

		</form>


	</div>


</body>
</html>
