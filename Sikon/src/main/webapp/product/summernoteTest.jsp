<%@ page language="java" contentType="text/html; charset=EUC_KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html lang='ko'>

<head>

    	<title>Summer Note</title>
    <meta charset="EUC_KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

  
</head>

<script type="text/javascript">
//============= "가입"  Event 연결 =============
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( ".btn:contains('등')" ).on("click" , function() {
		$("form").attr("method" , "POST").attr("action" , "/store/addProduct").submit();
	});
});	

</script>
<style>
@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
body{
font-family: ChosunGu;
}
</style>
 <body>
 
 
 
 <div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; width:100%;">
 
       <!-- Page Content  -->
       <div id="content" class="p-4 p-md-5">
	      <div class="container-fluid">
	         <!-- 상단 툴바  -->
	        
				<!-- 게시판 흰색 박스 부분-->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; 
					 padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
				  <!-- 게시판 title -->
				  <div class="row" id="titlef">
					  <h3>&nbsp;&nbsp;&nbsp;&nbsp;상품등록</h3>
	 			  </div><br>
  
	
	<form class="form-horizontal">
		
	 	<div id="addbrdview" class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-1 control-label"></label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="boardTitle" name="title" placeholder="제목을 입력해주세요.">
		    </div>
		</div>
		
	 	<div class="form-group">
		    <label for="boardContent" height=100px class="col-sm-offset-1 col-sm-1 control-label"></label>
		    <div class="col-sm-12" height=100px>
		      <textarea id="summernote" class="form-control col-sm-5" rows="5" name="content"
						placeholder="내용" style="resize: none"></textarea>
		    </div>
		</div>
		
		<input type="hidden" id="user" value="${user.userId }"/>
		
		</form>
		
		
				
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      &nbsp;&nbsp;<button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  &nbsp;<a class="btn btn-primary" href="#" onClick="history.back()" role="button">취&nbsp;소</a>
		 	</div>
		</div><br>
		
  <div id="summernote"></div>
  </div>
  	
  </div>
  </div>
  <script>
  
    $(document).ready(function() {
    	
    	var user = $('#user').val();
    	console.log(user);
    	
    	
    	 $('#summernote').summernote({
    	        placeholder: '내용을 입력해주세요.',
    	        tabsize: 2,
    	        height: 500,
    	        lang : 'ko-KR',
    	        maximumImageFileSize : 20 * 1024 * 1024,
    	  	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
    	  	  focus : true,
    	  	  ///*
    	  	  toolbar: [
    	  		    // 글꼴 설정
    	  		    ['fontname', ['fontname']],
    	  		    // 글자 크기 설정
    	  		    ['fontsize', ['fontsize']],
    	  		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    	  		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    	  		    // 글자색
    	  		    ['color', ['forecolor','color']],
    	  		    // 표만들기
    	  		    ['table', ['table']],
    	  		    // 글머리 기호, 번호매기기, 문단정렬
    	  		    ['para', ['ul', 'ol', 'paragraph']],
    	  		    // 줄간격
    	  		    ['height', ['height']],
    	  		    // 그림첨부, 링크만들기, 동영상첨부
    	  		    ['insert',['picture','link','video']],
    	  		    // 코드보기, 확대해서보기, 도움말
    	  		    ['view', ['codeview','fullscreen', 'help']]
    	  		  ],
    	  		  // 추가한 글꼴
    	  		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
    	  		 // 추가한 폰트사이즈
    	  		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
    	  		//*/
    	  		callbacks: {	//이미지 첨부하는 부분
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
		//data.append("userId", user);
		$.ajax({
			data : data,
			type : "POST",
			url : "/store/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
				console.log('썸머노트');
				console.log(data.url);
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
      
    	 </script>
    
</body>
</html>