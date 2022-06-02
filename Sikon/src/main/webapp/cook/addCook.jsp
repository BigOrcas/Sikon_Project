<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>쿠킹클래스등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">


<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">



<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 30px;
        }
    </style>
	<script type="text/javascript">



	function fncAddCook() {
		//Form 유효성 검증
		//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
		
		var cookName = $("input[name='cookName']").val();
		var cookBrief = $("input[name='cookBrief']").val();
		var aplstarTime = $("input[name='aplstarTime']").val();
		var aplendTime = $("input[name='aplendTime']").val();
		var startTime = $("input[name='startTime']").val();
		var endTime = $("input[name='endTime']").val();
		var cookRegdate = $("input[name='cookRegdate']").val();
		
		var cookStock = $("input[name='cookStock']").val();
	
	
		
		

		if (cookName == null || cookName.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (cookBrief == null || cookBrief.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
	
	
		if (cookStock == null || cookStock.length < 1) {
			alert("재고는 반드시 입력하셔야 합니다.");
			return;
		}
		
		
		//if (stock == null || stock.length < 1) {
			
			
		//	$("input[name='stock']").val('0');
		//	return;
		//}
		

		//document.detailForm.action = '/product/addProduct';
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/cook/addCook").submit();	
		
	}
	
	$(function() {
		$('#aplstarTime').datepicker({
			dateFormat: "yy-mm-dd"

		});
		
	});	
	$(function() {
		$('#aplendTime').datepicker({
			dateFormat: "yy-mm-dd"

		});
		
	});	
	$(function() {
		$('#startTime').datepicker({
			dateFormat: "yy-mm-dd"

		});
		
	});	
	$(function() {
		$('#endTime').datepicker({
			dateFormat: "yy-mm-dd"

		});
		
	});	
	$(function() {
		$('#cookRegdate').datepicker({
			dateFormat: "yy-mm-dd"

		});
		
	});	
	
	
	 $(function() {
			
			 $( "button.btn.btn-primary" ).on("click" , function() {
				 alert( $("button.btn.btn-primary").text());
				 fncAddCook();
			});
		});	

	function resetData() {
		
		document.detailForm.reset();
		$(function() {
			 $( "a[href='#' ]" ).on("click" , function() {
				 $("form")[0].reset();
				});
		});	
		
		
	}


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

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">쿠 킹 클 래 스 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookName" name="cookName" placeholder="쿠킹클래스명">
		      
		    </div>
		  
		  </div>
		  
		    <div class="form-group">
		    <label for="cookDifficuty" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스난이도</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookDifficuty" name="cookDifficuty" placeholder="쿠킹클래스난이도">
		      
		    </div>
		  
		  </div>
		  
		  <div class="form-group">
		    <label for="cookBrief" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스간략설명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookBrief" name="cookBrief" placeholder="쿠킹클래스간략설명">
		    </div>
		  </div>
		  
		  <div class="form-group">
			    <label for="cookStock" class="col-sm-offset-1 col-sm-3 control-label">모집인원재고</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="cookStock" name="cookStock" placeholder="모집인원재고">
			    </div>
			  </div>
			  
		  <div class="form-group">
			    <label for="cookRecruit" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스모집인원</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="cookRecruit" name="cookRecruit" placeholder="쿠킹클래스모집인원">
			    </div>
			  </div>
		  
		  <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">모집시작기간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="aplstarTime"  name="aplstarTime" placeholder="모집시작기간">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">모집종료기간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="aplendTime"  name="aplendTime" placeholder="모집종료기간">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">수업시작시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="startTime"  name="startTime" placeholder="수업시작시간">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">수업종료시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="endTime"  name="endTime" placeholder="수업종료시간">
		    </div>
		  </div>
		  
		  	    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스등록날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookRegdate"  name="cookRegdate" placeholder="쿠킹클래스등록날짜">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookPrice" name="cookPrice" placeholder="쿠킹클래스가격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스이미지</label>
		    <div class="col-sm-4">
		     <input multiple="multiple" type="file" id="uploadfile" name="uploadfile"  >
		    
		    </div>
		  </div>
		  

		    <div class="form-group">
		    <label for="cookTheme" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스테마</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookTheme" name="cookTheme" placeholder="쿠킹클래스테마">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스장소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookLocation" name="cookLocation" placeholder="쿠킹클래스장소">
		    </div>
		  </div>
		  
		   	  <div class="form-group">
		    <label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">1분영상</label>
		    <div class="col-sm-4">
		     <input multiple="multiple" type="file" id="uploadfile" name="uploadfile"  >
		    
		    </div>
		  </div>
		  
		  
		  
		  
		  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등&nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>