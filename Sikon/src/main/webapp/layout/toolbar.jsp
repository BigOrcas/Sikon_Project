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
		
	//����
		
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
	
	//���ϳ�
</script>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-default navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">��Ź�ǿµ�</a>
		
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
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	             
	              <!--  ȸ������ DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">����������ȸ</a></li>
	                         <li><a href="#">�������׸��</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">ȸ��������ȸ</a></li>
	                         	<li><a href="#">�������װ���</a></li>
	                         	<li><a href="#">��������</a></li>
	                         	<li><a href="#">��������</a></li>
	                           	<li><a href="#">�����߱�</a></li>
	                           	<li><a href="#">�������������ȸ</a></li>
	                           	<li><a href="#">�����߱޸����ȸ</a></li>
	                         </c:if>
	                     </ul>
	                 </li>
	                 
	              <!-- �ǸŻ�ǰ���� DrowDown  -->
	                <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >��������</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">��ǰ���</a></li>
		                         <li><a href="#">��ǰ����</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">�ǸŸ���Ʈ��ȸ</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	                 
	              <!-- ���Ű��� DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >�����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">��ǰ�˻�</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">�ֱ� �� ��ǰ</a></li>
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                         <li class="divider"></li>
	                           <li><a href="#">�����̷���ȸ</a></li>
	                         </c:if>
	                     </ul>
	                 </li>
	                 
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">�����ǰ˻�</a></li>
              	             <li><a href="#">�����ǵ��</a></li>
	                           <li><a href="#">���Ƿ�����</a></li>
	                         <li><a href="#">�ֱٺ���ǰ</a></li>
	                         <li class="divider"></li>
	                     </ul>
	                 </li>
	                 
	                 <!-- �ǸŻ�ǰ���� DrowDown  -->
	                <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >��ŷŬ��������</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">��ŷŬ�������</a></li>
		                         <li><a href="#">Ŭ��������</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">�ǸŸ���Ʈ��ȸ</a></li>
		                     </ul>
		                </li>
	                 </c:if>
	                 
	                 
	              <!-- ���Ű��� DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ŷŬ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">��ŷŬ�����˻�</a></li>
	                         <li><a href="#"> ��ٱ���</a></li>
	                         <li><a href="#"> ��û�����ȸ</a></li>
	                         <li><a href="#">�ǸŸ�ϰ���</a></li>
	                        
	                         <li class="divider"></li>
	                         <li><a href="#">�ֱ� �� Ŭ����</a></li>
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                         <li class="divider"></li>
	                           <li><a href="#">��û�̷���ȸ</a></li>
	                          
	                           
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
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains(' LOGOUT')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		
		//=============  ����������ȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
			
		
		//=============  ���������� Event  ó�� =============	
		 $( "a:contains(' MyPage')" ).on("click" , function() {
		 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
			});
		
	 	//=============  ��ٱ��� Event  ó�� =============	
	 	$( "a:contains(' Cart')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/cart/getCartlist");
		});
		
	 	 $(function() {
	 		//=============  �ǸŻ�ǰ��� Event  ó�� =============
		 	$("a:contains('��ǰ���')").on("click" , function() {
				self.location = "/product/addProductView.jsp"
			}); 			 		
		 });
	 	 
	 	$(function() {
	 	//=============  �ǸŻ�ǰ���� Event  ó�� =============
		 	$("a:contains('��ǰ����')").on("click" , function() {
				self.location = "/product/listProduct?menu=manage"
			}); 
	 	 });
	 	
	 	//=============  �ǸŸ���Ʈ��ȸ Event  ó�� =============	
	 	$( "a:contains('�ǸŸ���Ʈ��ȸ')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listSales?menu=manage");
		});
	 	
	 	$(function() {
		//=============  �� ǰ �� �� Event  ó�� =============
			$("a:contains('��ǰ�˻�')").on("click" , function() {
				self.location = "/product/listProduct?menu=search"
			}); 
		});
	 	
	 	
	 	$(function() {
		//=============  �����̷���ȸ Event  ó�� =============
		 	$("a:contains('�����̷���ȸ')").on("click" , function() {
				self.location = "/purchase/listPurchase"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('�������װ���')").on("click" , function() {
		 		self.location = "/notice/listNotice?menu=manage"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('�������׸��')").on("click" , function() {
		 		self.location = "/notice/listNotice?menu=search"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('��������')").on("click" , function() {
		 		self.location = "/coupon/manageCoupon"
			}); 
		});
	 	
	 	$(function() {
		 	$("a:contains('��������')").on("click" , function() {
		 		self.location = "/coupon/addCoupon.jsp"
			}); 
		});
	 	
		$(function() {
		 	$("a:contains('�����߱�')").on("click" , function() {
		 		self.location = "/coupon/issueCoupon"
			}); 
		});
		
		$(function() {
		 	$("a:contains('�������������ȸ')").on("click" , function() {
		 		self.location = "/coupon/listCoupon"
			}); 
		});
		
		$(function() {
		 	$("a:contains('�����߱޸����ȸ')").on("click" , function() {
		 		self.location = "/coupon/listIssuedCoupon"
			}); 
		});
	 	
	 	$( "a:contains('�ֱ� �� ��ǰ')" ).bind("click" , function() {
	 		popWin = window.open("/history.jsp", "popWin",
	 		"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}); 
	 	
	 	
	 	$( "a:contains('�����ǰ˻�')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/recipe/listRecipe");
		});
		
		$( "a:contains('�����ǵ��')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/recipe/addRecipe.jsp");
		});
		
		$( "a:contains('����������')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/bookmark/listBookmark");
		});
		
		$( "a:contains('���Ƿ�����')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/recipe/getMyRecipeList");
		});
	 	$( "a:contains('��ŷŬ�����˻�')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/cook/listCook?menu=search");
		});
	 	
	 	$( "a:contains('��ŷŬ�������')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/cook/addCook.jsp");
		});
		$( "a:contains(' ��ٱ���')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/wish/getWish?userId=${sessionScope.user.userId}");
		});
		
		
		$( "a:contains('��û�����ȸ')" ).on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
	 		$(self.location).attr("href","/apply/listApply?menu=search");
		});
		$( "a:contains('�ǸŸ�ϰ���')" ).on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
	 		$(self.location).attr("href","/apply/listSale?menu=manage");
		}); 
	 	
		
		
	</script>  