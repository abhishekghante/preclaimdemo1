<%@page import="com.preclaim.models.UserDetails" %>
<%
UserDetails user_details = (UserDetails) session.getAttribute("User_Login");
//user_details.decodePassword(user_details.getPassword());
%>
<style type="text/css">
#userImage { display:none;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Edit Profile</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="<?= base_url(); ?>dashboard" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
                <i class="fa fa-reply"></i>
              </a>
            </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- /.box-header -->
      <!-- form start -->
      <div id="message_account"></div>
      <form novalidate="" id="edit_profile_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="full_name">Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" value="<%=user_details.getFull_name() %>" placeholder="Name" id="full_name" class="form-control" name="full_name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="user_email">Email <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="email" required="" value="<%= user_details.getUser_email() %>" placeholder="Email" id="user_email" class="form-control" name="user_email">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <span data-imgID="account_picture" data-delID="delUserImg" data-ID="userImage" id="userLblDelBtn" class="delete_btn" data-toggle="tooltip" data-toggle="tooltip" title="Remove"><i class="fa fa-remove"></i></span>
                    <img src="${pageContext.request.contextPath}/resources/img/default_img.png" id="account_picture" style="height:160px;width: auto;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                    <input type="hidden" name="delUserImg" id="delUserImg" value="0" />
                    <input type='file' onchange="displayUploadImg(this, 'account_picture');" name="userImage" id="userImage" accept="image/*" />
                  </a>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="username">Username <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required value="<%= user_details.getFull_name()%>" 
                  	placeholder="User name" maxlength="15" id="username" class="username form-control" 
                  	name="username">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="password">Password <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required maxlength="15" placeholder="Password" id="password" 
                  	value="<%=user_details.getPassword() %>"                  	
                  	class="allow_password form-control" name="password">
                </div>
              </div>
            </div>
          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <div class="col-md-offset-2 col-md-10">
              <input type="hidden" value="<%=user_details.getUsername() %>" id="user_id" name="user_id">
              <button class="btn btn-info" id="editprofilesubmit" type="submit">Update</button>
              <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-danger" value="">Back</a>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
  $(".delete_btn").on('click', function() {
    var msgImgID = $(this).attr('data-imgID');
    var imgID    = $(this).attr('data-ID');
    var delImgID = $(this).attr('data-delID');
    $("#"+msgImgID).attr("src", adminurl+'uploads/default_img.png');
    $("#"+imgID).val('');
    $("#"+delImgID).val(1);
    $("#"+this.id).hide();
  });
  $("#account_picture").on('click', function() {
    $("#userImage").trigger('click');
  });
  $("#edit_profile_form").on('submit', function(e){
    e.preventDefault();
    var full_name   = $.trim($('#edit_profile_form #full_name').val());
    var username     = $.trim($('#edit_profile_form #username').val());
    var user_email  = $.trim($('#edit_profile_form #user_email').val());
    var password     = $.trim($('#edit_profile_form #password').val());
    $('#full_name').removeClass('has-error-2');
    $('#username').removeClass('has-error-2');
    $('#password').removeClass('has-error-2');
    $('#user_email').removeClass('has-error-2');
    if( full_name == "" ){
        $('#full_name').addClass('has-error-2');
        $('#full_name').focus();
        return false;
    }
    if( username == "" ){
        $('#username').addClass('has-error-2');
        $('#username').focus();
        return false;
    }
    if( password == "" ){
        $('#password').addClass('has-error-2');
        $('#password').focus();
        return false;
    }
    if(user_email){
      if (!ValidateEmail(user_email)) {
        $('#user_email').addClass('has-error-2');
        $('#user_email').focus();
        return false;
      }
    }
    $.ajax({
        type    : 'POST',
        url     : 'updateProfile',
        data    : new FormData(this),
        contentType: false,
        cache: false,
        processData:false,
        beforeSend: function() { 
          $("#editprofilesubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
          $("#editprofilesubmit").prop('disabled', true);
          $('#edit_profile_form').css("opacity",".5");
        },
        success : function( data ) {
          if(data == 1){
            $("#editprofilesubmit").html('Update');
            $("#editprofilesubmit").prop('disabled', false);
            //window.location.href = adminurl + "users";
            toastr.success( 'Profile Updated successfully.','Success' );
            $("#delImgMsgEn").val(0);
            $("#delImgMsgThai").val(0);
          }else{
            toastr.error( data,'Error' );
            $("#editprofilesubmit").html('Update');
            $("#editprofilesubmit").prop('disabled', false);
          }
          $('#edit_profile_form').css("opacity","");
        }
    });
  });
});
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
</script>