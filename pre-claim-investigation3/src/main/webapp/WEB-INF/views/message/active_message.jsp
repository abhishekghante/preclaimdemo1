<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl   = $this->config->item( 'base_url' );
global $permission_arr;
?>
<link href="${pageContext.request.contextPath}/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Case Lists</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <?php if( in_array( 'messages/add', $permission_arr ) ) { ?>
              <a href="<?php echo base_url(); ?>messages/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
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
                  <div class="table-responsive">
                    <table id="active_message_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                      <thead>
                        <tr class="tbl_head_bg">
                          <th class="head1 no-sort">#</th>
                          <th class="head1 no-sort">Case Title(Eng)</th>
                          <th class="head1 no-sort">Case Title(Hindi)</th>
                          <th class="head1 no-sort">Region</th>
                          <th class="head1 no-sort">Group Name</th>
                          <th class="head1 no-sort">Investigation Name</th>
                          <th class="head1 no-sort">Channel Name</th>
                          <th class="head1 no-sort">Creation Date</th>
                          <th class="head1 no-sort">Expiry Date</th>
                          <th class="head1 no-sort">CreatedBy</th>
                          <th class="head1 no-sort">Assign Supervisor</th>
                          <th class="head1 no-sort">Assign Investigator</th>
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
                          <th class="head1 no-sort"></th>
                          <th class="head1 no-sort"></th>
                          <th class="head1 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
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
  table = $('#active_message_list').DataTable({
      language: {
        processing: "<img src='<?php echo base_url();?>assets/img/loading.gif'>",
      },
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      'autoWidth': false,
      "ajax": {
          "data": function(d) {
            d.csrf_test_name = csrf_hash;
          },
          "url": "<?php echo site_url('/messages/activeMessageTableResponse')?>",
          "type": "POST"
      },
      "dom": "B lrt<'row' <'col-sm-5' i><'col-sm-7' p>>",
      "lengthMenu": [[10, 25, 50, 100, 1000, -1], [10, 25, 50, 100, 1000, "All"]],
      //Set column definition initialisation properties.
      "columnDefs": [{
          "targets": [0,13],
          "orderable": false, //set not orderable
      },
      {
          "targets": [0,13],
          "searchable": false, //set orderable
      } ],
      buttons: []
  });
  var categoryLists = <?php echo json_encode($categoryLists) ?>;
  var channelLists  = <?php echo json_encode($channelLists) ?>;
  var i = 0;
  $('#active_message_list tfoot th').each( function () {
    if( i == 1 || i == 2 || i == 12 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }else if(i == 5){
      var cat_selectbox = '<select name="category" id="category" class="form-control">'
                              +'<option value="">All</option>';
      $.each(categoryLists, function (i, elem) {
          cat_selectbox += '<option value="'+ elem['categoryNameEn'] +'">'+ elem['categoryNameEn'] +'</option>';
      });
        cat_selectbox += '</select>';
        $(this).html( cat_selectbox );
    }else if(i == 6){
      var channelBox = '<select name="channel" id="channel" class="form-control">'
                              +'<option value="">All</option>';
      $.each(channelLists, function (i, elem) {
          channelBox += '<option value="'+ elem['channelName'] +'">'+ elem['channelName'] +'</option>';
      });
        channelBox += '</select>';
        $(this).html( channelBox );
    }
    i++;
  });

  // DataTable
  var table = $('#active_message_list').DataTable();

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

function assignSupervisor(){
  $("#testmodal").modal('show');
}
function assignInvestigator(){
  $('#testmodal2').modal('show');
}
</script>

<div id="testmodal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Assign Supervisor</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                  <div class="form-group">
                      <label class="col-md-3 control-label">Select Supervisor</label>
                      <div class="col-md-9">
                          <select class="form-control">
                              <option>Ram Kumar</option>
                              <option>Suresh</option>
                              <option>Rahul</option>
                          </select>
                      </div>
                  </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<div id="testmodal2" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Assign Investigator</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                  <div class="form-group">
                      <label class="col-md-3 control-label">Select Investigator</label>
                      <div class="col-md-9">
                          <select class="form-control">
                              <option>Ram Kumar</option>
                              <option>Suresh</option>
                              <option>Rahul</option>
                          </select>
                      </div>
                  </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>