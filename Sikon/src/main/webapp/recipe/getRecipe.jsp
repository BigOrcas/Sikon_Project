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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
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
	color: brown
}

.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: brown
}

.row {
	font-family: 'Gowun Batang', serif;
}
</style>
     
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			 $( "button:contains('Ȯ��')" ).on("click" , function() {
					self.location = "/review/listReview"
				});
			 
			 $( "button:contains('���')" ).on("click" , function() {
					history.go(-1);
				});
			 
			 $( "button:contains('å����')" ).on("click" , function() {
					self.location = "/bookmark/addBookmark?recipeNo=${recipe.recipeNo}"
				});
		});
		
		 
		
	</script>
	
	<script>
	let commentInput=document.getElementsByClassName("main_comment_text")[0];
	let submitBtn=document.getElementsByClassName("main_comment_submit")[0];
	
	function submit(){
		const box=document.getElementsByClassName("main-icon-like-text-write_comment")[0]
		
		const comments=document.createElement("div")
		const userName=document.createElement("span")
		const mainText=document.createElement("p")
		
		comments.classList.add('main-icon-like-text-write_commentbox')
		userName.classList.add("userName");
		mainText.classList.add("main-icon-like-text-write-subtext");
		
		mainIcon.setAttribute("src","../images/heart.png")
		
		userName.innerHTML=" yeda"
		mainText.innerText=commentInput.value;
		
		comments.appendChild(userName);
		comments.appendChild(mainText);
		
		box.appendChild(comments);
	}
	
	submitBtn.addEventListener("click",(event)=>{
		submit()
		commentInput.value="";
		
	});
	
	commentInput.addEventListener('keydown',(event)=>{
	if(event.code==='Enter'){
		submit()
		commentInput.value="";
	}	
	})
	
	</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">

			<h3 class=" text-info" style="color: #75574B;">�����ǻ���ȸ</h3>
			<br></br>
		</div>
		
		<div class="row">
			<img src="/images/uploadFiles/${recipe.recipeImg}" width="300" height="300"><br/>
			<button type="button" class="btn btn-default">å����</button>
			
		</div>
		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�����Ǹ�</strong>
			</div>
			<div class="col-xs-8 col-md-4">${recipe.recipeName}</div>
		</div>

		<hr />

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ǰ�������</strong></div>
			<div class="col-xs-8 col-md-4">${recipe.recipeDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ҿ�ð�</strong></div>
			<div class="col-xs-8 col-md-4">${recipe.cookingTime}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�׸�</strong></div>
			<div class="col-xs-8 col-md-4">${recipe.recipeTheme}</div>
		</div>
		<hr/>
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${recipe.recipeOrder}</div>
		</div>
		
		<hr/>
				<div class="main-icon-like-text-write_comment">
			div �±� �ȿ� ���� �ڹٽ�ũ��Ʈ�� ���� ȭ���� �� �����Դϴ�.
</div> 
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  			  			<button type="button" class="btn btn-default">Ȯ��</button>
	  		
		
		<button type="button" class="btn btn-default">���</button>
				
				
				
	  		</div>
		</div>
		
		<br/>
		
		<div class="row">
			<h3 class=" text-info" style="color: #75574B;">������</h3>
			<br/>
	<c:set var="i" value="0" />
<c:forEach var="review" items="${list}">
		<div class="caption">

        
        
        <blockquote>
  <footer>${review.content }</footer>
</blockquote>

        <hr/>
        </div>
        </c:forEach>
		</div>

 	</div> <!-- container -->
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>
