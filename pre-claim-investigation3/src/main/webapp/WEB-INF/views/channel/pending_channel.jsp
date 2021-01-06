<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl   = $this->config->item( 'base_url' );
global $permission_arr;
if($channelInfo){
  $channelName = $channelInfo->channelName;
  $channelCode = $channelInfo->channelCode;
}else{
  $channelName = '';
  $channelCode = '';
}
?> -->
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<?php if( in_array( 'channels/add', $permission_arr ) ) { ?>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold"><?= (($channelId)?'Update':'Add'); ?> Channel</span>
        </div>
      </div>
    </div>
    <div class="portlet light bordered">
      <div class="portlet-body">
        <div id="message_account"></div>
        <form novalidate="" id="add_channel_form" role="form" method="post" class="form-horizontal">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="channelName">Channel Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" value="<?= $channelName; ?>" id="channelName" name="channelName" maxlength="40" class="form-control" placeholder="Channel Name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="channelCode">Channel Code <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" value="<?= $channelCode; ?>" id="channelCode" name="channelCode" maxlength="10" class="form-control username" placeholder="Channel Code">
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-4 col-md-8">
                <!-- <?php
                  if($channelId){ ?>  -->  
                    <input type="hidden" value="<?= $channelId; ?>" id="channelId" name="channelId">
                    <button class="btn btn-info" id="editchannelsubmit" onClick="return updateChannel();" type="button">Update</button>
                    <a href="<?= base_url(); ?>channels/pendinglist" class="btn btn-danger" value="">Back</a>
                  <!-- <?php }else{ ?> --> 
                    <button class="btn btn-info" id="addchannelsubmit" onClick="return addChannel();" type="button">Add Channel</button>
                    <button class="btn btn-danger" type="reset" value="">Clear</button>
                  <!-- <?php } ?> --> 
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
 <!--<?php } ?> --> 
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Pending Channels</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <!--<?php if( in_array( 'channels/add', $permission_arr ) ) { ?> -->
             <!-- <?php if($this->session->userdata(SYS_SESSION_ID) == SUPER_ADMIN_ID) { ?> -->
              <a href="<?php echo base_url(); ?>channels/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
            <!--  <?php } ?>--> 
             <!-- <?php } ?>--> 
            </div>
        </div>
      </div>
    </div>

    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="pending_channel_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="head1 no-sort">#</th>
                        <th class="head1 no-sort">Channel Name</th>
                        <th class="head1 no-sort">Channel Code</th>
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
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort"></th>
                      </tr>
                    </tfoot>
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
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  table = $('#pending_channel_list').DataTable({
      language: {
        processing: "<img src='$pageContext.request.contextPath/resources/img/loading.gif'>",
      },
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      'autoWidth': false,
      "ajax": {
          "data": function(d) {
            d.csrf_test_name = csrf_hash;
          },
          "url": "<?php echo site_url('/channels/pendingChannelTableResponse')?>",
          "type": "POST"
      },
      "dom": "B lrt<'row' <'col-sm-5' i><'col-sm-7' p>>",
      "lengthMenu": [[10, 25, 50, 100, 1000, -1], [10, 25, 50, 100, 1000, "All"]],
      //Set column definition initialisation properties.
      "columnDefs": [{
          "targets": [0,5],
          "orderable": false, //set not orderable
      },
      {
          "targets": [0,5],
          "searchable": false, //set orderable
      } ],
      buttons: []
  });
  var i = 0;
  $('#pending_channel_list tfoot th').each( function () {
    if( i == 1 || i == 2 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#pending_channel_list').DataTable();

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
function addChannel() {
  var table2      = $('#pending_channel_list').DataTable();
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
            $("#addchannelsubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#addchannelsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#addchannelsubmit").html('Add Channel');
            $("#addchannelsubmit").prop('disabled', false);
            toastr.success( 'Channel Added successfully.','Success' );
            $( '#add_channel_form #channelName' ).val('');
            $( '#add_channel_form #channelCode' ).val('');
            table2.ajax.reload();
          }else{
            toastr.error( data,'Error' );
            $("#addchannelsubmit").html('Add Channel');
            $("#addchannelsubmit").prop('disabled', false);
          }
        }
      });
  }   
}
function updateChannel() {
  var table2      = $('#pending_channel_list').DataTable();
  var channelName = $( '#add_channel_form #channelName' ).val();
  var channelId   = $( '#add_channel_form #channelId' ).val();
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
      var formdata = {csrf_test_name:csrf_hash,'channelName':channelName,'channelCode':channelCode,'channelId':channelId};
      $.ajax({
        type: "POST",
        url: adminurl + 'channels/updateChannel',
        data: formdata,
        beforeSend: function() { 
            $("#editchannelsubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#editchannelsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#editchannelsubmit").html('Update');
            $("#editchannelsubmit").prop('disabled', false);
            toastr.success( 'Channel Updated successfully.','Success' );
            table2.ajax.reload();
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