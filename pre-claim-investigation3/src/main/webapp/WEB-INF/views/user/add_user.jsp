<%@page import="com.preclaim.models.UserRole" %>
<%@page import = "java.util.List" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
#imgAccount { display:none;}
</style>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Add Users</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/user/user_list" data-toggle="tooltip" 
              	class="btn green-haze btn-outline btn-xs pull-right" style="margin-right: 5px;" 
              	data-original-title="Back" title="Back">
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
      <form id="add_account_form" role="form" method="post" class="form-horizontal" 
      	action = "create_user" modelAttribute = "user_details">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="full_name">Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="Name" id="full_name" class="form-control" 
                  	name="full_name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="user_email">Email</label>
                <div class="col-md-8">
                  <input type="email" placeholder="Email" id="user_email" class="form-control" 
                  	name="user_email">
                </div>
              </div>
              <div class="form-group level_div">
                <label class="col-md-4 control-label" for="usertype">Select User Type <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="usertype" id="usertype" class="form-control selecter_1" tabindex="-1" 
                  	required>
                    <option value="-1" selected disabled>Select</option>
                	<c:forEach var="role_list" items="${role_list}">
                		<option value = "${role_list.roleId}">${role_list.role}</option>
                	</c:forEach>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <img src="${pageContext.request.contextPath}/resources/img/upload_img.png" 
                    	id="img_userimage" style="height:160px;width: auto;" data-src="#"> <br />
                    <input type='file' id="input_userimage" accept="image/*" style = "display:none"
                    	onchange="displayUploadImg(this, 'img_userimage');">
                  </a>
                  <input type="hidden" id="userimage" name="userimage">
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="username">Username <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required placeholder="User name" maxlength="15" id="username" class="username form-control" name="username">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="password">Password <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="password" required maxlength="15" placeholder="Password" id="password" class="allow_password form-control" name="password">
                </div>
              </div>
              <div class="form-group level_div">
                <label class="col-md-4 control-label" for="status">Select Status <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="status" id="status" class="form-control selecter_1" tabindex="-1" required>
                    <option value="-1" selected disabled>Select</option>
                    <option value="1">Active</option>
                    <option value="2">Inactive</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="col-md-offset-2 col-md-10">
            <button class="btn btn-info" id="addaccountsubmit" type="submit">Create</button>
            <button class="btn btn-danger" type="reset">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#img_userimage").on('click', function() {
	    $("#input_userimage").trigger('click');
	    readImage($("#input_userimage"));
	  });	  

  formdata = new FormData();
  /*
  $("#imgAccount").change(function(){
    // readURL(this);
    var file = this.files[0];
    var file_size = file.size/1024/1024;
    if(file_size < 2){
      formdata.append("image", file);
      var xhr = new XMLHttpRequest();
      $('#message_account').empty();
      xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
          var jsonData = JSON.parse(xhr.responseText);
          if(jsonData) {
            if(jsonData['status'] == 'error'){
              $('#message_account').append( '<span class="text-danger">'+jsonData['msg']+'<span>' );
              $('#imgAccount').focus();
              return false;
            }
            if(jsonData['status'] == 'success'){
              $('#message_account').empty();
              $("#account_img").val(jsonData['ProfilePic']);
              $("#account_picture").attr("src", jsonData['ProfilePic']);
            }
          }
        }
      }
      xhr.open("POST","users/ajaxUpload");
      xhr.send(formdata);
    }else{
      alert('File too large. File must be less than 2 MB.');
    }
    });
  */
});
</script>
<script>
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