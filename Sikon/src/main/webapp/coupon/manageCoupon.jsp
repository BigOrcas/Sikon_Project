<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
	
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
      }
      		
		.tabTitle li {
		  list-style: none;
		  float: left;
		  width: 100px;
		  padding: 10px 15px;
		  cursor: pointer;
		  text-align: center;
		  border: 1px solid #bebebe;
		}
		
		.tabTitle li.on {
		  background-color: #ffb715;
		  font-weight: bold;
		}
		
		.tabContent {
		  clear: both;
		  border: 1px solid #dedede;
		  height: 130px;
		  background-color: #cecece;
		}
		
		.tabContent div {
		  display: none;
		  text-align: center;
		}
		
		.tabContent div.on {
		  display: block;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		$(document).ready(function() {
		  var $tablink = $(".tabTitle li").click(function() {
		    var idx = $(this).index();
		    $(".tabTitle li").removeClass("on");
		    $(".tabTitle li").eq(idx).addClass("on");
		    $(".tabContent > div").hide();
		    $(".tabContent > div").eq(idx).show();
		  })
		});
			
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		 $(function() {
				
			$("#addCoupon").on("click" , function() {
						
				self.location = "/coupon/addCoupon.jsp";
			});
		});
		 
		 $(function() {
				
				$("#issueCoupon").on("click" , function() {
							
					self.location = "/coupon/issueCoupon";
				});
			});
		 		 
		 $(function() {
				
				$("button.delete").on("click" , function() {
							
					self.location = "/coupon/deleteCoupon?couponNo="+$("input[name='couponNo']").val();
				});
		});
	
		 
		 $(function() {
				
				$("button.cancel").on("click" , function() {
							
					self.location = "/coupon/updateIssueStatus?issueNo="+$(this).attr("value");
				});
			});
		
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="tab">
	
    <ul class="tabTitle">
      <li class="on">����</li>
      <li>�߱�</li>
    </ul>
    
    <div class="tabContent">
    
      <div class="on">
      	    
	    <input type="hidden" id="issueStatus" name="issueStatus" value="��밡��"/>
	    
		 <p class="text-primary">
		  		��ü  ${couponPage.totalCount } �Ǽ�, ���� ${couponPage.currentPage}  ������
		 </p>
			 
		 <button type="button" class="btn btn-primary" id="addCoupon">�� &nbsp;��</button>
		
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
          	<th align="center"></th>
            <th align="center">������ȣ</th>
            <th align="left" >�����̸�</th>
            <th align="left">������</th>
            <th align="left">���αݾ�</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="coupon" items="${couponList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left"><input type="checkbox" name="couponNo" id="couponNo" value = "${coupon.couponNo}" ></td>
			  <td align="center">${coupon.couponNo}</td> 
			  <td align="left">${coupon.couponName}</td>
			  <td align="left">${coupon.discountRate}</td>
			  <td align="left">${coupon.discountValue}</td>
			  <td align="left"><button type="button" class="btn btn-primary delete">����</button></td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	
		<jsp:include page="../common/pageNavigator_coupon.jsp"/>
 
       </div>
      
      <div>
        
	 	<p class="text-primary">
			��ü  ${issuePage.totalCount } �Ǽ�, ���� ${issuePage.currentPage}  ������
		</p>
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
		<button type="button" class="btn btn-primary" id="issueCoupon">�� &nbsp;��</button>
		  
	
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center"></th>
            <th align="center">�߱޹�ȣ</th>
            <th align="left" >�߱�����</th>
            <th align="left">�������� ȸ��</th>
            <th align="left">�߱޳�¥</th>
            <th align="left">���ᳯ¥</th>
            <th align="left">�������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="coupon" items="${issueList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <c:if test = "${coupon.issueStatus != 'ȸ��'}">
			  <td align="left"><input type="checkbox"></td>
			  </c:if>
			  <c:if test = "${coupon.issueStatus == 'ȸ��'}">
			  <td align="left"></td>
			  </c:if>
			  <td align="left">${coupon.issueNo}</td>
			  <td align="left">${coupon.couponName}</td>
			  <td align="left">${coupon.couponUser.userId}</td> 
			  <td align="left">${coupon.startDate}</td>
			  <td align="left">${coupon.endDate}</td>
			  <td align="left">${coupon.issueStatus}</td>
			  <c:if test = "${coupon.issueStatus != 'ȸ��'}">
			  <td align="left"><button type="button" class="btn btn-primary cancel" name="issueNo" value = "${coupon.issueNo}" >ȸ��</button></td>
			  </c:if>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
 
		<jsp:include page="../common/pageNavigator_coupon.jsp"/>
	
      </div>
      
    </div>
    
  </div>
	
	</form>
</body>

</html>