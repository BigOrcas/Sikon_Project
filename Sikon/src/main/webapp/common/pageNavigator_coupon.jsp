<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<div class="container text-center">
		 
		 <nav>
		  <!-- ũ������ :  pagination-lg pagination-sm-->
		  <ul class="pagination" >
		    
		    <!--  <<== ���� nav -->
		  	<c:if test="${ couponPage.currentPage <= couponPage.pageUnit }">
		 		<li class="disabled">
			</c:if>
			<c:if test="${ couponPage.currentPage > couponPage.pageUnit }">
				<li>
			</c:if>
		      <a href="javascript:fncGetList('${ couponPage.currentPage-1}')" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    <!--  �߾�  -->
			<c:forEach var="i"  begin="${couponPage.beginUnitPage}" end="${couponPage.endUnitPage}" step="1">
				
				<c:if test="${ couponPage.currentPage == i }">
					<!--  ���� page ����ų��� : active -->
				    <li class="active">
				    	<a href="javascript:fncGetList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    </li>
				</c:if>	
				
				<c:if test="${ couponPage.currentPage != i}">	
					<li>
						<a href="javascript:fncGetList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>
		    
		     <!--  ���� nav==>> -->
		     <c:if test="${ couponPage.endUnitPage >= couponPage.maxPage }">
		  		<li class="disabled">
			</c:if>
			<c:if test="${ couponPage.endUnitPage < couponPage.maxPage }">
				<li>
			</c:if>
		      <a href="javascript:fncGetList('${couponPage.endUnitPage+1}')" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		
</div>
 


<div class="container">
		<nav>
		  <ul class="pager">
		    <li><a href="#">Previous</a></li>
		    <li><a href="#">Next</a></li>
		  </ul>
		</nav>
</div>


<div class="container">
		<nav>
		  <ul class="pager">
		    <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
		    <!-- <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>  -->
		    <li class="next"><a href="#">Newer <span aria-hidden="true">&rarr;</span></a></li>
		  </ul>
		</nav>
</div>