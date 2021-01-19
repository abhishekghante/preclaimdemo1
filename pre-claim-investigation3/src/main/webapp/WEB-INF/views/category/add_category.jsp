<%@page import="java.util.List"%>
<%
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
%>
<style type="text/css">
.placeImg { display:none !important;}
</style>

<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-users font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add Investigation</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/category/pending_category" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
              <i class="fa fa-reply"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- form start -->
      <div id="message_category"></div>
      <form novalidate id="add_category_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="categoryNameEn">Investigation Name (English) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="Investigation Name" id="categoryNameEn" maxlength="40" class="form-control" name="categoryNameEn">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Investigation Image (English) </label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" id="categoryImgEn" style="height:160px;width:auto;" data-src="#" />
                    <input type="file" onchange="displayUploadImg(this, 'categoryImgEn');" 
                    name="imgCatEng" id="imgCatEng" class="placeImg" accept="image/*" />
                  </a>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="categoryNameHin">Investigation Name <br>(Hindi) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="Investigation Name (Hindi)" maxlength="40" id="categoryNameHin" class="form-control" name="categoryNameHin">
                </div>
              </div>
              <div class="form-group">
                <!-- <span class="col-md-12 text-center">OR</span> -->
                <label class="col-md-4 control-label">Investigation Image <br>(Hindi)</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" id="categoryImgHin" style="height:160px;width: auto;" data-src="#" /> <br />
                    <input type="file" onchange="displayUploadImg(this, 'categoryImgHin');" name="imgCatHin" id="imgCatHin" class="placeImg" accept="image/*" />
                  </a>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">
                  Investigation Image (Hindi)
                </label>
                <div class="col-md-8" style = "padding-top:7px;">  
                  <input type="checkbox" name="isEnImageSame" id="isEnImageSame" value = "1">
                  Same as English investigations Image 
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addcategorysubmit" type="submit">Add Investigation</button>
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
    if(file_size < 5)
    {
      var reader = new FileReader();
      reader.onload = function (e) 
      {
        $('#'+PlaceholderID)
            .attr('src', e.target.result)
            .width('auto')
            .height(160);
      reader.readAsDataURL(upfile);
      }
    }
    else
    {
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
  $("#categoryImgHin").on('click', function() {
    $('input[name=isEnImageSame]').prop('checked', false);
    $("#imgCatHin").trigger('click');
  });

 $("#isEnImageSame").change(function(){
	if($("#isEnImageSame").prop("checked"))
	{
		$("#categoryImgHin").attr("src",$("#categoryImgEn").attr("src"));
	}		
	else
		$("#categoryImgHin").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
 });
	
});
</script>
<script>
function addcategorysubmit() {
	<%if(!user_permission.contains("category/add")){%>
		toastr.error("Access Denied","Error");
		return false;
	<%}%>
	var categoryNameEn   = $( '#add_category_form #categoryNameEn' ).val();
    var categoryNameHin  = $( '#add_category_form #categoryNameHin' ).val();
    var categoryImageEn   = $( '#add_category_form #categoryImageEn' ).val();
    var categoryImageHin  = $( '#add_category_form #categoryImageHin' ).val();
    var isEnImageSame = $( '#add_category_form #isEnImageSame' ).val();
    
    if(categoryNameEn == ''){
      toastr.error('Investigation Name English cannot be empty','Error');
      return false;
    }
    if(categoryNameHin == ''){
      toastr.error('Investigation Name Hindi cannot be empty','Error');
      return false;
    }
    if(categoryNameEn && categoryNameHin){
        var formdata = 
        {
        		"categoryNameEn":categoryNameEn,
        		"categoryNameHin":categoryNameHin,
        		"categoryImgEn":"",
        		"categoryImgHin":"",
        		"isEnImageSame":isEnImageSame
     	}
    	$.ajax({
          type: "POST",
          url: 'addCategory',
          data: formdata,
          beforeSend: function() { 
              $("#addcategorysubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
              $("#addcategorysubmit").prop('disabled', true);
              $('#add_category_form').css("opacity",".5");
          },
          success: function( data ) {
            if(data == "****")
            {
              $("#addcategorysubmit").html('Add investigations');
              $("#addcategorysubmit").prop('disabled', false);
              toastr.success( 'investigations Added successfully.','Success' );
              $("form#add_category_form").trigger("reset");
              $("#categoryImgEn").attr("src", '${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#categoryImgHin").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
            }
            else
            {
              toastr.error( data,'Error' );
              $("#addcategorysubmit").html('Add investigations');
              $("#addcategorysubmit").prop('disabled', false);
            }
            $('#add_category_form').css("opacity","");
          }
        });
    }
  }
</script>