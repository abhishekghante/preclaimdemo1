<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl       = $this->config->item( 'base_url' );
$random_pass    = randomPassword();
?>
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
              <a href="<?= base_url(); ?>users" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
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
      <form novalidate="" id="add_account_form" role="form" method="post" class="form-horizontal">
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="full_name">Name <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Name" id="full_name" class="form-control" name="full_name">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="user_email">Email</label>
                <div class="col-md-8">
                  <input type="email" required="" placeholder="Email" id="user_email" class="form-control" name="user_email">
                </div>
              </div>
              <div class="form-group level_div">
                <label class="col-md-4 control-label" for="account_type">Select User Type <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="account_type" id="account_type" class="form-control selecter_1" tabindex="-1">
                    <option value="">Select</option>
                    <?php 
                    if($role_lists){
                      foreach ($role_lists as $roleInfo) {
                        if($this->session->userdata(SYS_SESSION_ID) != SUPER_ADMIN_ID && $roleInfo->role_code == 'SA001') {
                          continue;
                        }
                        ?><option value="<?php echo $roleInfo->roleId; ?>"><?= rawurldecode($roleInfo->role); ?></option><?php
                      }
                    }
                    ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <img src="<?php echo $assetUrl; ?>uploads/default_img.png" id="account_picture" style="height:160px;width: auto;" data-src="#" /> <br />
                    <input type='file' id="imgAccount" accept="image/*" />
                  </a>
                  <input type="hidden" id="account_img" name="account_img"/>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-4 control-label" for="username">Username <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="User name" maxlength="15" id="username" class="username form-control" name="username">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="password">Password <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" value="<?php echo $random_pass; ?>" maxlength="15" placeholder="Password" id="password" class="allow_password form-control" name="password">
                </div>
              </div>
              <div class="form-group level_div">
                <label class="col-md-4 control-label" for="status">Select Status <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="status" id="status" class="form-control selecter_1" tabindex="-1">
                    <option value="">Select</option>
                    <option value="1">Activate</option>
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
            <button class="btn btn-info" id="addaccountsubmit" onClick="return accountValidate();" type="button">Create</button>
            <button class="btn btn-danger" type="reset">Clear</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
  
  $("#account_picture").on('click', function() {
    $("#imgAccount").trigger('click');
  });
  formdata = new FormData();
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
      xhr.open("POST", adminurl+"users/ajaxUpload");
      xhr.send(formdata);
    }else{
      alert('File too large. File must be less than 2 MB.');
    }
    });
});
</script>