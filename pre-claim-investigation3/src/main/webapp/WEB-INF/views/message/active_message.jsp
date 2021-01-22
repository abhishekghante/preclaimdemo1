<%@page import="java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%@page import="com.preclaim.models.CaseDetailList"%>
<%@page import = "com.preclaim.models.Region" %>
<%@page import = "com.preclaim.models.IntimationType" %>
<%@page import = "com.preclaim.models.Channel" %>

<%
List<String>user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("messages/status");
boolean allow_delete = user_permission.contains("messages/delete");
List<CaseDetailList> activeCaseDetailList = (List<CaseDetailList>)session.getAttribute("activeCaseDetailList");
session.removeAttribute("activeCaseDetailList");
List<Region> regionList = (List<Region>) session.getAttribute("region_list");
List<IntimationType> groupList = (List<IntimationType>) session.getAttribute("group_list");
List<Channel> channelList = (List<Channel>) session.getAttribute("channel_list");
if(regionList == null)
	regionList = new ArrayList<Region>();
if(groupList == null)
	groupList = new ArrayList<IntimationType>();
if(channelList == null)
	channelList = new ArrayList<Channel>();
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
            <span class="caption-subject font-green-sharp sbold">Case Lists</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/messages/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
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
                  <div class="table-responsive">
                    <table id="active_message_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                      <thead>
                        <tr class="tbl_head_bg">
                          <th class="head1 no-sort">Case ID</th>
                          <th class="head1 no-sort">Policy No</th>
                          <th class="head1 no-sort">Name of Insured</th>
                          <th class="head1 no-sort">Type of Investigation</th>
                          <th class="head1 no-sort">Zone</th>
                          <th class="head1 no-sort">Sum Assured</th>
                          <th class="head1 no-sort">Type of Intimation</th>
                          <th class="head1 no-sort">View history</th>
                          <th class="head1 no-sort">Status</th>
                          <th class="head1 no-sort">Action</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr class="tbl_head_bg">
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head1 no-sort"></th>
                        </tr>
                      </tfoot>
                      <tbody>
                      <%if(activeCaseDetailList!=null){
                        	for(CaseDetailList list_case :activeCaseDetailList){%>                       
                           <tr>
 								<td><%=list_case.getSrNo()%></td>
                  				<td><%=list_case.getPolicyNumber()%></td>
                  				<td><%=list_case.getInsuredName()%></td>
                  				<td><%=list_case.getInvestigationCategory()%></td>
                  				<td><%=list_case.getClaimantZone()%></td>
                                <td><%=list_case.getSumAssured()%></td>
                                <td></td>
                                <td></td>
                                <td><span class="label label-sm label-success">Active</span></td>                        
                                <td>
                                	<a href="'.base_url().'messages/edit/'.$message->msgId.'" data-toggle="tooltip" title="Edit" 
                                        class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-edit"></i>
                               		</a>
                                
                              
                               	    <a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateMessageStatus('.$message->msgId.',1,1);" 
                                		class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i>
                                	</a>
                                
                                
                                	<a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteMessage('<%=list_case.getCaseId() %>',<%=allow_statusChg%>);" 
                                		class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i>
                                	</a>
                                
                                
                              </td>
                          
                          
                          </tr>
                      
                      <% 		
                       	}
                        } 
                       %>
                      </tbody>
                      <tbody>
                      </tbody>
                    </table>
                  </div>
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
	// DataTable
	var table = $('#active_message_list').DataTable();

	var i = 0;
	$('#active_message_list tfoot th').each( function () {
    if( i == 1 || i == 2 || i == 12 )
    {
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    else if(i == 5)
    {
      var cat_selectbox = '<select name="category" id="category" class="form-control">'
                              +'<option value="">All</option>';
      
      cat_selectbox += '</select>';
      $(this).html( cat_selectbox );
    }
    else if(i == 6)
    {     
    	var channelBox = '<select name="channel" id="channel" class="form-control">'
                              +'<option value="">All</option>';     
      	<%for(Channel channel : channelList) {%>                      		
      		channelBox += '<option value = "<%= channel.getChannelCode()%>"><%= channel.getChannelName()%></option>';
        <%} %>
       	channelBox += '</select>';
        $(this).html( channelBox );
    }
    i++;
  });
  
  // Apply the search
  table.columns().every( function () {
    var that = this;
    $( 'input', this.footer() ).on( 'keyup change', function () {
      if ( that.search() !== this.value ) {
        that
          .search( this.value )
          .draw();
      }
    });
    $( 'select', this.footer() ).on( 'change', function () {
      if ( that.search() !== this.value ) {
        that
          .search( this.value )
          .draw();
      }
    });
  });
});

function assignSupervisor(){
  $("#testmodal").modal('show');
}
function assignInvestigator(){
  $('#testmodal2').modal('show');
}
</script>

<div id="testmodal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Assign Supervisor</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                  <div class="form-group">
                      <label class="col-md-3 control-label">Select Supervisor</label>
                      <div class="col-md-9">
                          <select class="form-control">
                              <option>Ram Kumar</option>
                              <option>Suresh</option>
                              <option>Rahul</option>
                          </select>
                      </div>
                  </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div id="testmodal2" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Assign Investigator</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                  <div class="form-group">
                      <label class="col-md-3 control-label">Select Investigator</label>
                      <div class="col-md-9">
                          <select class="form-control">
                              <option>Ram Kumar</option>
                              <option>Suresh</option>
                              <option>Rahul</option>
                          </select>
                      </div>
                  </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>