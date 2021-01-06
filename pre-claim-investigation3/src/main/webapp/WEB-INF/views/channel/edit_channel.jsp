<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl = $this->config->item( 'base_url' );
if($channelInfo){
  $channelName = $channelInfo->channelName;
  $channelCode = $channelInfo->channelCode;
}else{
  $channelName = '';
  $channelCode = '';
}
?> -->
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Edit Chennal</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="<?= base_url(); ?>channels/pendinglist" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" id="edit_channel_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="channelName">Channel Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Channel Name" value="<?= $channelName; ?>" id="channelName" maxlength="30" class="form-control" name="channelName">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="channelCode">Channel Code <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Channel Code" value="<?= $channelCode; ?>" id="channelCode" maxlength="10" class="form-control username" name="channelCode">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <input type="hidden" value="<?= $channelId; ?>" id="channelId" name="channelId">
            <button class="btn btn-info" id="editchannelsubmit" onClick="return updateChannel();" type="button">Update</button>
            <a href="<?= base_url(); ?>channels/pendinglist" class="btn btn-danger" value="">Back</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function updateChannel() {
  var channelName = $( '#edit_channel_form #channelName' ).val();
  var channelId   = $( '#edit_channel_form #channelId' ).val();
  var channelCode = $( '#edit_channel_form #channelCode' ).val();
  if(channelName == ''){
    toastr.error('Channel Name Cannot be empty','Error');
    return false;
  }
  if(channelCode == ''){
    toastr.error('Channel Code Cannot be empty','Error');
    return false;
  }
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  if(channelName && channelCode){
      var formdata = {csrf_test_name:csrf_hash,'channelName':channelName,'channelCode':channelCode,'channelId':channelId};
      $.ajax({
        type: "POST",
        url: adminurl + 'channels/updateChannel',
        data: formdata,
        beforeSend: function() { 
            $("#editchannelsubmit").html('<img src="'+adminurl+'${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
            $("#editchannelsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#editchannelsubmit").html('Update');
            $("#editchannelsubmit").prop('disabled', false);
            toastr.success( 'Channel Updated successfully.','Success' );
          }else{
            toastr.error( data,'Error' );
            $("#editchannelsubmit").html('Update');
            $("#editchannelsubmit").prop('disabled', false);
          }
        }
      });
  }   
}
</script>