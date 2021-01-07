<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl   = $this->config->item( 'base_url' );
global $permission_arr;
?> -->
<link href="$pageContext.request.contextPath/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="$pageContext.request.contextPath/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="$pageContext.request.contextPath/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="$pageContext.request.contextPath/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Manage App Users</span>
        </div>
        <div class="actions">
            <div class="btn-group">
             <!--  <?php if( in_array( 'appUsers/import', $permission_arr ) ) { ?>  -->
              <a href="<?php echo $assetUrl; ?>appUsers/import" data-toggle="tooltip" title="Import" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i></a>
              <a href="<?php echo $assetUrl; ?>appUsers/deleteOldUsers" onclick="return confirm(' you want to delete?');" data-toggle="tooltip" title="Delete old users" class="btn red-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Delete old users">
                <i class="fa fa-remove"></i>
              </a>
           <!-- <?php } ?> -->   
            </div>
        </div>
      </div>
    </div>

    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="app_user_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="head1 no-sort">#</th>
                        <th class="head1 no-sort">User Name</th>
                        <th class="head1 no-sort">Agent Name</th>
                        <th class="head1 no-sort">Channel Code</th>
                        <th class="head1 no-sort">Channel</th>
                        <th class="head1 no-sort">Region</th>
                        <th class="head1 no-sort">Password</th>
                        <th class="head1 no-sort">lat</th>
                        <th class="head1 no-sort">lng</th>
                        <th class="head1 no-sort">Zipcode</th>
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
  var start = '';
  var end = '';
  table = $('#app_user_list').DataTable({
      language: {
        processing: "<img src='$pageContext.request.contextPath/resources/img/loading.gif'>",
      },
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      'autoWidth': false,
      "ajax": {
          "data": function(d) {
              d.minDate = start;
              d.maxDate = end;
          },
          "url": "<?php echo site_url('/appUsers/appUserTableResponse')?>",
          "type": "POST"
      },
      "dom": "B lrt<'row' <'col-sm-5' i><'col-sm-7' p>>",
      "lengthMenu": [[10, 25, 50, 100, 1000, -1], [10, 25, 50, 100, 1000, "All"]],
      //Set column definition initialisation properties.
      "columnDefs": [{
          "targets": [0,11],
          "orderable": false, //set not orderable
      },
      {
          "targets": [0,11],
          "searchable": false, //set orderable
      } ],
      buttons: []
  });
  var i = 0;
  var channelLists  = <?php echo json_encode($channelLists) ?>;
  var regionLists   = <?php echo json_encode($regionLists) ?>;
  $('#app_user_list tfoot th').each( function () {
    if( i == 1 || i == 2 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    } else if(i == 3){
      var tech_selectbox = '<select name="channelCode" id="channelCode" class="form-control">'
                              +'<option value="">All</option>';
      $.each(channelLists, function (i, elem) {
          tech_selectbox += '<option value="'+ elem['channelId'] +'">'+ decodeURIComponent(elem['channelCode']) +'</option>';
      });
        tech_selectbox += '</select>';
        $(this).html( tech_selectbox );
    } else if(i == 4){
      var tech_selectbox = '<select name="channelName" id="channelName" class="form-control">'
                              +'<option value="">All</option>';
      $.each(channelLists, function (i, elem) {
          tech_selectbox += '<option value="'+ elem['channelId'] +'">'+ decodeURIComponent(elem['channelName']) +'</option>';
      });
        tech_selectbox += '</select>';
        $(this).html( tech_selectbox );
    } else if(i == 5){
      var tech_selectbox = '<select name="region_id" id="region_id" class="form-control">'
                              +'<option value="">All</option>';
      $.each(regionLists, function (i, elem) {
          tech_selectbox += '<option value="'+ elem['regionId'] +'">'+ decodeURIComponent(elem['regionName']) +'</option>';
      });
        tech_selectbox += '</select>';
        $(this).html( tech_selectbox );
    }
    i++;
  });

  // DataTable
  var table = $('#app_user_list').DataTable();

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
</script>