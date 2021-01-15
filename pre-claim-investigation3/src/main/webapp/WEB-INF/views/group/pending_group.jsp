<%@page import="com.preclaim.models.GroupList"%>
<%@page import="java.util.List"%>
<%
List<GroupList> pending_list = (List<GroupList>) session.getAttribute("pending_group");
session.removeAttribute("pending_group");
GroupList group = (GroupList) session.getAttribute("group");
session.removeAttribute("group");
%>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="portlet box">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-users font-green-sharp"></i> 
					<span class="caption-subject font-green-sharp sbold">
						<%= group == null ? "Add " : "Update " %>
						Group
					</span>
				</div>
			</div>
		</div>
		<div class="portlet light bordered">
			<div class="portlet-body">
				<div id="message_account"></div>
				<form novalidate id="add_group_form" role="form" method="post"
					class="form-horizontal">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-4 control-label" for="groupName">Group
									Name <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="text" required placeholder="Group Name"
										id="groupName" class="form-control" name="groupName"
										value = "<%= group == null ? "" : group.getGroupName() %>">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<% if(group != null){ %>
									<input type="hidden" value="<%= group.getGroupId()%>" id="groupId"
										name="groupId">
									<button class="btn btn-info" id="editgroupsubmit"
										onClick="return updateGroup();" type="button">Update</button>
									<a href="${pageContext.request.contextPath}/group/pending_group"
										class="btn btn-danger">Back</a>
									<% }else{ %> 
									<button class="btn btn-info" id="addgroupsubmit"
										onClick="return addGroup();" type="button">Add Group</button>
									<button class="btn btn-danger" type="reset" value="">Clear</button>
									<% } %>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--<?php } ?>-->
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="portlet box">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-users font-green-sharp"></i> <span
						class="caption-subject font-green-sharp sbold">Pending
						Groups</span>
				</div>
				<div class="actions">
					<div class="btn-group">
						<a href="${pageContext.request.contextPath}/group/add_group"
							data-toggle="tooltip" title="Add" data-original-title="Add New"
							class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip"
							style="margin-right: 5px;"> <i class="fa fa-plus"></i>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="box box-primary">
			<div class="box-body">
				<div class="row">
					<div class="col-md-12 table-container">
						<div class="box-body no-padding">
							<table id="pending_group_list"
								class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
								<thead>
									<tr class="tbl_head_bg">
										<th class="head1 no-sort">#</th>
										<th class="head1 no-sort">Group Name</th>
										<th class="head1 no-sort">Created Date</th>
										<th class="head1 no-sort">Status</th>
										<th class="head1 no-sort">Action</th>
									</tr>
								</thead>
								<tfoot>
									<tr class="tbl_head_bg">
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort">Status</th>
										<th class="head2 no-sort"></th>
									</tr>
								</tfoot>
								<tbody>
									<%
									if (pending_list != null) {

										for (GroupList list_group : pending_list) {
									%>
									<tr>
										<td><%=list_group.getSrNo()%></td>
										<td><%=list_group.getGroupName()%></td>
										<td><%=list_group.getCreatedDate()%></td>										
										<td><span class="label label-sm label-danger">Pending</span></td>											
										<td>
											<a href="${pageContext.request.contextPath}/group/pending_group/
												<%=list_group.getGroupName() %>/<%=list_group.getGroupId() %>" 
												data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
												<i class="glyphicon glyphicon-edit"></i>
							   		  		</a>
									   		<a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateGroupStatus('<%=list_group.getGroupId()%>',1);" 
									   		  	class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i></a>
									   		<a href="#" data-toggle="tooltip" title="Delete" onClick="return deleteGroup('<%=list_group.getGroupId()%>');" 
									   		   	class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a>  
										</td>

									</tr>

									<%
										}
									}
									%>


								</tbody>
							</table>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- panel body -->
		</div>
	</div>
	<!-- content -->
</div>
<script type="text/javascript">
$(document).ready(function() 
{
	var i = 0;
	$('#pending_group_list tfoot th').each(function() {
		if (i == 1) {
			$(this).html('<input type="text" class="form-control" placeholder="" />');
		}
		i++;
	});
	
	// DataTable
	var table = $('#pending_group_list').DataTable();
	
	// Apply the search
	table.columns().every(function() {
		var that = this;
		$('input', this.footer()).on('keyup change',function() {
			if (that.search() !== this.value) {
				that.search(this.value)
						.draw();
			}
		});
		$('select', this.footer()).on('change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
	});
});

function addGroup() {
	
	var groupName = $('#add_group_form #groupName').val();
	if (groupName == '') {
		toastr.error('Group Name Cannot be empty', 'Error');
		return false;
	}
	var formdata = {'groupName' : groupName};
	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/group/addGroup',
		data : formdata,
		beforeSend : function() {
			$("#addgroupsubmit")
				.html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
			$("#addgroupsubmit").prop('disabled', true);
		},
		success : function(data) {
			if (data == "****") {
				$("#addgroupsubmit").html('Add Group');
				$("#addgroupsubmit").prop('disabled', false);
				toastr.success('Group Added successfully.','Success');
				$('#add_group_form #groupName').val('');
				location.reload();
			} else {
				toastr.error(data, 'Error');
				$("#addgroupsubmit").html('Add Group');
				$("#addgroupsubmit").prop('disabled', false);
			}
		}
	});
}

function updateGroup() {
	var groupName = $('#add_group_form #groupName').val();
	var groupId = $('#add_group_form #groupId').val();
	if (groupName == '') {
		toastr.error('Group Name Cannot be empty', 'Error');
		return false;
	}	
	var formdata = {'groupName' : groupName,'groupId' : groupId};
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/group/updateGroup',
			data : formdata,
			beforeSend : function() {
				$("#editgroupsubmit")
						.html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
				$("#editgroupsubmit").prop('disabled', true);
			},
			success : function(data) {
				if (data == "****") {
					$("#editgroupsubmit").html('Update');
					$("#editgroupsubmit").prop('disabled', false);
					toastr.success('Group Updated successfully.','Success');
					location.href ="${pageContext.request.contextPath}/group/pending_group";
				} else {
					toastr.error(data, 'Error');
					$("#editgroupsubmit").html('Update');
					$("#editgroupsubmit").prop('disabled', false);
				}
			}
		});
}
</script>