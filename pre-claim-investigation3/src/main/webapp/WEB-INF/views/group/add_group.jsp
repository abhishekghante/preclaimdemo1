<%@page import="java.util.List"%>
<%
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
%>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add Group</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/group/pending_group" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" id="add_group_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="groupName">Group Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Group Name" id="groupName" class="form-control" name="groupName">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addgroupsubmit" onClick="return addGroup();" type="button">Add Group</button>
            <button class="btn btn-danger" type="reset" value="">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function addGroup() {
	<%if(!user_permission.contains("groups/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>

	var groupName = $( '#add_group_form #groupName' ).val(); 
	if(groupName == ''){
	  toastr.error('Group Name Cannot be empty','Error');
	  return false;
	}
	var formdata ={'groupName':groupName};
	$.ajax({
	  type: "POST",
	  url: 'addGroup',
	  data: formdata,
	  beforeSend: function() { 
	      $("#addgroupsubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
	      $("#addgroupsubmit").prop('disabled', true);
	  },
	  success: function( data ) {
	    if(data == "****"){
	      $("#addgroupsubmit").html('Add Group');
	      $("#addgroupsubmit").prop('disabled', false);
	      toastr.success( 'Group Added successfully.','Success' );
	      $( '#add_group_form #groupName' ).val(''); 
	      /*setTimeout( function() {
	        window.location.href = adminurl + 'groups';
	      }, 2000 );*/
	    }else{
	      toastr.error( data,'Error' );
	      $("#addgroupsubmit").html('Add Group');
	      $("#addgroupsubmit").prop('disabled', false);
	    }
	  }
	});
     
}
</script>