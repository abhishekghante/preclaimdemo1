<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl   = $this->config->item( 'base_url' );
global $permission_arr;
?>
<link href="<?= $assetUrl; ?>assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="<?= $assetUrl; ?>assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="<?= $assetUrl; ?>assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="<?= $assetUrl; ?>assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Manage Users</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <?php if( in_array( 'users/add', $permission_arr ) ) { ?>
              <a href="<?php echo $assetUrl; ?>users/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
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
                  <table id="adminuser_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th width="5%" class="head1 no-sort">#</th>
                        <th width="5%" class="head1 no-sort">Name</th>
                        <th width="5%" class="head1 no-sort">User Type</th>
                        <th width="5%" class="head1 no-sort">User Name</th>
                        <th width="5%" class="head1 no-sort">Email</th>
                        <th width="5%" class="head1 no-sort">Password</th>
                        <th width="5%" class="head1 no-sort">Status</th>
                        <th width="5%" class="head1 no-sort">Action</th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr class="tbl_head_bg">
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort">User Type</th>
                        <th class="head2 no-sort"></th>
                        <th class="head2 no-sort">Email</th>
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
  var start = '';
  var end = '';
  table = $('#adminuser_list').DataTable({
      language: {
        processing: "<img src='<?php echo base_url();?>assets/img/loading.gif'>",
      },
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      'autoWidth': false,
      "ajax": {
          "data": function(d) {
          },
          "url": "<?php echo site_url('/users/accountsTableResponse')?>",
          "type": "POST"
      },
      "dom": "B lrt<'row' <'col-sm-5' i><'col-sm-7' p>>",
      "lengthMenu": [[10, 25, 50, 100, 1000, -1], [10, 25, 50, 100, 1000, "All"]],
      //Set column definition initialisation properties.
      "columnDefs": [{
          "targets": [0,5,7],
          "orderable": false, //set not orderable
      },
      {
          "targets": [0,5,7],
          "searchable": false, //set orderable
      } ],
      buttons: []
  });
  var levelLists = <?php echo json_encode($role_lists) ?>;
  var i = 0;
  $('#adminuser_list tfoot th').each( function () {
    if( i == 1 || i == 3 || i == 4 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }else if(i == 2){
      var tech_selectbox = '<select name="user_type" id="user_type" class="form-control">'
                              +'<option value="">All</option>';
      $.each(levelLists, function (i, elem) {
          tech_selectbox += '<option value="'+ elem['roleId'] +'">'+ decodeURIComponent(elem['role']) +'</option>';
      });
        tech_selectbox += '</select>';
        $(this).html( tech_selectbox );
    }else if(i == 6){
      var status_selectbox = '<select name="status_type" id="status_type" class="form-control">'
                            +'<option value="">All</option>'
                            +'<option value="1">Active</option>'
                            +'<option value="2">Inactive</option>'
                            +'</select>';
      $(this).html( status_selectbox );
    }
    i++;
  });

  // DataTable
  var table = $('#adminuser_list').DataTable();

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