<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>��ŷŬ�������</title>

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 30px;
        }
    </style>
	<script type="text/javascript">



	function fncAddCook() {
		//Form ��ȿ�� ����
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
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (cookBrief == null || cookBrief.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
	
	
		if (cookStock == null || cookStock.length < 1) {
			alert("���� �ݵ�� �Է��ϼž� �մϴ�.");
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">�� ŷ Ŭ �� �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookName" name="cookName" placeholder="��ŷŬ������">
		      
		    </div>
		  
		  </div>
		  
		    <div class="form-group">
		    <label for="cookDifficuty" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookDifficuty" name="cookDifficuty" placeholder="��ŷŬ�������̵�">
		      
		    </div>
		  
		  </div>
		  
		  <div class="form-group">
		    <label for="cookBrief" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookBrief" name="cookBrief" placeholder="��ŷŬ������������">
		    </div>
		  </div>
		  
		  <div class="form-group">
			    <label for="cookStock" class="col-sm-offset-1 col-sm-3 control-label">�����ο����</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="cookStock" name="cookStock" placeholder="�����ο����">
			    </div>
			  </div>
			  
		  <div class="form-group">
			    <label for="cookRecruit" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ���������ο�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="cookRecruit" name="cookRecruit" placeholder="��ŷŬ���������ο�">
			    </div>
			  </div>
		  
		  <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">�������۱Ⱓ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="aplstarTime"  name="aplstarTime" placeholder="�������۱Ⱓ">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">��������Ⱓ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="aplendTime"  name="aplendTime" placeholder="��������Ⱓ">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">�������۽ð�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="startTime"  name="startTime" placeholder="�������۽ð�">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">��������ð�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="endTime"  name="endTime" placeholder="��������ð�">
		    </div>
		  </div>
		  
		  	    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������ϳ�¥</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookRegdate"  name="cookRegdate" placeholder="��ŷŬ������ϳ�¥">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookPrice" name="cookPrice" placeholder="��ŷŬ��������">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�����̹���</label>
		    <div class="col-sm-4">
		     <input multiple="multiple" type="file" id="uploadfile" name="uploadfile"  >
		    
		    </div>
		  </div>
		  

		    <div class="form-group">
		    <label for="cookTheme" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�����׸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookTheme" name="cookTheme" placeholder="��ŷŬ�����׸�">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookLocation" name="cookLocation" placeholder="��ŷŬ�������">
		    </div>
		  </div>
		  
		   	  <div class="form-group">
		    <label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">1�п���</label>
		    <div class="col-sm-4">
		     <input multiple="multiple" type="file" id="uploadfile" name="uploadfile"  >
		    
		    </div>
		  </div>
		  
		  
		  
		  
		  
		
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>