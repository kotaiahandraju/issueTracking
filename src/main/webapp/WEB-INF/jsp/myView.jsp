<!-- Body starts here -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script> -->
<!-- Body starts here -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li class="">Dashboard</li>
				</ul><!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
			
				<div class="row">
							<div class="col-md-7">
							<div id="assigned" class="widget-box widget-color-blue2">
	<div class="widget-header widget-header-small">
		<h4 class="widget-title lighter">
			<i class="ace-icon fa fa-list-alt"></i>
<a class="white" href="#">Assigned to Me (Unresolved)</a> </h4>
		<div class="widget-toolbar">
			<a data-action="collapse" href="#">
				<i class="1 ace-icon fa bigger-125 fa-chevron-up"></i>
			</a>
		</div>
		<div class="widget-toolbar no-border hidden-xs">
			<div class="widget-menu">
				<a class="btn btn-primary btn-white btn-round btn-sm" href="viewReportIssues">View Tickets</a>			</div>
		</div>
	</div>

	<div  class="widget-body" style="display: block;max-height:300px;overflow:auto;">
		<div class="widget-main no-padding">
			<div class="table-responsive">
				<table class="table table-bordered table-condensed table-striped table-hover">
<tbody>
<c:forEach var="issue" items="${assignToMe}">

<tr class="my-buglist-bug ">
		<td class="nowrap width-13">
		    <form action="viewTicket?id=${issue.id}" method="post">
            <button type="submit"  class="btn-link">${issue.id}</button>
            </form>
			
			<div style="display: -webkit-inline-box;">
			<i class="fa fa-square fa-status-box ${issue.kstatus}" title="${issue.assignto}"></i>
			<form action="editIssue?id=${issue.id}&pgn=2" method="post">
            <button type="submit" title="Edit" class="btn-link fa fa-pencil  bigger-130 padding-2 grey"></button>
            </form>
			<%-- <a class="edit"   href="editIssue?id=${issue.id}&pgn=2"><i class="fa fa-pencil bigger-130 padding-2 grey"></i></a> --%>
			<i class="fa fa-minus fa-lg ${issue.severity}"  title= "${issue.priority}"></i>
			<c:if test="${not empty issue.uploadfile}">
			    <c:forTokens items="${issue.uploadfile}" delims="*" var="mySplit">
			<a class="attachments" target="_blank" href="reportDocuments/${mySplit}"><i class="fa fa-paperclip fa-lg grey" title="${mySplit}"></i></a>
		    </c:forTokens>
		   </c:if>
			</div>
		</td>
        <td>
		<span><b>${issue.subject}</b></span>
		<br>
		<span class="small"> (${issue.category}) - ${issue.createdTime}</span>
        </td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>
</div>	

<div class="space-10"></div>
<div class="space-10"></div>


<div id="assigned" class="widget-box widget-color-blue2">
	<div class="widget-header widget-header-small">
		<h4 class="widget-title lighter">
			<i class="ace-icon fa fa-list-alt"></i>
<a class="white" href="#"> Reported by Me</a> </h4>
		<div class="widget-toolbar">
			<a data-action="collapse" href="#">
				<i class="1 ace-icon fa bigger-125 fa-chevron-up"></i>
			</a>
		</div>
		<div class="widget-toolbar no-border hidden-xs">
			<div class="widget-menu">
				<a class="btn btn-primary btn-white btn-round btn-sm" href="viewReportIssues">View Tickets</a>			</div>
		</div>
	</div>

	<div style="display: block;max-height:300px;overflow:auto;" class="widget-body">
		<div class="widget-main no-padding">
			<div class="table-responsive">
				<table class="table table-bordered table-condensed table-striped table-hover">
<tbody>
<c:forEach var="issue" items="${reportedByMe}">
<tr class="my-buglist-bug ">
		<td class="nowrap width-13">
		    <form action="viewTicket?id=${issue.id}" method="post">
            <button type="submit" class="btn-link">${issue.id}</button>
            </form>
            <div style="display: -webkit-inline-box;">
			<i class="fa fa-square fa-status-box ${issue.kstatus}" title="${issue.assignby}"></i>
			<form action="editIssue?id=${issue.id}&pgn=2" method="post">
            <button type="submit" title="Edit" class="btn-link fa fa-pencil  bigger-130 padding-2 grey"></button>
            </form>
			<%-- <a class="edit"   href="editIssue?id=${issue.id}&pgn=2"><i class="fa fa-pencil bigger-130 padding-2 grey"></i></a> --%>
			<i class="fa fa-minus fa-lg ${issue.severity}" title="${issue.priority}"  ></i>
			<c:if test="${not empty issue.uploadfile}">
			    <c:forTokens items="${issue.uploadfile}" delims="*" var="mySplit">
			<a class="attachments" target="_blank" href="reportDocuments/${mySplit}"><i class="fa fa-paperclip fa-lg grey" title="${mySplit}"></i></a>
		    </c:forTokens>
		   </c:if>
		</div>
		</td>
        <td>
		<span><b>${issue.subject}</b></span>
		<br>
		<span class="small"> (${issue.category}) - ${issue.createdTime}</span>
        </td>
</tr>
</c:forEach>


</tbody>
</table>
</div>
</div>
</div>
</div>

<div class="space-10"></div>


<div id="assigned" class="widget-box widget-color-blue2">
	<div class="widget-header widget-header-small">
		<h4 class="widget-title lighter">
			<i class="ace-icon fa fa-list-alt"></i>
<a class="white" href="#"> Resolved</a> 	</h4>
		<div class="widget-toolbar">
			<a data-action="collapse" href="#">
				<i class="1 ace-icon fa bigger-125 fa-chevron-up"></i>
			</a>
		</div>
		<div class="widget-toolbar no-border hidden-xs">
			<div class="widget-menu">
				<a class="btn btn-primary btn-white btn-round btn-sm" href="viewReportIssues">View Tickets</a>			</div>
		</div>
	</div>

	<div style="display: block;max-height:300px;overflow:auto;" class="widget-body">
		<div class="widget-main no-padding">
			<div class="table-responsive">
				<table class="table table-bordered table-condensed table-striped table-hover">
<tbody>

<c:forEach var="issue" items="${assignToMeResolved}">
<tr class="my-buglist-bug ">
		<td class="nowrap width-13">
		    <form action="viewTicket?id=${issue.id}" method="post">
            <button type="submit"  class="btn-link">${issue.id}</button>
            </form>
            <div style="display: -webkit-inline-box;">
			<i class="fa fa-square fa-status-box ${issue.kstatus}" title="${issue.assignto}"></i>
			<%-- <form action="editIssue?id=${issue.id}&pgn=2" method="post">
            <button type="submit" title="Edit" class="btn-link fa fa-pencil  bigger-130 padding-2 grey"></button>
            </form> --%>
			<i class="fa fa-minus fa-lg ${issue.severity}" title="${issue.priority}"  ></i>
			<c:if test="${not empty issue.uploadfile}">
			    <c:forTokens items="${issue.uploadfile}" delims="*" var="mySplit">
			<a class="attachments" target="_blank" href="reportDocuments/${mySplit}"><i class="fa fa-paperclip fa-lg grey" title="${mySplit}"></i></a>
		    </c:forTokens>
		   </c:if>
		</div>
		</td>
        
        <td>
		<span><b>${issue.subject}</b></span>
		<br>
		<span class="small"> (${issue.category}) - ${issue.createdTime}</span>
        </td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>
</div>

<div class="space-10"></div>


<div id="assigned" class="widget-box widget-color-blue2">
	<div class="widget-header widget-header-small">
		<h4 class="widget-title lighter">
			<i class="ace-icon fa fa-list-alt"></i>
<a class="white" href="#"> Recently Closed (30 Days)</a> 		</h4>
		<div class="widget-toolbar">
			<a data-action="collapse" href="">
				<i class="1 ace-icon fa bigger-125 fa-chevron-up"></i>
			</a>
		</div>
		<div class="widget-toolbar no-border hidden-xs">
			<div class="widget-menu">
				<a class="btn btn-primary btn-white btn-round btn-sm" href="viewReportIssues">View Tickets</a>			</div>
		</div>
	</div>

	<div style="display: block;max-height:300px;overflow:auto;" class="widget-body">
		<div class="widget-main no-padding">
			<div class="table-responsive">
				<table class="table table-bordered table-condensed table-striped table-hover">
<tbody>

<c:forEach var="issue" items="${recentlyModified}">
<tr class="my-buglist-bug ">
		<td class="nowrap width-13">
		    <form action="viewTicket?id=${issue.id}" method="post">
            <button type="submit" class="btn-link">${issue.id}</button>
            </form>
            <div style="display: -webkit-inline-box;">
			<i class="fa fa-square fa-status-box ${issue.kstatus}" title="${issue.assignby}"></i>
			<i class="fa fa-minus fa-lg ${issue.severity}" title="${issue.priority}"  ></i>
			<c:if test="${not empty issue.uploadfile}">
			    <c:forTokens items="${issue.uploadfile}" delims="*" var="mySplit">
			<a class="attachments" target="_blank" href="reportDocuments/${mySplit}"><i class="fa fa-paperclip fa-lg grey" title="${mySplit}"></i></a>
		    </c:forTokens>
		   </c:if>
	</div>
		</td>
        <td>
		<span><b>${issue.subject}</b></span>
		<br>
		<span class="small"> (${issue.category}) - ${issue.createdTime}</span>
        </td>
</tr>
</c:forEach>



</tbody>
</table>
</div>
</div>
</div>
</div>

<div class="space-10"></div>


<div id="assigned" class="widget-box widget-color-blue2">
	<div class="widget-header widget-header-small">
		<h4 class="widget-title lighter">
			<i class="ace-icon fa fa-list-alt"></i>
<a class="white" href="#"> Monitored by Me</a> 		</h4>
		<div class="widget-toolbar">
			<a data-action="collapse" href="#">
				<i class="1 ace-icon fa bigger-125 fa-chevron-up"></i>
			</a>
		</div>
		<div class="widget-toolbar no-border hidden-xs">
			<div class="widget-menu">
				<a class="btn btn-primary btn-white btn-round btn-sm" href="viewReportIssues">View Tickets</a>			</div>
		</div>
	</div>

	<div style="display: block;max-height:300px;overflow:auto;" class="widget-body">
		<div class="widget-main no-padding">
			<div class="table-responsive">
				<table class="table table-bordered table-condensed table-striped table-hover">
<tbody>
<c:forEach var="issue" items="${monitoryBy}">

<tr class="my-buglist-bug ">
		<td class="nowrap width-13">
		    <form action="viewTicket?id=${issue.id}" method="post">
            <button type="submit"  class="btn-link">${issue.id}</button>
            </form>
            <div style="display: -webkit-inline-box;">
			<i class="fa fa-square fa-status-box ${issue.kstatus}" title="${issue.assignto}"></i>
			<form action="editIssue?id=${issue.id}&pgn=2" method="post">
            <button type="submit" title="Edit" class="btn-link fa fa-pencil  bigger-130 padding-2 grey"></button>
            </form>
			<%-- <a class="edit"   href="editIssue?id=${issue.id}&pgn=2"><i class="fa fa-pencil bigger-130 padding-2 grey"></i></a> --%>
			<i class="fa fa-minus fa-lg ${issue.severity}" title="${issue.priority}"  ></i>
			<c:if test="${not empty issue.uploadfile}">
			    <c:forTokens items="${issue.uploadfile}" delims="*" var="mySplit">
			<a class="attachments" target="_blank" href="reportDocuments/${mySplit}"><i class="fa fa-paperclip fa-lg grey" title="${mySplit}"></i></a>
		    </c:forTokens>
		   </c:if>
		</div>
		</td>
        
        <td>
		<span><b>${issue.subject}</b></span>
		<br>
		<span class="small"> (${issue.category}) - ${issue.createdTime}</span>
        </td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</div>
</div>
</div><!-- /.col -->

<div class="col-md-5">
							<div id="assigned" class="widget-box widget-color-blue2">
	<div class="widget-header widget-header-small">
		<h4 class="widget-title lighter">
			<i class="ace-icon fa fa-clock-o"></i>
<a class="white" href="#"> Timeline</a></h4>
		<div class="widget-toolbar">
			<a data-action="collapse" href="#">
				<i class="1 ace-icon fa bigger-125 fa-chevron-up"></i>
			</a>
		</div>
		<div class="widget-toolbar no-border hidden-xs">
			
		</div>
	</div>

	<div style="display: block;" class="widget-body">
		<div class="widget-main no-padding">
			<div class="table-responsive">
				<table class="table table-bordered table-condensed table-striped table-hover">
<tbody>

<tr class="my-buglist-bug ">
			<tr>
                    		<th>By Date(days)</th>
                    		<th>Open</th>
                    		<th>Closed</th>
                    		<th>Balanced</th>
                    			
                    	</tr>
<c:forEach var="issue" items="${gapAndCount}">
       
<tr class="my-buglist-bug ">
		<td class="nowrap width-13">${issue.key} 
		</td>
		 <c:forEach items="${issue.value}" var="entry">
		<td>
		${entry}
        </td>
        </c:forEach> 
    
</tr>

</c:forEach>
                      </table>
        
       
</div>
</div>



						</div><!-- /.row -->
					</div><!-- /.page-content -->
				<div class="space-10"></div>
							<div id="assigned" class="widget-box widget-color-blue2">
	<div class="widget-header widget-header-small">
		<h4 class="widget-title lighter">
			<i class="ace-icon fa fa-clock-o"></i>
<a class="white" href="#"> Status Wise Summary</a></h4>
		<div class="widget-toolbar">
			<a data-action="collapse" href="#">
				<i class="1 ace-icon fa bigger-125 fa-chevron-up"></i>
			</a>
		</div>
		<div class="widget-toolbar no-border hidden-xs">
			
		</div>
	</div>

	<div style="display: block;" class="widget-body">
		<div class="widget-main no-padding">
			<div class="table-responsive">
				<table class="table table-bordered table-condensed table-striped table-hover">
<tbody>

<tr class="my-buglist-bug ">
			<tr>
                    		<th>By Status(days)</th>
                    		<th>Total</th>
                    	</tr>
<c:forEach var="issue" items="${statusCount}">
<tr class="my-buglist-bug ">
		<td class="nowrap width-13">${issue.key} 
		</td>
		<td class="nowrap width-13">${issue.value} 
		</td>
</tr>
</c:forEach>
</table>
</div>
</div>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
			</div>
				</div>
							</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content-inner -->
	</div>

<script type="text/javascript">
$(".myView").addClass("active");
$(document).ready(function(){
$('.myView').on('click', function(){
	console.log("write your code hee") 
	console.log("cacheUserBean") 
});
});

</script>