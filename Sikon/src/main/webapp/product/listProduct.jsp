<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   <!-- font -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">



<style>
body>div.container{
	padding-top : 50px;
}


div.row{
	font-family: 'Nanum Myeongjo', serif;
}

 div.page-header{
	font-family: 'Nanum Myeongjo', serif;
}  
     
#image {
	width: 250px;
	height:250px;
	border-radius: 5px;
} 

#image_none {
	width: 250px;
	height:250px;
	filter: blur(2px);
	border-radius: 5px;
}   
    
div.thumbnail {
	height:410px;
	border-radius: 5px;
}
       
div.floatbar{
	position : fixed;
    left: 50%;
    top: 0;
}

div.bar{
    position: absolute;
    right: -910px;
    top: 250px;
    width: 120px;
    height: 300px;
    background-color: #bc8f8f;
}



</style>
	<script type="text/javascript">

	
	
		function fncGetList(currentPage) {
			console.log(currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?&menu=${param.menu }").submit();
		}


		 $(function() {
			 
			
			
			

			 //=========autoComplete=================================================
			 
			 var list = [];
		   		<c:forEach var="names" items="${prodNames }" >
		   		list.push("${names.prodName}");
		   		</c:forEach>
		   		
	   		    
		   		$( "#prodname" ).autocomplete({
		   		      source: list,
		   		      
		   		});
		   	//====================================================================
		///*
		
			
            $(window).scroll(function() {
                if($(window).scrollTop() == $(document).height() - $(window).height()) { 
                	
                	var cpage = $("#currentPage").val();
                	cpage = Number(cpage)+1;
                	console.log(cpage);
        	   		
        	   		
			            $.ajax({
			                
			                  url : "/product/json/listProduct?&menu=${param.menu }" ,
			                  method : "POST" ,
			                  data : JSON.stringify({
			                	  currentPage : cpage
			                  }), 
			                  dataType : "json" ,
			                  headers : {
			                     "Accept" : "application/json",
			                     "Content-Type" : "application/json"
			                  },
			                success : function(JSONData , status) {
			                	 
			                	$("#currentPage").val(cpage)
			                	console.log(cpage); 
			                	//alert(JSONData.list[0].prodName);
			                	//alert(JSONData.list.length);
			                	console.log(JSONData.list[0].prodName);
				                	 
			                	for(var i=0; i<JSONData.list.length-1; i++){
			                		///*
			                		var image;
			                		var message;
			                		var prodStatus;
			                		var button;
			                		
			                	
			                		
			                		if(JSONData.list[i].prodStatus == 'Y'){
		                				if(JSONData.list[i].prodThumbnail.indexOf('mp4',0) != -1){
		                					image="<img src='/resources/images/uploadFiles/tumbnail.png' id='image'>";
		                				}else{
		                					image = "<img src='/resources/images/uploadFiles/"+JSONData.list[i].prodThumbnail.split('&')[0]+"' id='image'>";
		                				}
			                			
			                		}else if(JSONData.list[i].prodStatus == 'N'){
			                			if(JSONData.list[i].prodThumbnail.indexOf('mp4',0) != -1){
		                					image="<img src='/resources/images/uploadFiles/tumbnail.png' id='image_none'>";
		                				}else{
		                					image = "<img src='/resources/images/uploadFiles/"+JSONData.list[i].prodThumbnail.split('&')[0]+"' id='image_none'>";
		                				}
			                		}
			                		
			                		
			                		if(${user.role.equals('admin') && param.menu.equals('manage')}){
			                			message="<p>남은 재고량 : "+JSONData.list[i].prodStock+"</p>";
			                		}else{
			                			message="<p></p>";
			                		}
			                		
			                		
			                		if(JSONData.list[i].prodStatus == 'N' && param.menu.equals('search')){
			                			prodStatus = "<p style='color:#DB4455'>판매중지</p>";
			                		}else if(JSONData.list[i].prodStatus == 'N' && param.menu.equals('manage')){
			                			prodStatus = "<p style='color:#DB4455'>*판매중지된 상품입니다.</p>";
			                		}else if(JSONData.list[i].prodStatus == 'Y'){
			                			prodStatus = "<p></p>";
			                		}
			                		
			                		if(${param.menu=='manage' }){
			                			button = "<a class='btn btn-defualt btn update'  role='button' value='"+JSONData.list[i].prodNo+"'>수정하기</a>" ;
			                		}else{
			                			if(JSONData.list[i].prodStock == "0"){
			                				button = "<a class='btn btn-defualt btn disabled' role='button' >재고없음</a>";
			                			}else{
			                				if(JSONData.list[i].prodStatus=='Y'){
			                					button = "<a class='btn btn-default btn buy' role='button' value='"+JSONData.list[i].prodNo+"'>구매하기</a>";
			                				}else{
			                					button = "<a class='btn btn-default btn disabled' role='button' value='"+JSONData.list[i].prodNo+"'>구매하기</a>";
			                				}
			                			}
			                		}
			                		
				                     var displayValue = "<div class='col-sm-6 col-md-3'>"
				                     					+"<div class='thumbnail'>"
				                     					+image
			                     						+"<div class='caption'>"
			                     						+"<h3>"+JSONData.list[i].prodName+"</h3>"
			                     						+message
			                     						+prodStatus
			                     						+"<p>"+JSONData.list[i].prodPrice+" 원</p>"
			                     						+"<p align='right'>"
			                     						+"<a class='btn btn-defualt btn'  role='button' value='"+JSONData.list[i].prodNo+"' style='color:#bc8f8f'>상세조회</a>"
			                     						+button
			                     						+"</p>"
			                     						+"</div></div></div>"
			                     						
			                     		//*/				
				               	$( '#scrollList' ).append(displayValue);	
			                     						
			                     						 		
			                    						
			                     						
			                	}//for 
			                 }
			            });//ajax
			           
                }//if
            });//function
		   		
		   		
		   		//*/

		   		

		   	//====================================================================	
		   		
		   		
            $( "#search" ).on("click" , function() {
				fncGetList(1);
			});
			
			 $( "#sorting" ).on("click" , function() {
					fncGetList(1);
			});
			
			///*
			 
			 $( "a.btn-defualt" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('상세조회');
				 self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+menu
			});
			 
			
			 $( "a.update" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('수정하기');
				 self.location = "/product/updateProduct?prodNo="+prodNo
			});
			 
			 $( "a.buy" ).on("click" , function() {
				 var prodNo =$(this).attr("value");
				 console.log('구매하기');
				 self.location = "/product/getProduct?menu=search&prodNo="+prodNo
			});
			 
			 
			 var menu = $("#menu").val();
			 console.log(menu);

			
			 $(document).on('click', 'a.update', function(){
				 var prodNo =$(this).attr("value");
				 console.log('수정하기');
				 self.location = "/product/updateProduct?prodNo="+prodNo
			});

			 
	   	
			//====================================================================	
			 
			 $(document).on('click', '.thumbnail', function(){
				 var prodNo =$(this).attr("value");
				 console.log('썸네일 클릭'+prodNo);
				 self.location = "/product/getProduct?prodNo="+prodNo+"&menu="+menu;
			});
				
				
				
		});	
		 
		
	</script>		
</head>
<title>Home Deco</title>
<body>
	
	
	<!-- ToolBar Start /////////////////////////////////////-->
		<%--<jsp:include page="/layout/toolbar2.jsp" /> --%>
		<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info text-left">
	       <h3  style="color:#bc8f8f">상품목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary" style="color:gray">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    
			    <form class="form-inline" name="detailForm">
			    <div class="col-md-6 text-right">
				  <div class="form-group">
				    <c:if test="${ user.role.equals('admin')}">
						<select name="searchCondition" class="form-control" style="width:125px">
						 	<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
						</select>
					</c:if>
					<c:if test="${ !user.role.equals('admin')}">
						<input type="hidden" name="searchCondition" value="1">
					</c:if>	
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색</label>
				    <input type="text" class="form-control" id="prodname" name="searchKeyword"  placeholder="검색"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="search">검색</button>
				</div>  
				 
				 <div class="col-md-6 text-left"> 
				  <div class="form-group" align="left">
				    <c:if test="${ !user.role.equals('admin')}">
						<select name="orderCondition" class="form-control" style="width:125px">
						 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--정렬하기--</option>
							<option value="1"  ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>낮은가격순</option>
							<option value="2"  ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>높은가격순</option>
						</select>
					</c:if>
					<c:if test="${ user.role.equals('admin')}">
						<select name="orderCondition" class="form-control" style="width:125px">
							<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--정렬하기--</option>
							<option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>판매중</option>
							<option value="4"  ${ ! empty search.orderCondition && search.orderCondition==4 ? "selected" : "" }>판매중지</option>
							<option value="5"  ${ ! empty search.orderCondition && search.orderCondition==5 ? "selected" : "" }>재고없음</option>
						</select>
					</c:if>
				  </div>
				  
				  
				  <button type="button" class="btn btn-default" id="sorting">조회</button>
				  </div>
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value="1"/>
				  <input type="hidden" id="menu" name = "menu" value="${param.menu }"/>
				  
				</form>
	    	</div>
	    	
		
		
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
	<br/>
		<div>
		<%--<br/><jsp:include page="../common/pageNavigator_new.jsp"/><br/> --%>
		</div>
		
      <!--  table Start /////////////////////////////////////-->
      
		<div class="row" id="target">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			
			  <div class="col-sm-6 col-md-3">
			    <div class="thumbnail" value="${product.prodNo}">
			    
			    <c:if test="${product.prodStatus.contains('Y') }">
				    <c:choose>
				    <c:when test="${product.prodThumbnail.contains('&')}">
					    <c:choose>
						<c:when test="${product.prodThumbnail.contains('mp4')}">
							<img src="/resources/images/uploadFiles/tumbnail.png" id="image">
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${product.prodThumbnail.split('&')[0]}">
								<img src="/resources/images/uploadFiles/${name}" id="image">
							</c:forEach>
						</c:otherwise>
						</c:choose>
				    </c:when>
				    <c:otherwise>
						<img src="/resources/images/uploadFiles/${product.prodThumbnail}" class="img-responsive img-rounded" id="image">
					</c:otherwise>
					</c:choose>
			    </c:if>
			    
			    <c:if test="${product.prodStatus.contains('N') }">
				    <c:choose>
				    <c:when test="${product.prodThumbnail.contains('&')}">
					    <c:choose>
						<c:when test="${product.prodThumbnail.contains('mp4')}">
							<img src="/resources/images/noimage.jpg" id="image_none">
						</c:when>
						<c:otherwise>
							<c:forEach var="name" items="${product.prodThumbnail.split('&')[0]}">
								<img src="/resources/images/uploadFiles/${name}" id="image_none">
							</c:forEach>
						</c:otherwise>
						</c:choose>
				    </c:when>
				    <c:otherwise>
						<img src="/resources/images/uploadFiles/${product.prodThumbnail}" class="img-responsive img-rounded" id="image_none">
					</c:otherwise>
					</c:choose>
			    </c:if>
		    
			    
			      <div class="caption">
			      
			      <p>${product.prodDetail}<p>	      
			      <h4>${product.prodName}</h4>
			      <p style="text-align:right"><del>${product.prodPrice} 원</del></p>
			      <p style="text-align:right;color:#bc8f8f"">${(product.prodDisRate*100)}% &nbsp;
			      <strong>${product.prodDisPrice} 원</strong></p>
			      
			      
			        <c:choose>
			        	<c:when test="${user.role.equals('admin') && param.menu.equals('manage')}">
			        		<p style="text-align:left;">남은 재고량 : ${product.prodStock}</p>
			        		<c:if test="${product.prodStatus.contains('N') }">
			        			<p style="text-align:left; color:#DB4455">판매중지</p>
			        		</c:if>
			        	</c:when>
			        	<c:otherwise>
			        		<c:if test="${product.prodStatus.contains('N') }">
			        			<p style="text-align:left; color:#DB4455">*판매중지된 상품입니다.</p>
			        		</c:if>
			        	</c:otherwise>
			        </c:choose>
			        
			      </div>
			    </div>
			  </div>
			
			
			
          </c:forEach>
          
          
          <div  id="scrollList"></div>
          
          </div>
	  <!--  table End /////////////////////////////////////-->
	  
	  
	  <div class="floatbar">
	  	<div class="bar">
	  	<jsp:include page="/history_store.jsp" />
	  	</div>
	  </div>
	  
	  
	  
	  
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	

	
</body>

</html>