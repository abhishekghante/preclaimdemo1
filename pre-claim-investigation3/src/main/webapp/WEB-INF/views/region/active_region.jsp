<%@page import="com.preclaim.models.RegionList"%>
<%@page import="java.util.List"%>
<%
List<RegionList> active_region = (List<RegionList>) session.getAttribute("active_region");
session.removeAttribute("active_region");
%>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="portlet box">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-users font-green-sharp"></i> <span
						class="caption-subject font-green-sharp sbold">Active
						Regions</span>
				</div>
				<div class="actions">
					<div class="btn-group">
						<!--  <?php if( in_array( 'regions/add', $permission_arr ) ) { ?>
              <?php if($this->session->userdata(SYS_SESSION_ID) == SUPER_ADMIN_ID) { ?>  -->
						<a href="${pageContext.request.contextPath}/region/add_region"
							data-toggle="tooltip" title="Add"
							class="btn green-haze btn-outline btn-xs pull-right"
							data-toggle="tooltip" title="" style="margin-right: 5px;"
							data-original-title="Add New"> <i class="fa fa-plus"></i>
						</a>
						<!--   <?php } ?>
              <?php } ?>   -->
					</div>
				</div>
			</div>
		</div>

		<div class="box box-primary">
			<div class="box-body">
				<div class="row">
					<div class="col-md-12 table-container">
						<div class="box-body no-padding">
							<table id="active_region_list"
								class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
								<thead>
									<tr class="tbl_head_bg">
										<th class="head1 no-sort">#</th>
										<th class="head1 no-sort">Region Name</th>
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
									if (active_region != null) {
										for (RegionList list_region : active_region) {
									%>
									<tr>
									     <td><%=list_region.getSrNo() %></td>
									     <td><%=list_region.getRegionName() %></td>
									     <td><%=list_region.getCreatedDate() %></td>
									     <td><span class="label label-sm label-success">Active</span></td>
									     <td>
									     	<a href="${pageContext.request.contextPath}/region/pending_region/
										     	<%=list_region.getRegionName() %>/<%=list_region.getRegionId() %>" 
										     	data-toggle="tooltip" title="Edit" 
							     	    		class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-edit"></i></a>
									     	<a href="javascript:;" data-toggle="tooltip" title="Inactive" onClick="return updateRegionStatus('.$region->regionId.',1,2);" 
								     	     	class="btn btn-warning btn-xs"><i class="glyphicon glyphicon-ban-circle"></i></a>     
									     	<a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteRegion('<%=list_region.getRegionId()%>',1);" 
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
$(document).ready(function() {
	var i = 0;
	$('#active_region_list tfoot th').each(function() {
						
		if (i == 1) {
			$(this).html('<input type="text" class="form-control" placeholder="" />');
		}
		i++;
	});

	// DataTable
	var table = $('#active_region_list').DataTable();

	// Apply the search
	table.columns().every(function() {						
		var that = this;
		$('input', this.footer()).on('keyup change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
		$('select', this.footer()).on('change',function() {
			if (that.search() !== this.value) {
				that.search(this.value).draw();
			}
		});
	});
});
</script>