<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!--  ///////////////////////// font ////////////////////////// -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<!-- include css/js -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  /////////////////////////summernote////////////////////////// -->

<script src="/javascript/summernote-lite.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="/javascript/summernote-ko-KR.js"></script>
<!--  -->



<style>
body {
	padding-top: 50px;
	font-family: 'Gowun Batang', serif;
}
</style>


<style>
.page-header {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}

.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}

.row {
	font-family: 'Gowun Batang', serif;
}
</style>

	<script type="text/javascript">
	//============= "����"  Event ���� =============
	 $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-default" ).on("click" , function() {
			fncUpdateRecipe();
		});
		
	});	
	
	
	//============= "���"  Event ó�� ��  ���� =============
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			$("form")[0].reset();
		});
	});	

	

	function fncUpdateRecipe() {

		$("form").attr("method" , "POST").attr("action" , "/recipe/updateRecipe").submit();
	}


	$(function() {
		$('#manuDate').datepicker({
			format : "yyyy-mm-dd"

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

			<h3 class=" text-info" style="color: #75574B;">������ ����</h3>
		</div>
		


		<div class="form-group">
		<form method="post" action="/review/addReview">
		 
		  <div class="form-group">
		    <label for="recipeName" class="col-lg-offset-1 col-lg-2 control-label ">����</label>
		    <div class="col-lg-9">
		      <input type="text" class="form-control" id="recipeName" name="recipeName"  value="${recipe.recipeName }">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="recipeDetail" class="col-lg-offset-1 col-lg-2 control-label">��������</label>
		    <div class="col-lg-9">
		      <input type="text" class="form-control" id="recipeDetail" name="recipeDetail"  value="${recipe.recipeDetail }">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="fileName" class="col-lg-offset-1 col-lg-2 control-label">�������̹���</label>
		     <div class="col-lg-9">
	     	 <input type="file" class="form-control" id="fileName" name="fileName"  value="${recipe.fileName }">

		    </div>
		  </div>
		  
		    	  
		  <div class="form-group">
		    <label for="difficulty" class="col-lg-offset-1 col-lg-2 control-label">���̵�</label>
		    <div class="col-lg-9">
		      <select 	name="difficulty"		class="form-control" >
				<option value="1" selected="selected">�ʱ�</option>
				<option value="2">�߱�</option>
				<option value="3">���</option>
			</select>
		    </div>
		  </div>
		  
		<div class="form-group">
		    <label for="ingredient" class="col-lg-offset-1 col-lg-2 control-label">�ҿ�ð�</label>
		    <div class="col-lg-9">
		      <input type="number" class="form-control" id="cookingTime" name="cookingTime" value="${recipe.cookingTime }">
		    </div>
		  </div>
		
		   <div class="form-group">
		    <label for="ingredient" class="col-lg-offset-1 col-lg-2 control-label">���</label>
		    <div class="col-lg-9">
		      <input type="text" class="form-control" id="ingredient" name="ingredient" value="${recipe.ingredient }">
		    </div>
		  </div>
		  
		   	  
		  <div class="form-group">
		    <label for="theme" class="col-lg-offset-1 col-lg-2 control-label">ī�װ�</label>
		    <div class="col-lg-9">
		      <select 	name="theme"		class="form-control" >
				<option value="1" selected="selected">ī�װ�</option>
				<option value="2">�ѽ�</option>
				<option value="3">�߽�</option>
				<option value="4">���</option>
				<option value="5">�Ͻ�</option>
				<option value="6">����</option>
			</select>
		    </div>
		  </div>
		  <br/>
		  		  <div class="form-group">
		  		    <div class="col-lg-offset-1 col-lg-11">
		  		    <br/>
		  
			<textarea id="summernote" class="form-control" name="cookingOrder" value="${recipe.recipeOrder }">
      
     </textarea>
			<script>
				$('#summernote').summernote({
					placeholder : '�����Ǹ� �Է��ϼ���',
					tabsize : 2,
					height : 300
				});
			</script>
			</div>
		  </div>
		  
		<div class="form-group">
		  		    <div class="col-lg-offset-1  col-lg-11 text-right">
		  		    <br/>
				<button type="button"  class="btn btn-default" style="float: right;">�����ǵ��</button>
		      <button type="button"  class="btn btn-default" style="float: right;" >���</button>
			</div>
		  </div>
		  
		  
		</form>
	</div>

	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>