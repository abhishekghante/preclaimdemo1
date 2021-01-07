<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl   = $this->config->item( 'base_url' );
global $permission_arr;
if($categoryInfo){
  $categoryNameEn   = $categoryInfo->categoryNameEn;
  $categoryNameThai = $categoryInfo->categoryNameThai;
  $categoryImgEn    = $categoryInfo->categoryImgEn;
  $categoryImgThai  = $categoryInfo->categoryImgThai;
  if($categoryInfo->isEnImageSame == 1){ $checked = 'checked'; }else{ $checked = ''; }
}else{
  $categoryNameEn   = '';
  $categoryNameThai = '';
  $categoryImgEn    = '';
  $categoryImgThai  = '';
  $checked          = '';
}
?> -->
<style type="text/css">
.placeImg { display:none !important;}
.form-group { margin-bottom: 5px; }
</style>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<!-- <?php if( in_array( 'category/add', $permission_arr ) ) { ?>  -->
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold"><?= (($categoryId)?'Update':'Add'); ?> investigations</span>
        </div>
      </div>
    </div>
    <div class="portlet light bordered">
      <div class="portlet-body">
        <div id="message_category"></div>
        <form novalidate="" id="add_category_form" role="form" method="post" class="form-horizontal">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="categoryNameEn">investigations Name (English) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required id="categoryNameEn" name="categoryNameEn" maxlength="40" class="form-control" placeholder="investigations Name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">investigations Image (English) </label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <!-- <?php
                    if($categoryImgEn){
                      $tmp = explode('/', $categoryImgEn);
                      $file_name = end($tmp);
                      if (file_exists('uploads/category/'.$file_name)) {
                        $categoryImgEn = $categoryImgEn;
                        $imgCatEngSty  = 'style="display: block;"';
                      }else{
                        $categoryImgEn = $assetUrl.'uploads/default_img.png';
                        $imgCatEngSty  = '';
                      }
                    }else{
                      $categoryImgEn = $assetUrl.'uploads/default_img.png';
                      $imgCatEngSty  = '';
                    }
                    ?> -->
                    <!-- <span <?= $imgCatEngSty; ?> data-imgID="categoryImgEn" data-delID="delImgMsgEn" data-ID="imgCatEng" id="enLblDelBtn" class="delete_btn" data-toggle="tooltip" data-toggle="tooltip" title="Remove"><i class="fa fa-remove"></i></span> -->
                    <img src="<?= $categoryImgEn; ?>" id="categoryImgEn" style="height:100px;width:auto;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                    <input type="hidden" name="delImgMsgEn" id="delImgMsgEn" value="0" />
                    <input type="file" onchange="displayUploadImg(this, 'categoryImgEn', 'enLblDelBtn');" name="imgCatEng" id="imgCatEng" class="placeImg" accept="image/*" />
                  </a>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="categoryNameThai">investigations Name (Hindi) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" name="categoryNameThai" id="categoryNameThai" maxlength="40" class="form-control" placeholder="investigations Name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-offset-4 col-md-6 control-label" for="isEnImageSame">
                  <input type="checkbox"> <!-- <?= $checked; ?> name="isEnImageSame" id="isEnImageSame" value="1" /> -->
                  Same as English category Image
                </label>
              </div>
              <div class="form-group">
                <span class="col-md-12 text-center">OR</span>
                <label class="col-md-4 control-label">Upload Image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <!-- <?php
                    if($categoryImgThai){
                      $tmp2 = explode('/', $categoryImgThai);
                      $file_name2 = end($tmp2);
                      if (file_exists('uploads/category/'.$file_name2)) {
                        $categoryImgThai = $categoryImgThai;
                        $imgCatThaiSty   = 'style="display: block;"';
                      }else{
                        $categoryImgThai = $assetUrl.'uploads/default_img.png';
                        $imgCatThaiSty   = '';
                      }
                    }else{
                      $categoryImgThai = $assetUrl.'uploads/default_img.png';
                      $imgCatThaiSty   = '';
                    }
                    ?> -->	
                    <!-- <span <?= $imgCatThaiSty; ?> data-imgID="categoryImgThai" data-delID="delImgMsgThai" data-ID="imgCatThai" id="thaiLblDelBtn" class="delete_btn" data-toggle="tooltip" data-toggle="tooltip" title="Remove"><i class="fa fa-remove"></i></span> -->
                    <img src="<?= $categoryImgThai; ?>" id="categoryImgThai" style="height:100px;width: auto;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                    <input type="hidden" name="delImgMsgThai" id="delImgMsgThai" value="0" />
                    <input type="file" onchange="displayUploadImg(this, 'categoryImgThai', 'thaiLblDelBtn');" name="imgCatThai" id="imgCatThai" class="placeImg" accept="image/*" />
                  </a>
                </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                <!--  <?php
                  if($categoryId){ ?>-->
                    <input type="hidden" value="<?= $categoryId; ?>" id="categoryId" name="categoryId">
                    <button class="btn btn-info" id="editcategorysubmit" type="submit">Update</button>
                    <a href="${pageContext.request.contextPath}/category/pendinglist" class="btn btn-danger" value="">Back</a>
                  <!-- <?php }else{ ?>  -->
                    <input type="hidden" id="categoryId" name="categoryId">
                    <button class="btn btn-info" id="addcategorysubmit" type="submit">Add Category</button>
                    <button class="btn btn-danger" type="reset" value="">Clear</button>
                  <!--<?php } ?>  -->
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
            <span class="caption-subject font-green-sharp sbold">Pending investigations</span>
        </div>
        <div class="actions">
            <div class="btn-group">
             <!--  <?php if( in_array( 'category/add', $permission_arr ) ) { ?>
              <?php if($this->session->userdata(SYS_SESSION_ID) == SUPER_ADMIN_ID) { ?>  -->
              <a href="${pageContext.request.contextPath}/category/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
             <!--  <?php } ?>
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
                  <table id="pending_category_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                    <thead>
                      <tr class="tbl_head_bg">
                        <th class="head1 no-sort">#</th>
                        <th class="head1 no-sort">investigations Name(En)</th>
                        <th class="head1 no-sort">investigations Name(Hindi)</th>
                        <th class="head1 no-sort">investigations Image(En)</th>
                        <th class="head1 no-sort">investigations Image(Hindi)</th>
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
  table = $('#pending_category_list').DataTable({
      language: {
        processing: "<img src='<?php echo base_url();?>${pageContext.request.contextPath}/resources/img/loading.gif'>",
      },
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "order": [], //Initial no order.
      'autoWidth': false,
      "ajax": {
          "data": function(d) {
            d.csrf_test_name = csrf_hash;
          },
          "url": "<?php echo site_url('/category/pendingCategoryTableResponse')?>",
          "type": "POST"
      },
      "dom": "B lrt<'row' <'col-sm-5' i><'col-sm-7' p>>",
      "lengthMenu": [[10, 25, 50, 100, 1000, -1], [10, 25, 50, 100, 1000, "All"]],
      //Set column definition initialisation properties.
      "columnDefs": [{
          "targets": [0,6],
          "orderable": false, //set not orderable
      },
      {
          "targets": [0,6],
          "searchable": false, //set orderable
      } ],
      buttons: []
  });
  */
  var i = 0;
  $('#pending_category_list tfoot th').each( function () {
    if( i == 1 || i == 2 ){
      $(this).html( '<input type="text" class="form-control" placeholder="" />' );
    }
    i++;
  });

  // DataTable
  var table = $('#pending_category_list').DataTable();

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
<script type="text/javascript">
function displayUploadImg(input, PlaceholderID, deleteID) {
  if (input.files && input.files[0]) {
    var upfile = input.files[0];
    var imagefile = upfile.type;
    var match= ["image/jpeg","image/png","image/jpg"];
    if(!((imagefile==match[0]) || (imagefile==match[1]) || (imagefile==match[2]))){
        alert('Please select a valid image file (JPEG/JPG/PNG).');
        $("#"+input.id).val('');
        return false;
    }
    var file_size = upfile.size/1024/1024;
    if(file_size < 5){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#'+PlaceholderID)
            .attr('src', e.target.result)
            .width('auto')
            .height(100);
        };
      reader.readAsDataURL(upfile);
      $('#'+deleteID).show();
    }else{
      alert('File too large. File must be less than 5 MB.');
      $("#"+input.id).val('');
      return false;
    }
  }
}
$(document).ready(function(){
  $("#categoryImgEn").on('click', function() {
    $("#imgCatEng").trigger('click');
  });
  $("#categoryImgThai").on('click', function() {
    $('input[name=isEnImageSame]').prop('checked', false);
    $("#imgCatThai").trigger('click');
  });
  $(".delete_btn").on('click', function() {
    var msgImgID = $(this).attr('data-imgID');
    var imgID    = $(this).attr('data-ID');
    var delImgID = $(this).attr('data-delID');
    $("#"+msgImgID).attr("src", adminurl+'uploads/default_img.png');
    $("#"+imgID).val('');
    $("#"+delImgID).val(1);
    $("#"+this.id).hide();
  });
  $("#add_category_form").on('submit', function(e){
    e.preventDefault();
    var table2      = $('#pending_category_list').DataTable();
    var categoryNameEn   = $( '#add_category_form #categoryNameEn' ).val();
    var categoryNameThai = $( '#add_category_form #categoryNameThai' ).val();
    var categoryId       = $( '#add_category_form #categoryId' ).val();
    if(categoryNameEn == ''){
      toastr.error('Category Name English Cannot be empty','Error');
      return false;
    }
    if(categoryNameThai == ''){
      toastr.error('investigations Name Hindi Cannot be empty','Error');
      return false;
    }
    if(categoryId){
      if(categoryNameEn && categoryNameThai && categoryId){
        $.ajax({
          type: "POST",
          url: adminurl + 'category/updateCategory',
          data: new FormData(this),
          contentType: false,
          cache: false,
          processData:false,
          beforeSend: function() { 
              $("#editcategorysubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
              $("#editcategorysubmit").prop('disabled', true);
              $('#add_category_form').css("opacity",".5");
          },
          success: function( data ) {
            if(data == 1){
              $("#editcategorysubmit").html('Update');
              $("#editcategorysubmit").prop('disabled', false);
              toastr.success( 'investigations Updated successfully.','Success' );
              $("#delImgMsgEn").val(0);
              $("#delImgMsgThai").val(0);
              table2.ajax.reload();
            }else{
              toastr.error( data,'Error' );
              $("#editcategorysubmit").html('Update');
              $("#editcategorysubmit").prop('disabled', false);
            }
            $('#add_category_form').css("opacity","");
          }
        });
      }
    }else{
      if(categoryNameEn && categoryNameThai){
        $.ajax({
          type: "POST",
          url: adminurl + 'category/addCategory',
          data: new FormData(this),
          contentType: false,
          cache: false,
          processData:false,
          beforeSend: function() { 
              $("#addcategorysubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
              $("#addcategorysubmit").prop('disabled', true);
              $('#add_category_form').css("opacity",".5");
          },
          success: function( data ) {
            if(data == 1){
              $("#addcategorysubmit").html('Add investigations');
              $("#addcategorysubmit").prop('disabled', false);
              toastr.success( 'investigations Added successfully.','Success' );
              $("form#add_category_form").trigger("reset");
              $("#categoryImgEn").attr("src", adminurl+'uploads/default_img.png');
              $("#categoryImgThai").attr("src", adminurl+'uploads/default_img.png');
              table2.ajax.reload();
            }else{
              toastr.error( data,'Error' );
              $("#addcategorysubmit").html('Add investigations');
              $("#addcategorysubmit").prop('disabled', false);
            }
            $('#add_category_form').css("opacity","");
          }
        });
      }
    }
  });
});
</script>