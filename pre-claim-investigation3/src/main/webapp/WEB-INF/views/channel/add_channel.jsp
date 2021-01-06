<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl  = $this->config->item( 'base_url' );
?> -->
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Add Channel</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="<?php echo base_url(); ?>channels/pendinglist" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" id="add_channel_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="channelName">Channel Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Channel Name" id="channelName" maxlength="30" class="form-control" name="channelName">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="channelCode">Channel Code <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Channel Code" id="channelCode" maxlength="10" class="form-control username" name="channelCode">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addchannelsubmit" onClick="return addChannel();" type="button">Add Channel</button>
            <button class="btn btn-danger" type="reset" value="">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function addChannel() {
  var channelName = $( '#add_channel_form #channelName' ).val();
  var channelCode = $( '#add_channel_form #channelCode' ).val();
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
      var formdata = {csrf_test_name:csrf_hash,'channelName':channelName,'channelCode':channelCode};
      $.ajax({
        type: "POST",
        url: adminurl + 'channels/addChannel',
        data: formdata,
        beforeSend: function() { 
            $("#addchannelsubmit").html('<img src="'+adminurl+'${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
            $("#addchannelsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#addchannelsubmit").html('Add Channel');
            $("#addchannelsubmit").prop('disabled', false);
            toastr.success( 'Channel Added successfully.','Success' );
            $( '#add_channel_form #channelName' ).val('');
            $( '#add_channel_form #channelCode' ).val('');
          }else{
            toastr.error( data,'Error' );
            $("#addchannelsubmit").html('Add Channel');
            $("#addchannelsubmit").prop('disabled', false);
          }
        }
      });
  }   
}
</script>