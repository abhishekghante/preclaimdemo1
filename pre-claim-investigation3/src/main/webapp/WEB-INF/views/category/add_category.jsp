<!-- <?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl  = $this->config->item( 'base_url' );
?> -->
<style type="text/css">
.placeImg { display:none !important;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add investigations</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/category/pendinglist" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_category"></div>
      <form novalidate="" id="add_category_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="categoryNameEn">investigations Name (English) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="investigations Name" id="categoryNameEn" maxlength="40" class="form-control" name="categoryNameEn">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">investigations Image (English) </label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <img src="${pageContext.request.contextPath}/uploads/default_img.png" id="categoryImgEn" style="height:160px;width:auto;" data-src="#" />
                    <input type="file" onchange="displayUploadImg(this, 'categoryImgEn');" name="imgCatEng" id="imgCatEng" class="placeImg" accept="image/*" />
                  </a>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="categoryNameThai">investigations Name (Hindi) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="investigations Name" maxlength="40" id="categoryNameThai" class="form-control" name="categoryNameThai">
                </div>
              </div>
              <h4>investigations Image (Hindi)</h4>
              <div class="form-group">
                <label class="col-md-offset-4 col-md-6 control-label" for="isEnImageSame">
                  <input type="checkbox" name="isEnImageSame" id="isEnImageSame" value="1" />
                  Same as English investigations Image
                </label>
              </div>
              <div class="form-group">
                <span class="col-md-12 text-center">OR</span>
                <label class="col-md-4 control-label">Upload Image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <img src="${pageContext.request.contextPath}/uploads/default_img.png" id="categoryImgThai" style="height:160px;width: auto;" data-src="#" /> <br />
                    <input type="file" onchange="displayUploadImg(this, 'categoryImgThai');" name="imgCatThai" id="imgCatThai" class="placeImg" accept="image/*" />
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addcategorysubmit" type="submit">Add investigations</button>
            <button class="btn btn-danger" type="reset" value="">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
function displayUploadImg(input, PlaceholderID) {
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

  $("#add_category_form").on('submit', function(e){
    e.preventDefault();
    var categoryNameEn   = $( '#add_category_form #categoryNameEn' ).val();
    var categoryNameThai  = $( '#add_category_form #categoryNameThai' ).val();
    if(categoryNameEn == ''){
      toastr.error('investigations Name English Cannot be empty','Error');
      return false;
    }
    if(categoryNameThai == ''){
      toastr.error('investigations Name Hindi Cannot be empty','Error');
      return false;
    }
    if(categoryNameEn && categoryNameThai){
        $.ajax({
          type: "POST",
          url: adminurl + 'category/addCategory',
          data: new FormData(this),
          contentType: false,
          cache: false,
          processData:false,
          beforeSend: function() { 
              $("#addcategorysubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
              $("#addcategorysubmit").prop('disabled', true);
              $('#add_category_form').css("opacity",".5");
          },
          success: function( data ) {
            if(data == 1){
              $("#addcategorysubmit").html('Add investigations');
              $("#addcategorysubmit").prop('disabled', false);
              toastr.success( 'investigations Added successfully.','Success' );
              $("form#add_category_form").trigger("reset");
              $("#categoryImgEn").attr("src", '${pageContext.request.contextPath}/uploads/default_img.png');
              $("#categoryImgThai").attr("src",'${pageContext.request.contextPath}/uploads/default_img.png');
            }else{
              toastr.error( data,'Error' );
              $("#addcategorysubmit").html('Add investigations');
              $("#addcategorysubmit").prop('disabled', false);
            }
            $('#add_category_form').css("opacity","");
          }
        });
    }
  });
});
</script>