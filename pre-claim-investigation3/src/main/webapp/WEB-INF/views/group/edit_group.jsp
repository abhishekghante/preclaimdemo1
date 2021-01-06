<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl       = $this->config->item( 'base_url' );
if($groupInfo){
  $groupName = $groupInfo->groupName;
}else{
  $groupName  = '';
}
?> -->
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
            <a href="<?= base_url(); ?>groups/pendinglist" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" id="edit_group_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="groupName">Group Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Group Name" value="<?= $groupName; ?>" id="groupName" class="form-control" name="groupName">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <input type="hidden" value="<?= $groupId; ?>" id="groupId" name="groupId">
            <button class="btn btn-info" id="editgroupsubmit" onClick="return updateGroup();" type="button">Update</button>
            <a href="<?= base_url(); ?>groups/pendinglist" class="btn btn-danger" value="">Back</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function updateGroup() {
  var groupName = $( '#edit_group_form #groupName' ).val();
  var groupId   = $( '#edit_group_form #groupId' ).val();
  if(groupName == ''){
    toastr.error('Group Name Cannot be empty','Error');
    return false;
  }
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  if(groupName){
      var formdata = {csrf_test_name:csrf_hash,'groupName':groupName,'groupId':groupId};
      $.ajax({
        type: "POST",
        url: adminurl + 'groups/updateGroup',
        data: formdata,
        beforeSend: function() { 
            $("#editgroupsubmit").html('<img src="'+adminurl+'${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
            $("#editgroupsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#editgroupsubmit").html('Update');
            $("#editgroupsubmit").prop('disabled', false);
            toastr.success( 'Group Updated successfully.','Success' );
          }else{
            toastr.error( data,'Error' );
            $("#editgroupsubmit").html('Update');
            $("#editgroupsubmit").prop('disabled', false);
          }
        }
      });
  }   
}
</script>