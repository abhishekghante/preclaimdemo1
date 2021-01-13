<%@page import="com.preclaim.models.GroupList"%>
<%@page import="java.util.List"%>
<%
List<GroupList>active_list=(List<GroupList>)session.getAttribute("active_list");
session.removeAttribute("active_list");
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
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Active Groups</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/group/add_group" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
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
                  <table id="active_group_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
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
                    if(active_list!=null){
                    	
                    	for(GroupList list_group : active_list){
                         %>
                    		<tr>
                    			<td><%=list_group.getSrNo() %></td>
                    		    <td><%=list_group.getGroupName() %></td>
                    		    <td><%=list_group.getCreatedDate() %></td>
                    		    <td><span class="label label-sm label-success">Active</span></td>
                    		    <td>
                    		         <a href="${pageContext.request.contextPath}/group/pending_group/
                    		         	<%=list_group.getGroupName() %>/<%=list_group.getGroupId() %>" 
                    		         	data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
                    		         	<i class="glyphicon glyphicon-edit"></i>
                   		         	</a>
                    		         <a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateGroupStatus('<%=list_group.getGroupId() %>',1,1);" 
                    		             class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i>
                   		             </a>
                    		         <a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteGroup('<%=list_group.getGroupId() %>');" 
                    		             class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i>
                   		             </a>
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
      </div><!-- panel body -->
    </div>
  </div><!-- content -->
</div>
<script type="text/javascript">
$(document).ready(function() {
  var i = 0;
  $('#active_group_list tfoot th').each( function () {
    if( i == 1 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#active_group_list').DataTable();

  // Apply the search
  table.columns().every( function () {
    var that = this;
    $( 'input', this.footer() ).on( 'keyup change', function () {
      if ( that.search() !== this.value ) {
        that.search( this.value ).draw();
      }
    });
    $( 'select', this.footer() ).on( 'change', function () {
      if ( that.search() !== this.value ) {
        that.search( this.value ).draw();
      }
    });
  });
});
</script>