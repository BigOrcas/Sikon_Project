<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>상품등록</title>

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

//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "button:contains('확인')" ).on("click" , function() {
		 
		 
		 self.location = "/cook/listCook.jsp?menu=search"
	});
	
	 $( "button:contains('추가등록')" ).on("click" , function() {

		 self.location = "/cook/addCook.jsp"
		 
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

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-default text-center">쿠 킹 클 래 스 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		 <input type="hidden" name="cookNo" value="${cook.cookNo}"/>
		 <input type="hidden" name="menu"  value="${param.menu}">
		      
		  <div class="form-group">
		    <label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookName" name="cookName" value="${cook.cookName}" placeholder="쿠킹클래스명">
		      
		    </div>
		  
		  </div>
		  
		   <div class="form-group">
		    <label for="cookStock" class="col-sm-offset-1 col-sm-3 control-label">모집인원재고</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookStock" name="cookStock"value="${cook.cookStock}" placeholder="모집인원재고">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="cookRecruit" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스모집인원</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookRecruit" name="cookRecruit"value="${cook.cookRecruit}" placeholder="쿠킹클래스모집인원">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookBrief" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스간략설명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookBrief" name="cookBrief" value="${cook.cookBrief}" placeholder="쿠킹클래스간략설명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스등록날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookRegdate"  name="cookRegdate" value="${cook.cookRegdate}" placeholder="제조일자">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">모집시작기간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="aplstarTime"  name="aplstarTime" value="${cook.aplstarTime}" placeholder="모집시작기간">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">모집종료기간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="aplendTime"  name="aplendTime" value="${cook.aplendTime}" placeholder="모집종료기간">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">수업시작시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="startTime"  name="startTime" value="${cook.startTime}" placeholder="수업시작시간">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">수업종료시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="endTime"  name="endTime" value="${cook.endTime}" placeholder="수업종료시간">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookPrice" name="cookPrice"value="${cook.cookPrice}" placeholder="쿠킹클래스가격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스이미지</label>
		    <div class="col-sm-4">
		   
		    	
		    
		
		<c:when test="${cook.cookFilename.contains('/')}">
		
			<td class="ct_write01">
		
					<c:forEach var="name" items="${cook.cookFilename.split('/')}">
						<img src="/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
					</c:forEach>
	
			</td>
		
		</c:when>
		
	

		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookTheme" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스테마</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookTheme" name="cookTheme" value="${cook.cookTheme}" placeholder="쿠킹클래스테마">
		      
		    </div>
		  
		  </div>
		  
		    <div class="form-group">
		    <label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">쿠킹클래스장소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookLocation" name="cookLocation" value="${cook.cookLocation}" placeholder="쿠킹클래스장소">
		      
		    </div>
		  
		  </div>
		  
	<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  		
	  			<button type="button" class="btn btn-default">확인</button>
	  		
			
			
		
		<button type="button" class="btn btn-default">추가등록</button>
				
				
				
	  		</div>
		</div>
		
	
		</form>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>