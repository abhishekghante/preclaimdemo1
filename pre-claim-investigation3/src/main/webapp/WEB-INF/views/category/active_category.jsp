<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl   = $this->config->item( 'base_url' );
global $permission_arr;
?> -->
<script src="${pageContext.request.contextPath}/resources/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<style type="text/css">
.move_td:hover{ cursor: move; }
</style>
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Active investigations</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <?php if( in_array( 'category/add', $permission_arr ) ) { ?>
              <?php if($this->session->userdata(SYS_SESSION_ID) == SUPER_ADMIN_ID) { ?>
              <a href="${pageContext.request.contextPath}/category/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
            <!-- <?php } ?>
              <?php } ?> -->  
            </div>
        </div>
      </div>
    </div>

    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="active_category_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="no-sort"></th>
                        <th class="no-sort">#</th>
                        <th class="no-sort">investigations Name(En)</th>
                        <th class="no-sort">investigations Name(Hindi)</th>
                        <th class="no-sort">investigations Image(En)</th>
                        <th class="no-sort">investigations Image(Hindi)</th>
                        <th class="no-sort">Status</th>
                        <th class="no-sort">Action</th>
                      </tr>
                    </thead>
                    <tbody class="row_position">
                    <!-- <?php
                      $trRow = '';
                      if($categoryLists){
                        $si_no  = 1;
                        $categoryImgEn   = '';
                        $categoryImgThai = '';
                        foreach ($categoryLists as $key => $category) {
                          if ($category->status == 1) {
                              $statuslbl   = '<span class="label label-sm label-success">Active</span>';
                              $statusbtn   = '<a href="javascript:;" data-toggle="tooltip" title="Inactive" onClick="return updateCategoryStatus('.$category->categoryId.',1,2);" class="btn btn-warning btn-xs"><i class="glyphicon glyphicon-ban-circle"></i></a>';
                          }elseif ($category->status == 2) {
                              $statuslbl   = '<span class="label label-sm label-danger">Inactive</span>';
                              $statusbtn   = '<a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateCategoryStatus('.$category->categoryId.',1,1);" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i></a>';
                          }
                          if( in_array( 'category/status', $permission_arr ) ) {
                              $statusbtn   = $statusbtn;
                          }else{
                              $statusbtn   = '';
                          }
                          if( in_array( 'category/add', $permission_arr ) ) {
                              $editbtn     = '<a href="'.base_url().'category/pendinglist/'.$category->categoryId.'" data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-edit"></i></a>';
                          }else{
                              $editbtn     = '';
                          }
                          if( in_array( 'category/delete', $permission_arr ) ) {
                              $deletebtn   = '<a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteCategory('.$category->categoryId.',1);" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a>';
                          }else{
                              $deletebtn   = '';
                          }
                          if($category->categoryImgEn){
                              $tmp1 = explode('/', $category->categoryImgEn);
                              $file_name1 = end($tmp1);
                              if (file_exists('uploads/category/'.$file_name1)) {
                                  $categoryImgEn = '<img src="'.$category->categoryImgEn.'" style="height:50px;width: 50px;" data-src="#">';
                              }else{ $categoryImgEn = ''; }
                          }else{ $categoryImgEn = ''; }
                          if($category->categoryImgThai){
                              $tmp2 = explode('/', $category->categoryImgThai);
                              $file_name2 = end($tmp2);
                              if (file_exists('uploads/category/'.$file_name2)) {
                                  $categoryImgThai = '<img src="'.$category->categoryImgThai.'" style="height:50px;width: 50px;" data-src="#">';
                              }else{ $categoryImgThai = ''; }
                          }else{
                              if($category->isEnImageSame == 1){
                                  $categoryImgThai = $categoryImgEn;
                              }else{
                                  $categoryImgThai = '';
                              }
                          }
                          $trRow .= '<tr id="'.$category->categoryId.'">';
                          $trRow .= '<td title="move" class="move_td"><i class="icon-cursor-move"></i></td>';
                          $trRow .= '<td>'.$si_no.'</td>';
                          $trRow .= '<td>'.$category->categoryNameEn.'</td>';
                          $trRow .= '<td>'.$category->categoryNameThai.'</td>';
                          $trRow .= '<td>'.$categoryImgEn.'</td>';
                          $trRow .= '<td>'.$categoryImgThai.'</td>';
                          $trRow .= '<td>'.$statuslbl.'</td>';
                          $trRow .= '<td>'.$editbtn.$statusbtn.$deletebtn.'</td>';
                          $trRow .= '</tr>';
                          $si_no++;
                        }
                      }
                      echo $trRow;
                      ?>-->
                    </tbody>  
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
$( ".row_position" ).sortable({
    delay: 150,
    stop: function() {
        var selectedData = new Array();
        $('.row_position>tr').each(function() {
            selectedData.push($(this).attr("id"));
        });
        updateOrder(selectedData);
    }
});


function updateOrder(data) {
    $.ajax({
        url: adminurl + 'category/updateOrder',
        type:'post',
        data:{position:data},
        success:function(){
          toastr.success( 'Your change successfully saved','Success' );
        }
    })
}
/*$(document).ready(function() {
  var csrf_test_name = '<?php echo $this->security->get_csrf_token_name(); ?>';
  var csrf_hash  = '<?php echo $this->security->get_csrf_hash(); ?>';
  table = $('#active_category_list').DataTable({
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
          "url": "<?php echo site_url('/category/activeCategoryTableResponse')?>",
          "type": "POST"
      },
      "dom": "B lrt<'row' <'col-sm-5' i><'col-sm-7' p>>",
      "lengthMenu": [[10, 25, 50, 100, 1000, -1], [10, 25, 50, 100, 1000, "All"]],
      //Set column definition initialisation properties.
      "columnDefs": [{
          "targets": [6],
          "orderable": false, //set not orderable
      },
      {
          "targets": [6],
          "searchable": false, //set orderable
      } ],
      buttons: [],
      rowReorder: {
        dataSrc:'readingOrder',
        update: true
      }
  });
  var i = 0;
  $('#active_category_list tfoot th').each( function () {
    if( i == 1 || i == 2 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#active_category_list').DataTable();

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
});*/
</script>