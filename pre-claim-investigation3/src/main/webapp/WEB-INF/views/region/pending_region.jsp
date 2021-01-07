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
          <span class="caption-subject font-green-sharp sbold"><!-- <?= (($regionId)?'Update':'Add'); ?> --> Region</span>
        </div>
      </div>
    </div>
    <div class="portlet light bordered">
      <div class="portlet-body">
        <div id="message_account"></div>
        <form novalidate="" id="add_region_form" role="form" method="post" class="form-horizontal">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="regionName">Region Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" id="regionName" name="regionName" class="form-control" placeholder="Region Name">
                </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-4 col-md-8">
                  <!-- <?php
                  if($regionId){ ?>  -->
                    <input type="hidden" id="regionId" name="regionId">
                    <button class="btn btn-info" id="editregionsubmit" onClick="return updateRegion();" type="button">Update</button>
                    <a href="${pageContext.request.contextPath}/regions/pendinglist" class="btn btn-danger" value="">Back</a>
                  <!-- <?php }else{ ?>  -->
                    <button class="btn btn-info" id="addregionsubmit" onClick="return addRegion();" type="button">Add Region</button>
                    <button class="btn btn-danger" type="reset" value="">Clear</button>
                  <!-- <?php } ?>  -->
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- <?php } ?>  -->
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Pending Regions</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/regions/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
              <!-- <?php } ?>
              <?php } ?>  -->
            </div>
        </div>
      </div>
    </div>

    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="pending_region_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
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
  table = $('#pending_region_list').DataTable({
      language: {
        processing: "<img src='${pageContext.request.contextPath}/resources/img/loading.gif'>",
      },
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      'autoWidth': false,
      "ajax": {
          "data": function(d) {
            d.csrf_test_name = csrf_hash;
          },
          "url": "<?php echo site_url('/regions/pendingRegionTableResponse')?>",
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
  });
  */
  var i = 0;
  $('#pending_region_list tfoot th').each( function () {
    if( i == 1 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#pending_region_list').DataTable();

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
function addRegion() {
  var table2     = $('#pending_region_list').DataTable();
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
            table2.ajax.reload();
          }else{
            toastr.error( data,'Error' );
            $("#addregionsubmit").html('Add Region');
            $("#addregionsubmit").prop('disabled', false);
          }
        }
      });
  }   
}
function updateRegion() {
  var table2     = $('#pending_region_list').DataTable();
  var regionName = $( '#add_region_form #regionName' ).val();
  var regionId   = $( '#add_region_form #regionId' ).val();
  if(regionName == ''){
    toastr.error('Region Name Cannot be empty','Error');
    return false;
  }
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  if(regionName){
      var formdata = {csrf_test_name:csrf_hash,'regionName':regionName,'regionId':regionId};
      $.ajax({
        type: "POST",
        url: adminurl + 'regions/updateRegion',
        data: formdata,
        beforeSend: function() { 
            $("#editregionsubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#editregionsubmit").prop('disabled', true);
        },
        success: function( data ) {
          if(data == 1){
            $("#editregionsubmit").html('Update');
            $("#editregionsubmit").prop('disabled', false);
            toastr.success( 'Region Updated successfully.','Success' );
            table2.ajax.reload();
          }else{
            toastr.error( data,'Error' );
            $("#editregionsubmit").html('Update');
            $("#editregionsubmit").prop('disabled', false);
          }
        }
      });
  }   
}
</script>