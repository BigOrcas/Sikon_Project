<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	   <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       
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
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">


//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��

	 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('����')" ).on("click" , function() {
					self.location = "/apply/addApply?menu=${param.menu}&cookNo=${cook.cookNo}"
				});		
			
			 $( "button:contains('Ȯ��')" ).on("click" , function() {
				 
				 
				 self.location = "/cook/listCook?menu=manage"
						 
				});
			 
			 $( "button:contains('���')" ).on("click" , function() {
					history.go(-1);
				});
		});
		
	 function fncAddWish() {
			

			
			
			$("form").attr("method" , "POST").attr("action" , "/wish/addWish").submit();
			
		}
	 
	 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-warning" ).on("click" , function() {
				console.log('��ٱ���');
				fncAddWish();
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
	        <h3 class=" text-info" >��ǰ����ȸ
	        
    <i class="bi bi-heart"></i>
    
    <script>
    var i = 0;
    $('.bi-heart').on('click',function(){
        if(i==0){
            $(this).removeClass('bi-heart');
            $(this).addClass('bi-heart-fill');
            i++;
        }else if(i==1){
            $(this).removeClass('bi-heart-fill');
            $(this).addClass('bi-heart');
            i--;
        }
        
    });

</script>
	        
	     </h3>   
	      
	    </div>

	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ������ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookNo}</div>
		</div>
	
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ������</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookName}</div>
		</div>
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�����ο����</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookStock}</div>
		</div>
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ���������ο�</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookRecruit}</div>
		</div>
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ������������</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookBrief}</div>
		</div>
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ������ϳ�¥</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookRegdate}</div>
		</div>								
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������۱Ⱓ</strong></div>
			<div class="col-xs-8 col-md-4">${cook.aplstarTime}</div>
	</div>
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������Ⱓ</strong></div>
			<div class="col-xs-8 col-md-4">${cook.aplendTime}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������۽ð�</strong></div>
			<div class="col-xs-8 col-md-4">${cook.startTime}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������ð�</strong></div>
			<div class="col-xs-8 col-md-4">${cook.endTime}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ��������</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookPrice}</div>
		</div>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ�����׸�</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookTheme}</div>
		</div>
			<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ�������</strong></div>
			<div class="col-xs-8 col-md-4">${cook.cookLocation}</div>
		</div>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ŷŬ�����̹���</strong></div>
			<div class="col-xs-8 col-md-4">
			
		<c:choose>
		
		<c:when test="${cook.cookFilename.contains('/')}">
		
			<td class="ct_write01">
				<c:choose>
				<c:when test="${cook.cookFilename.contains('mp4')}">
					<c:forEach var="name" items="${cook.cookFilename.split('/')}">
						<video width="400" height="400" controls autoplay src="/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="name" items="${cook.cookFilename.split('/')}">
						<img src="/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>		
		
			</td>
		
		</c:when>
		
		<c:otherwise>
			<img src="/images/uploadFiles/${cook.cookFilename}" width="300" height="300" align="absmiddle"/>
		</c:otherwise>
		</c:choose>

			</div>
	</div>

	<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  		<c:if test="${param.menu=='manage'}">
	  			<button type="button" class="btn btn-default">Ȯ��</button>
	  		
			</c:if>
			<c:if test="${param.menu=='search'}">
	  			<button type="button" class="btn btn-default">����</button>
	  			<button type="button"  class="btn btn-warning"  >��ٱ���</button>
				</c:if>	
		
		<button type="button" class="btn btn-default">���</button>
				
				
				
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>