<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl  = $this->config->item( 'base_url' );
if($categoryInfo){
  $categoryNameEn  = $categoryInfo->categoryNameEn;
  $categoryNameThai = $categoryInfo->categoryNameThai;
  if($categoryInfo->isEnImageSame == 1){ $checked = 'checked'; }else{ $checked = ''; }
}
?>
<style type="text/css">
.placeImg { display:none !important;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Edit investigations</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="<?= base_url(); ?>category/pendinglist" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_category"></div>
      <form novalidate="" id="edit_category_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="categoryNameEn">investigations Name (English) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" value="<?= $categoryNameEn; ?>" maxlength="40" placeholder="investigations Name" id="categoryNameEn" class="form-control" name="categoryNameEn">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">investigations Image (English) </label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <?php
                    if($categoryInfo->categoryImgEn){
                      $tmp = explode('/', $categoryInfo->categoryImgEn);
                      $file_name = end($tmp);
                      if (file_exists('uploads/category/'.$file_name)) {
                        $categoryImgEn = $categoryInfo->categoryImgEn;
                        $imgCatEngSty  = 'style="display: block;"';
                      }else{
                        $categoryImgEn = $assetUrl.'uploads/default_img.png';
                        $imgCatEngSty  = '';
                      }
                    }else{
                      $categoryImgEn = $assetUrl.'uploads/default_img.png';
                      $imgCatEngSty  = '';
                    }
                    ?>
                    <span <?= $imgCatEngSty; ?> data-imgID="categoryImgEn" data-delID="delImgMsgEn" data-ID="imgCatEng" id="enLblDelBtn" class="delete_btn" data-toggle="tooltip" data-toggle="tooltip" title="Remove"><i class="fa fa-remove"></i></span>
                    <img src="<?php echo $categoryImgEn; ?>" id="categoryImgEn" style="height:160px;width:auto;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
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
                  <input type="text" required="" value="<?= $categoryNameThai; ?>" maxlength="40" placeholder="investigations Name" maxlength="15" id="categoryNameThai" class="form-control" name="categoryNameThai">
                </div>
              </div>
              <h4>investigations Image (Hindi)</h4>
              <div class="form-group">
                <label class="col-md-offset-4 col-md-6 control-label" for="isEnImageSame">
                  <input type="checkbox" name="isEnImageSame" <?= $checked; ?> id="isEnImageSame" value="1" />
                  Same as English investigations Image
                </label>
              </div>
              <div class="form-group">
                <span class="col-md-12 text-center">OR</span>
                <label class="col-md-4 control-label">Upload Image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <?php
                    if($categoryInfo->categoryImgThai){
                      $tmp2 = explode('/', $categoryInfo->categoryImgThai);
                      $file_name2 = end($tmp2);
                      if (file_exists('uploads/category/'.$file_name2)) {
                        $categoryImgThai = $categoryInfo->categoryImgThai;
                        $imgCatThaiSty   = 'style="display: block;"';
                      }else{
                        $categoryImgThai = $assetUrl.'uploads/default_img.png';
                        $imgCatThaiSty   = '';
                      }
                    }else{
                      $categoryImgThai = $assetUrl.'uploads/default_img.png';
                      $imgCatThaiSty   = '';
                    }
                    ?>
                    <span <?= $imgCatThaiSty; ?> data-imgID="categoryImgThai" data-delID="delImgMsgThai" data-ID="imgCatThai" id="thaiLblDelBtn" class="delete_btn" data-toggle="tooltip" data-toggle="tooltip" title="Remove"><i class="fa fa-remove"></i></span>
                    <img src="<?php echo $categoryImgThai; ?>" id="categoryImgThai" style="height:160px;width: auto;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                    <input type="hidden" name="delImgMsgThai" id="delImgMsgThai" value="0" />
                    <input type="file" onchange="displayUploadImg(this, 'categoryImgThai', 'thaiLblDelBtn');" name="imgCatThai" id="imgCatThai" class="placeImg" accept="image/*" />
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <input type="hidden" value="<?= $categoryId; ?>" id="categoryId" name="categoryId">
            <button class="btn btn-info" id="editcategorysubmit" type="submit">Update</button>
            <a href="${pageContext.request.contextPath}/category/pendinglist" class="btn btn-danger" value="">Back</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
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
            .height(160);
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
  $("#edit_category_form").on('submit', function(e){
    e.preventDefault();
    var categoryNameEn   = $( '#edit_category_form #categoryNameEn' ).val();
    var categoryNameThai = $( '#edit_category_form #categoryNameThai' ).val();
    var categoryId       = $( '#edit_category_form #categoryId' ).val();
    if(categoryNameEn == ''){
      toastr.error('investigations Name English Cannot be empty','Error');
      return false;
    }
    if(categoryNameThai == ''){
      toastr.error('investigations Name Thai Cannot be empty','Error');
      return false;
    }
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
              $('#edit_category_form').css("opacity",".5");
          },
          success: function( data ) {
            if(data == 1){
              $("#editcategorysubmit").html('Update');
              $("#editcategorysubmit").prop('disabled', false);
              toastr.success( 'investigations Updated successfully.','Success' );
              $("#delImgMsgEn").val(0);
              $("#delImgMsgThai").val(0);
            }else{
              toastr.error( data,'Error' );
              $("#editcategorysubmit").html('Update');
              $("#editcategorysubmit").prop('disabled', false);
            }
            $('#edit_category_form').css("opacity","");
          }
        });
    }
  });
});
</script>