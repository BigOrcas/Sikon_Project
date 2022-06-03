<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">
	var socket = null;
	
	$(document).ready(function(){
		//if(${login != null}){
			connectWs();
		//}
	})
		
	//소켓
		
	function connectWs(){
		console.log("tttttt")
		var ws = new SockJS("/alarm");
		socket = ws;
	
		ws.onopen = function() {
		 	console.log('open');
		};
	
		ws.onmessage = function(event) {
			console.log("onmessage"+event.data);
			
			alert(event.data);
			
			let $socketAlert = $('div#socketAlert');
			$socketAlert.html(event.data)
			$socketAlert.css('display', 'block');
			
			setTimeout(function(){
				$socketAlert.css('display','none');
				
			}, 5000);
		};
	
		ws.onclose = function() {
		    console.log('close');
	 	};
	 
	};
	
	//소켓끝
</script>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-default navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">식탁의온도</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	             
	              <!--  회원관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">개인정보조회</a></li>
	                         <li><a href="#">공지사항목록</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">회원정보조회</a></li>
	                         	<li><a href="#">공지사항관리</a></li>
	                         	<li><a href="#">쿠폰관리</a></li>
	                         	<li><a href="#">쿠폰생성</a></li>
	                           	<li><a href="#">쿠폰발급</a></li>
	                           	<li><a href="#">생성쿠폰목록조회</a></li>
	                           	<li><a href="#">쿠폰발급목록조회</a></li>
	                         </c:if>
	                     </ul>
	                 </li>
	                 
	              <!-- 판매상품관리 DrowDown  -->
	                <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >스토어관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">상품등록</a></li>
		                         <li><a href="#">상품관리</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">판매리스트조회</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	                 
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >스토어</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">상품검색</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">최근 본 상품</a></li>
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                         <li class="divider"></li>
	                           <li><a href="#">구매이력조회</a></li>
	                         </c:if>
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >레시피</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">레시피검색</a></li>
              	             <li><a href="#">레시피등록</a></li>
	                           <li><a href="#">나의레시피</a></li>
	                         <li><a href="#">최근본상품</a></li>
	                         <li class="divider"></li>
	                     </ul>
	                 </li>
	                 
	                 <!-- 판매상품관리 DrowDown  -->
	                <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >쿠킹클래스관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">쿠킹클래스등록</a></li>
		                         <li><a href="#">클래스관리</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">판매리스트조회</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	                 
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >쿠킹클래스</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">쿠킹클래스검색</a></li>
	                         <li><a href="#"> 장바구니</a></li>
	                         <li><a href="#"> 신청목록조회</a></li>
	                         <li><a href="#">판매목록관리</a></li>
	                        
	                         <li class="divider"></li>
	                         <li><a href="#">최근 본 클래스</a></li>
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                         <li class="divider"></li>
	                           <li><a href="#">신청이력조회</a></li>
	                          
	                           
	                         </c:if>
	                     </ul>
	                 </li>

	             </ul>
	             
	             
	             
	             <c:if test="${! empty sessionScope.user.role}">
				<ul class="nav navbar-nav navbar-right">
	                 <li><a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"/> Cart</a></li>
	                 <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"/> MyPage</a></li>
	                <li><a href="#"> <span class="glyphicon glyphicon-log-out" aria-hidden="true"/> LOGOUT</a></li>
				</ul>
				</c:if>
				
				<c:if test="${empty sessionScope.user.role}">
				<ul class="nav navbar-nav navbar-right">
	                 <li><a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"/> Cart</a></li>
				</ul>
				</c:if>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains(' LOGOUT')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		
		//=============  개인정보조회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
			
		
		//=============  마이페이지 Event  처리 =============	
		 $( "a:contains(' MyPage')" ).on("click" , function() {
		 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
			});
		
	 	//=============  장바구니 Event  처리 =============	
	 	$( "a:contains(' Cart')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/cart/getCartlist");
		});
		
	 	 $(function() {
	 		//=============  판매상품등록 Event  처리 =============
		 	$("a:contains('상품등록')").on("click" , function() {
				self.location = "/product/addProductView.jsp"
			}); 			 		
		 });
	 	 
	 	$(function() {
	 	//=============  판매상품관리 Event  처리 =============
		 	$("a:contains('상품관리')").on("click" , function() {
				self.location = "/product/listProduct?menu=manage"
			}); 
	 	 });
	 	
	 	//=============  판매리스트조회 Event  처리 =============	
	 	$( "a:contains('판매리스트조회')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listSales?menu=manage");
		});
	 	
	 	$(function() {
		//=============  상 품 검 색 Event  처리 =============
			$("a:contains('상품검색')").on("click" , function() {
				self.location = "/product/listProduct?menu=search"
			}); 
		});
	 	
	 	
	 	$(function() {
		//=============  구매이력조회 Event  처리 =============
		 	$("a:contains('구매이력조회')").on("click" , function() {
				self.location = "/purchase/listPurchase"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('공지사항관리')").on("click" , function() {
		 		self.location = "/notice/listNotice?menu=manage"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('공지사항목록')").on("click" , function() {
		 		self.location = "/notice/listNotice?menu=search"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('쿠폰관리')").on("click" , function() {
		 		self.location = "/coupon/manageCoupon"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('쿠폰생성')").on("click" , function() {
		 		self.location = "/coupon/addCoupon.jsp"
			}); 
		});
	 	
		$(function() {
		 	$("a:contains('쿠폰발급')").on("click" , function() {
		 		self.location = "/coupon/issueCoupon"
			}); 
		});
		
		$(function() {
		 	$("a:contains('생성쿠폰목록조회')").on("click" , function() {
		 		self.location = "/coupon/listCoupon"
			}); 
		});
		
		$(function() {
		 	$("a:contains('쿠폰발급목록조회')").on("click" , function() {
		 		self.location = "/coupon/listIssuedCoupon"
			}); 
		});
	 	
	 	$( "a:contains('최근 본 상품')" ).bind("click" , function() {
	 		popWin = window.open("/history.jsp", "popWin",
	 		"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}); 
	 	
	 	
	 	$( "a:contains('레시피검색')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/recipe/listRecipe");
		});
		
		$( "a:contains('레시피등록')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/recipe/addRecipe.jsp");
		});
		
		$( "a:contains('마이페이지')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/bookmark/listBookmark");
		});
		
		$( "a:contains('나의레시피')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/recipe/getMyRecipeList");
		});
	 	$( "a:contains('쿠킹클래스검색')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/cook/listCook?menu=search");
		});
	 	
	 	$( "a:contains('쿠킹클래스등록')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/cook/addCook.jsp");
		});
		$( "a:contains(' 장바구니')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/wish/getWish?userId=${sessionScope.user.userId}");
		});
		
		
		$( "a:contains('신청목록조회')" ).on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('회원정보조회')" ) );
	 		$(self.location).attr("href","/apply/listApply?menu=search");
		});
		$( "a:contains('판매목록관리')" ).on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('회원정보조회')" ) );
	 		$(self.location).attr("href","/apply/listSale?menu=manage");
		}); 
	 	
		
		
	</script>  