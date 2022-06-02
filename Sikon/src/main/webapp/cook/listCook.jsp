<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
      <style>

        .bi-heart{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
        }

        .bi-heart-fill{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
        }

    </style>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
div.thumbnail {
	height: 500px;
	width: 340px;
}
</style>


<style>
.page-header.text-info {
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
.table.table-hover.table-striped {
	font-family: 'Gowun Batang', serif;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/cook/listCook?menu=${param.menu}").submit();
			console.log('${param.menu}');
		}
		
		
		$(document).on('click', 'a.btn-defualt', function(){
			 var cookNo =$(this).attr("value");
			 console.log('������');
			 self.location = "/cook/getCook&cookNo="+cookNo
		});
		
		 $(document).on('click', 'a.update', function(){
			 var cookNo =$(this).attr("value");
			 console.log('�����ϱ�');
			 self.location = "/cook/updateCook?cookNo="+cookNo
		});


		
	

		 
	
		
		 
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			
			 
			$( "p.like_btn" ).on("click" , function(){
				//var cookNo = $(this).attr("value");
				var userId = $("input[name='userId']").val();
				var cookNo = $(this).attr("value");
				
				console.log(cookNo);
				console.log(userId);
			     $.ajax({
			            type : "POST",  
			            url : "/heart/json/updateHeart",       
			            dataType : "json",   
			            data : {'cookNo' : cookNo, 'userId' : userId },
			            error : function(){
			               alert("��� ����");
			            },
			            success : function(heartCheck) {
			                
			                    if(heartCheck == 0){
			                    	alert("��õ�Ϸ�.");
			                    	  
			                       
			                    	location.reload();
			                    }
			                    else if (heartCheck == 1){
			                     alert("��õ���");
			                   
			                  
			                    	location.reload();

			                    
			                }
			            }
			        })
			 });
				//=====================================================
				$( "button.btn.btn-default:contains('�˻�')" ).on("click" , function() {
					fncGetList(1);
				 
			 });
				
				 $(document).on('click', 'a.btn-defualt', function(){
					 var cookNo =$(this).attr("value");
					 console.log('������');
					 self.location = "/cook/getcook?menu=search&cookNo="+cookNo
				});
				 
				
				 $(document).on('click', 'a.update', function(){
					 var cookNo =$(this).attr("value");
					 console.log('�����ϱ�');
					 self.location = "/cook/updatecook?cookNo="+cookNo
				});
				 
				 $(document).on('click', 'a.buy', function(){
					 var cookNo =$(this).attr("value");
					 console.log('�����ϱ�');
					 self.location = "/cook/getcook?menu=search&cookNo="+cookNo
				});
				
				 //=========autoComplete=================================================
				 
				 var list = [];
			   		<c:forEach var="names" items="${autocook }" >
			   		list.push("${names.cookName}");
			   		</c:forEach>
			   		
		   		    
			   		$( "#cookName" ).autocomplete({
			   		      source: list,
			   		      
			   		});
			   		
			   	//====================================================================
			 
			   	 $(window).scroll(function() {
		                if($(window).scrollTop() == $(document).height() - $(window).height()) { 
		                	
		                	var cpage = $("#currentPage").val();
		                	console.log(cpage);
		                	cpage = Number(cpage)+1;
		                	console.log(cpage);
		        	   		
		        	   		
					            $.ajax({
					                
					                  url : "/cook/json/listcook?&menu=${param.menu }" ,
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
					                	//console.log(cpage); 
					                	//alert(JSONData.list[0].cookName);
					                	//alert(JSONData.list.length);
					                	console.log(JSONData.list[0].cookName);
						                	 
					                	for(var i=0; i<JSONData.list.length-1; i++){
					                		///*
					                		var image;
					                		var message;
					                		var cancel;
					                		var button;
					                
					                		if(JSONData.list[i].cancel == '0'){
				                				
				                					image = "<img src='/images/uploadFiles/"+JSONData.list[i].fileName.split('/')[0]+"' id='image'>";
				                				
					                			
					                		}else if(JSONData.list[i].cancel == '1'){
					                			
				                					image = "<img src='/images/uploadFiles/"+JSONData.list[i].fileName.split('/')[0]+"' id='image_none'>";
				                				
					                		}
					                		
					                		
					                		if(${user.role.equals('admin') && param.menu.equals('manage')}){
					                			message="<p>���� ��� : "+JSONData.list[i].stock+"</p>";
					                		}else{
					                			message="<p></p>";
					                		}
					                		
					                		
					                		if(JSONData.list[i].cancel == '1' && param.menu.equals('search')){
					                			cancel = "<p style='color:#DB4455'>�Ǹ�����</p>";
					                		}else if(JSONData.list[i].cancel == '1' && param.menu.equals('manage')){
					                			cancel = "<p style='color:#DB4455'>*�Ǹ������� ��ǰ�Դϴ�.</p>";
					                		}else if(JSONData.list[i].cancel == '0'){
					                			cancel = "<p></p>";
					                		}
					                		
					                		if(${param.menu=='manage' }){
					                			button = "<a class='btn btn-defualt btn update'  role='button' value='"+JSONData.list[i].cookNo+"'>�����ϱ�</a>" ;
					                		}else{
					                			if(JSONData.list[i].stock == "0"){
					                				button = "<a class='btn btn-defualt btn disabled' role='button' >������</a>";
					                			}else{
					                				if(JSONData.list[i].cancel=='0'){
					                					button = "<a class='btn btn-default btn buy' role='button' value='"+JSONData.list[i].cookNo+"'>�����ϱ�</a>";
					                				}else{
					                					button = "<a class='btn btn-default btn disabled' role='button' value='"+JSONData.list[i].cookNo+"'>�����ϱ�</a>";
					                				}
					                			}
					                		}
					                		
						                     var displayValue = "<div class='col-sm-6 col-md-4'>"
						                     					+"<div class='thumbnail'>"
						                     					+image
					                     						+"<div class='caption'>"
					                     						+"<h3>"+JSONData.list[i].cookName+"</h3>"
					                     						+cancel
					                     						+"<p>"+JSONData.list[i].price+" ��</p>"
					                     						+"<p align='right'>"
					                     						+"<a class='btn btn-defualt btn'  role='button' value='"+JSONData.list[i].cookNo+"'>������</a>"
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
	       <h3 class=" text-info" style="color:#75574B;">
	       <c:if test="${param.menu.contains('manage') }">
	       ��ŷŬ�����˻�
	       </c:if>
	       <c:if test="${param.menu.contains('search') }">
	       ��ŷŬ�����˻�
	       </c:if>
	       </h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary" style="color:black;">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>

			
			<form class="form-inline" name="detailForm">
				<div class="col-md-6 text-right">
					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${!empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>��ŷŬ������ȣ</option>
							<option value="1"
								${!empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>��ŷŬ������</option>
							
						</select>

					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="cookName"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
							
					<button type="button" class="btn btn-default">�˻�</button>
					</div>
					
				</div>
	
					
				
					
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
				
		</form>
			
		

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->


		</div>
</div>
	
		
<div class="container">
	
<div class="row">
	<c:set var="i" value="0" />

<c:if test="${param.menu=='search'}">
<c:forEach var="cook" items="${list}">
  <input type="hidden" name="userId" value="${user.userId}">
  <input type="hidden" name="cookNo" value="${cook.cookNo}">
    <input type="hidden" name="cookNo" value="${cook.cookStock}">
   <input type="hidden" name="heartcheck" value="${heart.heartcheck}">
 <div class="col-sm-6 col-md-4">
 <br/> <br/>
    <div class="thumbnail">
    				<c:choose>
    
    	<c:when test="${(cook.cookFilename).contains('/')}">
    		<c:forEach var="name" items="${(cook.cookFilename).split('/')[0]}">
		<img class="image" src="/images/uploadFiles/${name}" width="200" height="200" ><br/>
			</c:forEach>
		
      </c:when>
		
		<c:otherwise>
		
		<img class="image" src="/images/uploadFiles/${cook.cookFilename}" width="200" height="200"><br/>
		</c:otherwise>
		</c:choose>
		
      <div class="caption">
        <h4 style="color:black;">${cook.cookName }</h4>
        <p>${cook.cookPrice }</p>
        
     
      
        <p><a href="/cook/getCook?menu=search&cookNo=${cook.cookNo}" class="btn btn-default" role="button">������</a>
         <a href="/cook/updateCook?menu=${param.menu}&cookNo=${cook.cookNo }" class="btn btn-default" role="button">����</a> 
        
        <a class="btn btn-default" disabled="disabled" role="button">����</a>
                    <p align="right" class="bi bi-heart like_btn" value="${cook.cookNo}" id="like_btn">${cook.hearthit}</p>
                    	

        
                   <script>
    
          
            var p =  $(this).attr("value");
            $('p').on('click',function(){
                if(p<=0){
                	 $(this).attr('class','bi-heart-fill');
                    p++;
                }else if(p==1){
                	$(this).attr('class','bi-heart');
                    p--;
                }
                
            });

</script>
    



        
   
      </div>
    </div>
  </div>		
    </c:forEach>
    </c:if>
    
<c:if test="${param.menu=='manage'}">
    <c:forEach var="cook" items="${list}">
    
 <div class="col-sm-6 col-md-4">
 <br/> <br/>
    <div class="thumbnail">
     <c:choose>
    
    	<c:when test="${(cook.cookFilename).contains('/')}">
    		<c:forEach var="name" items="${(cook.cookFilename).split('/')[0]}">
		<img src="/images/uploadFiles/${name}" width="200" height="200"><br/>
			</c:forEach>
		
      </c:when>                                                                                                                           
		
		<c:otherwise>
		<img src="/images/uploadFiles/${cook.cookFilename}" width="200" height="200"><br/>
		</c:otherwise>
		</c:choose>
      <div class="caption">
        <h4 style="color:black;">${cook.cookName }</h4>
        <p>${cook.cookPrice }</p>
        <c:if test="${cook.cancel=='1' }">
        <p style="color:red;">�Ǹ�����</p>
        </c:if>
        <p><a href="/cook/getcook?menu=manage&cookNo=${cook.cookNo }" class="btn btn-default" role="button" >������</a> 
        <a href="/cook/updatecook?menu=${param.menu}&cookNo=${cook.cookNo }" class="btn btn-default" role="button">����</a>
       
      </div>
    </div>
  </div>		
    </c:forEach>
    </c:if>
    
              <div  id="scrollList"></div>
    
  </div>
		
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	<!-- PageNavigation Start... -->
	<!-- PageNavigation End... -->
	
</body>

</html>