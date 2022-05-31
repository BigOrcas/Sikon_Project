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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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


table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>

<script type="text/javascript">
	$(function() {
		//여기서 또 상품/레시피/클래스 조건 걸어줘야됨

		$("button:contains('취소')").on("click", function() {
			self.location = "/recipe/listRecipe"
		});

		$("button:contains('레시피등록')").on("click", function() {
			fncAddRecipe();
		});
		
		$("button:contains('재료추가')").on("click", function() {
			tableCreate();
		});
		$("button:contains('재료빼기')").on("click", function() {
			tableDelete();
		});

	});

	$("button:contains('레시피등록')").css("color", "red")

	function fncAddRecipe() {

		$("form").attr("method", "POST").attr("enctype", "multipart/form-data").attr("action", "/recipe/addRecipe").submit();

	}
</script>
<script>
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{

											height : 300, // 에디터 높이
											minHeight : null, // 최소 높이
											maxHeight : null, // 최대 높이
											focus : true, // 에디터 로딩후 포커스를 맞출지 여부
											placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
											callbacks : { //여기 부분이 이미지를 첨부하는 부분
												onImageUpload : function(files) {
													uploadSummernoteImageFile(
															files[0], this);

												},
												onPaste : function(e) {
													var clipboardData = e.originalEvent.clipboardData;
													if (clipboardData
															&& clipboardData.items
															&& clipboardData.items.length) {
														var item = clipboardData.items[0];
														if (item.kind === 'file'
																&& item.type
																		.indexOf('image/') !== -1) {
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
			url : "/recipe/json/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(JSONData, status) {
				//항상 업로드된 파일의 url이 있어야 한다.
				console.log('성공');
				console.log(JSONData.url);
				$(editor).summernote('insertImage', JSONData.url);
			}

		});
	}
</script>

<script>
function tableCreate(){
	var tc = new Array();
	var html = '';
				
	var ingredientName = $("#ingredientName").val();
	var ingredientAmount = $("#ingredientAmount").val();
				
	html += '<tr>';
	html += '<td name="ingredientName">'+ingredientName+'</td>';
	html += '<td name="ingredientAmount">'+ingredientAmount+'</td>';
	html += '</tr>';
				
	$("#dynamicTable").append(html);
				
	$("#ingredientName").val('');
	$("#ingredientAmount").val('');
	$("table.type09 tr td[name='ingredientName']").css("color","red");

	}
	

function tableDelete(){
	$('#dynamicTable tbody tr:last').remove();
	}
	
</script>
<script type="text/javascript">
$('#append_row').on("click", function () {
	
	$('#list_table').append(
		$('<tr>').append(
			$('<td name="ingredientName">').append($('#ingredientName').val()),
			$('<td>').append($('#ingredientAmount').val()),
			$('<td>').append(
				// property와 attribute의 차이!!
				$('<a>').prop('href', '#').addClass('delete-link').append('Delete')
				// <a href="#" class="delete-link">Delete</a>
			)
		)
	);
});

function a() {
	var ingredientName=$('#ingredientName').val();
	console.log(ingredientName);
	var ingredientAmount=$('#ingredientAmount').val();
	
	
}

$('#list_table').on("click", ".delete-link", function () {
  /*
  <tr>
    <td>3</td>
    <td>seok</td>
    <td>901217</td>
    <td>
      <a href="#" class="delete-link">Delete</a>
    </td>
  </tr>
  */
  // this == a의 부모의 부모는 tr태그
  $(this).parent().parent().remove();
})
</script>


</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">

			<h3 class=" text-info" style="color: #75574B;">레시피 등록</h3>
		</div>



		<div class="form-group">
			<form>
				<div class="form-group">
					<label for="recipeName"
						class="col-lg-offset-1 col-lg-2 control-label ">제목</label>
					<div class="col-lg-9">
						<input type="text" class="form-control" id="recipeName"
							name="recipeName" placeholder="제목">
					</div>
				</div>

				<div class="form-group">
					<label for="recipeDetail"
						class="col-lg-offset-1 col-lg-2 control-label">간략정보</label>
					<div class="col-lg-9">
						<input type="text" class="form-control" id="recipeDetail"
							name="recipeDetail" placeholder="50자 이내로 입력하세요.">
					</div>
				</div>


				<div class="form-group">
					<label for="fileName"
						class="col-lg-offset-1 col-lg-2 control-label">대표이미지</label>
					<div class="col-lg-9">
						<input type="file" class="form-control" id="fileName"
							name="fileName" placeholder="레시피이미지">

					</div>
				</div>


				<div class="form-group">
					<label for="difficulty"
						class="col-lg-offset-1 col-lg-2 control-label">난이도</label>
					<div class="col-lg-9">
						<select name="difficulty" class="form-control">
							<option value="1" selected="selected">초급</option>
							<option value="2">중급</option>
							<option value="3">고급</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="cookingTime"
						class="col-lg-offset-1 col-lg-2 control-label">소요시간</label>
					<div class="col-lg-9">
						<input type="number" class="form-control" id="cookingTime"
							name="cookingTime" placeholder="소요시간">
					</div>
				</div>
	
	
	
				<div class="form-group">
					<label for="ingredient"
						class="col-lg-offset-1 col-lg-2 control-label">재료</label>

			<div class="col-lg-9">
				<table border="1" id="list_table">

	<thead>
		<tr>
			<th>재료명</th>
			<th>재료양</th>
		</tr>
	</thead>
	</table>
	
	<h3>추가 입력 테이블</h3>

<table border="1" id="append_table">

<thead>
   <tr>
      <th><label for="ingredientName">재료명</label></th>
      <th><label for="ingredientAmount">재료양</label></th>
   </tr>
</thead>

<tbody>
   <tr>
      <td><input type="text" id="ingredientName" value=""></td>
      <td><input type="text" id="ingredientAmount"></td>
      <td><button type="button" id="append_row">추가</button></td>
   </tr>
</tbody>

</table>
</div>
</div>





				<div class="form-group">
					<label for="theme" class="col-lg-offset-1 col-lg-2 control-label">카테고리</label>
					<div class="col-lg-9">
						<select name="theme" class="form-control">
							<option value="1" selected="selected">카테고리</option>
							<option value="2">한식</option>
							<option value="3">중식</option>
							<option value="4">양식</option>
							<option value="5">일식</option>
							<option value="6">간식</option>
						</select>
					</div>
				</div>
				<br />
				<div class="form-group">
					<div class="col-lg-offset-1 col-lg-11">
						<br />

						<textarea id="summernote" class="form-control" name="recipeOrder">
      
     </textarea>
						<script>
							$('#summernote').summernote({
								placeholder : '레시피를 입력하세요',
								tabsize : 2,
								height : 300
							});
						</script>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-1  col-lg-11 text-right">
						<br />
						<button type="button" class="btn btn-default"
							style="float: right;">레시피등록</button>
						<button type="button" class="btn btn-default"
							style="float: right;">취소</button>
					</div>
				</div>


			</form>
			
		</div>

	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>