<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

	<div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li>Task Master</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Task List</h4>
						<div class="options">
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
					<input type="checkbox" class="form-check-input" onclick="inactiveData();" id="inActive"> <label class="form-check-label">Show Inactive List</label>
						<div class="table-responsive" id="tableId">
							<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
								<thead><tr><th>Dept ID</th><th>Name</th><th>Description</th><th>Status</th><th></th></tr></thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 		<a class="btn btn-info btn-lg"  onclick="PopupFillingStation();">Add Gas</a><br><br> -->
		<div class="row" id="moveTo">
			<div class="col-md-12 col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Add Task</h4>
					</div>
					<form:form class="form-horizontal" commandName="taskf" role="form" id="fillingstation-form" action="task" method="post">
					<div class="panel-body">
						<div class="row">
                    		<div class="col-md-6">
                    			<div class="form-group">
                    				<form:hidden path="id"/>
									<label for="focusedinput" class="col-md-6 control-label">Category  <span class="impColor">*</span></label>
									<form:select path="category" class="col-xs-10 col-sm-5 validate" onfocus="removeBorder(this.id)" >
											<form:option value="" label="--- Select ---" />
											<form:options items="${category}"/>
										</form:select>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Severity <span class="impColor">*</span></label>
									<div class="col-md-5">
										<form:select path="severity" class="col-xs-10 col-sm-5 validate" onfocus="removeBorder(this.id)">
										<form:option value="" label="--- Select ---" />
										 <form:options items="${severity}"/>
										</form:select>	
										<span class="hasError" id="stationnameError"></span>
								    </div>
                    			</div>
                    		</div>
                    		
                    		
                    	</div>
                    	<div class="row">
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Priority  <span class="impColor">*</span></label>
									<form:select path="priority" class="col-xs-10 col-sm-5 validate" >
											<form:option value="" label="--- Select ---" />
											<form:options items="${priority}"></form:options>
										</form:select>
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Assigned to <span class="impColor">*</span></label>
									<div class="col-md-5">
										<form:select path="assignto" class="col-xs-10 col-sm-5 validate" onfocus="removeBorder(this.id)">
											<form:option value="" label="--- Select ---" />
										 	<form:options items="${userNames}"/>
										</form:select>
										<span class="hasError" id="stationnameError"></span>
								    </div>
                    			</div>
                    		</div>
                    		
                    		
                    	</div>
                    	<div class="row">
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Summary  <span class="impColor">*</span></label>
									<form:input path="subject"  placeholder="Summary" class="col-xs-10 col-sm-5 validate" />
                    			</div>
                    		</div>
                    		<div class="col-md-6">
                    			<div class="form-group">
									<label for="focusedinput" class="col-md-6 control-label">Description <span class="impColor">*</span></label>
									<div class="col-md-5">
									<form:textarea path="description" class="form-control validate" placeholder="Enter Description"/>
									<span class="hasError" id="stationnameError"></span>
								    </div>
                    			</div>
                    		</div>
                    	</div>
                    	
                    	<div class="row">
                    		<div class="col-md-6">
                    		<div class="form-group">
                    		<label class="ace-file-input ace-file-multiple col-sm-3 control-label no-padding-right" >Attach File(s)</label>
									<div class="col-md-5">
										<input type="file" name="file" id="file" class="col-sm-9" multiple="multiple">
									</div>
                    		</div>
                    		</div>
                    		</div>
                    		
<!-- Modal Starts here-->
<!-- Modal Ends here-->

					</div>
					<div class="panel-footer">
				      	<div class="row">
				      		<div class="col-sm-12">
				      			<div class="btn-toolbar text-center">
					      			<input type="submit" id="submit1" value="Submit" class="btn-primary btn"/>
					      			<input type="reset" value="Reset" class="btn-danger btn cancel"/>
				      			</div>
				      		</div>
				      	</div>
			      	</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
			<!-- container -->


</body>
<%-- <script type='text/javascript' src='${baseurl }/js/custemValidation.js'></script>  --%>
<script>
</script>
<script type="text/javascript">

/* $(document).ready(function() {
	 var table = $('#example').DataTable();
	  
	 $('#example tbody').on('click', 'tr', function () {
	     var data = table.row( this ).data();
	     alert( 'You clicked on '+data[0]+'\'s row' );
	 } );
}); */


var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
}
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
			+ '<thead><tr><th>Id</th><th>Summary</th><th>Category</th><th>Severity</th><th>priority</th><th>Assigned</th><th>Attachment</th><th>CreatedTime</th><th>UpdatedTime</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactivate' onclick='deletetask("+ orderObj.id+ ",0)'><i class='fa fa-eye'></i></a>"
		}else{  
			var deleterow = "<a class='activate' onclick='deletetask("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
		}
		var edit = "<a class='edit editIt' onclick='editCylinder("	+ orderObj.id+ ")'><i class='fa fa-edit'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr>"
			+ "<td title='"+orderObj.id+"'>"+ orderObj.id + "</td>"
			+ "<td title='"+orderObj.subject+"'>"+ orderObj.subject + "</td>"
			+ "<td title='"+orderObj.category+"'>"+ orderObj.category + "</td>"
			+ "<td title='"+orderObj.severity+"'>"+ orderObj.severity + "</td>"
			+ "<td title='"+orderObj.priority+"'>"+ orderObj.priority + "</td>"
			+ "<td title='"+orderObj.assignto+"'>"+ orderObj.assignto + "</td>"
			+ "<td title='"+orderObj.uploadfile+"'>"+ orderObj.uploadfile + "</td>"
			+ "<td title='"+orderObj.createdTime+"'>"+ orderObj.createdTime + "</td>"
			+ "<td title='"+orderObj.updatedTime+"'>"+ orderObj.updatedTime + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>" 
			+ "</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isClick=='Yes') $('.datatables').dataTable();
	
}


function editCylinder(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#subject").val(serviceUnitArray[id].subject);
	$("#category").val(serviceUnitArray[id].categoryid);
	$("#severity").val(serviceUnitArray[id].severityid);
	$("#priority").val(serviceUnitArray[id].priorityid);
	$("#assignto").val(serviceUnitArray[id].assigntoid);
	$("#uploadfile").val(serviceUnitArray[id].uploadfile);
	$("#description").val(serviceUnitArray[id].description);
	$("#submit1").val("Update");
	$(window).scrollTop($('#moveTo').offset().top);
}

function deletetask(id,status){
	var checkstr=null;
	if(status == 0){
		 checkstr = confirm('Are you sure you want to Deactivate?');
	}else{
		 checkstr = confirm('Are you sure you want to Activate?');
	}
	if(checkstr == true){
		var formData = new FormData();
	    formData.append('id', id);
	    formData.append('status', status);
		$.fn.makeMultipartRequest('POST', 'deleteTask', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			window.location.reload();
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
		});
	}
}

function validate(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).css('color','#cc0000');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style your-class');
//			$('#'+id).css('color','#cc0000');
//			$('#'+id+'Error').text(errorMessage);
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style your-class');
//			$('#'+id).css('color','');
//			$('#'+id+'Error').text("");
	}
	
}

function inactiveData() {
	var status="0";
	if($('#inActive').is(":checked") == true){
		status="0";
	}else{
		status="1";
	}
		var formData = new FormData();
		formData.append('status', status);
		
		$.fn.makeMultipartRequest('POST', 'inActiveFillingStation', false,
				formData, false, 'text', function(data) {
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.allOrders1;
			displayTable(alldata);
			console.log(jsonobj.allOrders1);
				});
		
}
$("#pageName").text("Task Master");
$(".task").addClass("active"); 
</script>