<div class="form-group">
    <label class="col-md-2 col-sm-2 control-label" for="role">Role Name <span class="text-danger">*</span></label>
    <div class="col-md-4 col-sm-4">
      <input type="text" required="" maxlength="30" placeholder="Enter Role Name" id="role" value="" class="form-control" name="role">
    </div>
</div>
<div class="form-group">
    <label class="col-md-2 col-sm-2 control-label" for="role_code">Role Code</label>
    <div class="col-md-4 col-sm-4">
      <input type="text" required="" maxlength="10" placeholder="Enter Role Code" id="role_code" value="" class="form-control username" name="role_code">
    </div>
</div>
<div class="col-md-offset-2 col-md-4 col-sm-4 text-right">
    <input type="hidden" name="roleId" id="roleId" value="">
    <button class="btn btn-sm btn-primary" id="updaterolesubmit" onClick="return updateRole();" type="button">Update</button>
</div>
<div class="clearfix"></div>
<script type="text/javascript">
    function updateRole() {
        var role      = $.trim($('#update_role_form #role').val());
        $('#role').removeClass('has-error-2');
        if( role == "" ){
            $('#role').addClass('has-error-2');
            $('#role').focus();
            return false;
        }
        var data    = $( "#role_form" ).find( "select, textarea, input" ).serialize();
        $.ajax({
            type    : 'POST',
            url     : 'users/updateRole',
            data    : data,
            beforeSend: function() { 
                $("#updaterolesubmit").html('<img src="${pageContext.request.contextPath}resources/img/input-spinner.gif"> Loading...');
                $("#updaterolesubmit").prop('disabled', true);
            },
            success : function( msg ) {
                if( msg == 1 ) {
                    toastr.success('Role updated Successfully.','Success');
                    location.reload();
                } else {
                    toastr.error(msg,'Error');
                }
                $("#updaterolesubmit").html('Update');
                $("#updaterolesubmit").prop('disabled', false);
            }
        });
        return false;
    }
</script>