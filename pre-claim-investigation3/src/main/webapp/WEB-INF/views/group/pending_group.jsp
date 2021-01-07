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
          <span class="caption-subject font-green-sharp sbold">Group</span>
        </div>
      </div>
    </div>
    <div class="portlet light bordered">
      <div class="portlet-body">
        <div id="message_account"></div>
        <form novalidate id="add_group_form" role="form" method="post" class="form-horizontal">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="groupName">Group Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="Group Name" id="groupName" class="form-control" name="groupName">
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-4 col-md-8">
               <!--    <?php
                  if($groupId){ ?>  -->
                    <input type="hidden" value="<?= $groupId; ?>" id="groupId" name="groupId">
                    <button class="btn btn-info" id="editgroupsubmit" onClick="return updateGroup();" type="button">Update</button>
                    <a href="${pageContext.request.contextPath}/groups/pendinglist" class="btn btn-danger" value="">Back</a>
                 <!-- <?php }else{ ?> -->
                    <button class="btn btn-info" id="addgroupsubmit" onClick="return addGroup();" type="button">Add Group</button>
                    <button class="btn btn-danger" type="reset" value="">Clear</button>
                  <!-- <?php } ?>-->
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
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Pending Groups</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <?php if( in_array( 'groups/add', $permission_arr ) ) { ?>
              <?php if($this->session->userdata(SYS_SESSION_ID) == SUPER_ADMIN_ID) { ?>
              <a href="<?php echo base_url(); ?>groups/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
              <?php } ?>
              <?php } ?>
            </div>
        </div>
      </div>
    </div>

    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="pending_group_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
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
  /*
  table = $('#pending_group_list').DataTable({
      language: {
        processing: "<img src='${pageContext.request.contextPath}/resources/img/loading.gif'>",
      },
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      'autoWidth': false,
      "ajax": {
          "data": function(d) {},
          "url": "",
          "type": "POST"
      },
      "dom": "B lrt<'row' <'col-sm-5' i><'col-sm-7' p>>",
      "lengthMenu": [[10, 25, 50, 100, 1000, -1], [10, 25, 50, 100, 1000, "All"]],
      //Set column definition initialisation properties.
      "columnDefs": [{
          "targets": [0,4],
          "orderable": false, //set not orderable
      },
      {
          "targets": [0,4],
          "searchable": false, //set orderable
      } ],
      buttons: []
  });*/
  var i = 0;
  $('#pending_group_list tfoot th').each( function () {
    if( i == 1 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#pending_group_list').DataTable();

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

function addGroup() {
  var table2 = $('#pending_group_list').DataTable();
  var groupName = $( '#add_group_form #groupName' ).val(); 
  if(groupName == ''){
    toastr.error('Group Name Cannot be empty','Error');
    return false;
  }
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  if(groupName){
    var formdata = {csrf_test_name:csrf_hash,'groupName':groupName};
    $.ajax({
      type: "POST",
      url: 'groups/addGroup',
      data: formdata,
      beforeSend: function() {
          $("#addgroupsubmit").html('<img src="${pageContext.request.contextPath}/img/input-spinner.gif"> Loading...');
          $("#addgroupsubmit").prop('disabled', true);
      },
      success: function( data ) {
        if(data == 1){
          $("#addgroupsubmit").html('Add Group');
          $("#addgroupsubmit").prop('disabled', false);
          toastr.success( 'Group Added successfully.','Success' );
          $('#add_group_form #groupName').val('');
          table2.ajax.reload();
        }else{
          toastr.error( data,'Error' );
          $("#addgroupsubmit").html('Add Group');
          $("#addgroupsubmit").prop('disabled', false);
        }
      }
    });
  }   
}
function updateGroup() {
  var table2    = $('#pending_group_list').DataTable();
  var groupName = $( '#add_group_form #groupName' ).val();
  var groupId   = $( '#add_group_form #groupId' ).val();
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
            $("#editgroupsubmit").html('<img src="${pageContext.request.contextPath}/img/input-spinner.gif"> Loading...');
            $("#editgroupsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#editgroupsubmit").html('Update');
            $("#editgroupsubmit").prop('disabled', false);
            toastr.success( 'Group Updated successfully.','Success' );
            table2.ajax.reload();
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