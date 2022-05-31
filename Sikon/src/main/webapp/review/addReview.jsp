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

$(function() {
	//여기서 또 상품/레시피/클래스 조건 걸어줘야됨
	
	 
	 $( "button:contains('취소')" ).on("click" , function() {
			self.location = "/product/listProduct?menu=manage"
		});
	
	 $( "button:contains('리뷰등록')" ).on("click" , function() {
			fncAddReview();
		});
	 
});

$( "button:contains('리뷰등록')" ).css("color","red")

function fncAddReview() {
	
	$("form").attr("method" , "POST").attr("action" , "/review/addReview").submit();

	
}


</script>
		<script>
			$(document).ready(function() {
				$('#summernote').summernote({
					
					height: 300,                 // 에디터 높이
					minHeight: null,             // 최소 높이
					maxHeight: null,             // 최대 높이
					focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
					placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
					callbacks: {	//여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0],this);

						},
						onPaste: function (e) {
							var clipboardData = e.originalEvent.clipboardData;
							if (clipboardData && clipboardData.items && clipboardData.items.length) {
								var item = clipboardData.items[0];
								if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
									e.preventDefault();
								}
							}
						}
					}
		});
		});
			    function uploadSummernoteImageFile(file, editor) {
			        data = new FormData();
			        data.append("file", file);
			        $.ajax({
			            data : data,
			            type : "POST",
						url : "/review/json/uploadSummernoteImageFile",
			            contentType : false,
			            processData : false,
			            success : function(JSONData,status) {
			                //항상 업로드된 파일의 url이 있어야 한다.
			                console.log('성공');
			                console.log(JSONData.url);
			                $(editor).summernote('insertImage', JSONData.url);
			            }
			      
			        });
			    }
			</script>
	
			

			   
			    
		
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">

			<h3 class=" text-info" style="color: #75574B;">Review</h3>
		</div>
		


		<div class="form-group">
		<form method="post" action="/review/addReview">
		<input type="hidden" name="tranNo" value="${param.tranNo }"/>
		
			<textarea id="summernote" class="form-control" name="content">
     </textarea>
	
			
			
			
		
		<button type="button"  class="btn btn-default" style="float: right;">리뷰등록</button>
		      <button type="button"  class="btn btn-default" style="float: right;" >취소</button>
			</form>
</div>


	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>