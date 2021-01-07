<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl  = $this->config->item( 'base_url' );
?>  -->
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add Region</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/region/pending_region" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" id="add_region_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="regionName">Region Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Region Name" id="regionName" class="form-control" name="regionName">
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addregionsubmit" onClick="return addRegion();" type="button">Add Region</button>
            <button class="btn btn-danger" type="reset">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function addRegion() {
  var regionName = $( '#add_region_form #regionName' ).val(); 
  if(regionName == ''){
    toastr.error('Region Name Cannot be empty','Error');
    return false;
  }
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  if(regionName){
      var formdata = {csrf_test_name:csrf_hash,'regionName':regionName};
      $.ajax({
        type: "POST",
        url: adminurl + 'regions/addRegion',
        data: formdata,
        beforeSend: function() { 
            $("#addregionsubmit").html('<img src="'+adminurl+'${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
            $("#addregionsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#addregionsubmit").html('Add Region');
            $("#addregionsubmit").prop('disabled', false);
            toastr.success( 'Region Added successfully.','Success' );
            $( '#add_region_form #regionName' ).val(''); 
          }else{
            toastr.error( data,'Error' );
            $("#addregionsubmit").html('Add Region');
            $("#addregionsubmit").prop('disabled', false);
          }
        }
      });
  }   
}
</script>