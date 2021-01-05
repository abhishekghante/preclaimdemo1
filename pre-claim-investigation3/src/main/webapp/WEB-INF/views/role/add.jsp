<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl       = $this->config->item( 'admin_url' );
global $permission_arr;
?>
<style type="text/css">
#imgspecialization { display:none;}
</style>
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-user font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Manage User Role</span>
        </div>
        <div class="actions">
            <div class="btn-group">
            </div>
        </div>
      </div>
    </div>

    <div class="box box-primary">
      <?php if( in_array( 'role/add', $permission_arr ) ) { ?>
      <div class="box-body">
          <div class="row">
            <div class="col-xs-12 col-sm-12">
              <div class="portlet">
                <div class="portlet-body form">
                    <form novalidate="" id="role_form" role="form" method="post" class="form-horizontal">
                        <div class="form-body" id="add_role_form">
                            <div class="form-group">
                              <label class="col-md-2 col-sm-2 control-label" for="role">Role Name <span class="text-danger">*</span></label>
                              <div class="col-md-4 col-sm-4">
                                <input type="text" required="" maxlength="30" placeholder="Enter Role Name" id="role" class="form-control" name="role">
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="col-md-2 col-sm-2 control-label" for="role_code">Role Code</label>
                              <div class="col-md-4 col-sm-4">
                                <input type="text" required="" maxlength="10" placeholder="Enter Role Code" id="role_code" class="form-control username" name="role_code">
                              </div>
                            </div>
                            <div class="col-md-offset-2 col-md-4 col-sm-4 text-right">
                              <button class="btn btn-sm btn-success" id="addrolesubmit" onClick="return addRole();" type="button">Add</button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="box-body" id="update_role_form">
                        </div>
                    </form>
                </div>
              </div>
            </div>
          </div>
        <div class="clearfix"></div>
      </div>
      <?php } ?>
      <div class="box-body">
        <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Role Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="role_lists">
                        <?php
                        if( $role_lists ) {
                            foreach ( $role_lists as $key => $value ) {
                              if($value->role_code == 'SA001') {
                                continue;
                              }
                                ?>
                                <tr>
                                    <td><?=rawurldecode( $value->role );?></td>
                                    <td>
                                        <?php 
                                        if($value->roleId != SUPER_ADMIN_ID){ ?>
                                          <?php 
                                          if( in_array( 'role/add', $permission_arr ) ) { ?>
                                          <a class="btn btn-warning btn-xs" href="javascript:;" onclick="return edit_role( '<?=$value->roleId;?>' );"><i class="fa fa-edit"></i></a> 
                                          <?php } ?>
                                          <?php if( in_array( 'role/delete', $permission_arr ) ) { ?>
                                         <a class="btn btn-danger btn-xs" href="javascript:;" onclick="return deleteRole( '<?=$value->roleId;?>' );"><i class="fa fa-trash"></i></a> 
                                         <?php
                                          }
                                        } ?>
                                       <?php if( in_array( 'role/permission', $permission_arr ) ) { ?>
                                       <a class="btn btn-success btn-xs" href="<?= base_url();?>users/permission/<?=$value->roleId;?>">Permission <i class="fa fa-plus"></i></a> 
                                       <?php } ?>
                                    </td>
                                </tr>
                                <?php
                            }
                        } else {
                            ?>
                            <tr><td colspan="2">No data to display.</td></tr>
                            <?php
                        }
                        ?>
                    </tbody>
                </table>
                </div>
              <div class="clearfix"></div>
            </div>
          </div>
      </div>
    </div>
  </div><!-- content -->
</div>
<script type="text/javascript">
    //Role Validation
    function addRole() {
      var role      = $.trim($('#role_form #role').val());
      $('#role').removeClass('has-error-2');
      if( role == "" ){
        $('#role').addClass('has-error-2');
        $('#role').focus();
        return false;
      }
      var data    = $( "#role_form" ).find( "select, textarea, input" ).serialize();
      $.ajax({
          type    : 'POST',
          url     : adminurl + 'users/addRole',
          data    : data,
          beforeSend: function() { 
            $("#addrolesubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#addrolesubmit").prop('disabled', true);
          },
          success : function( msg ) {
              if( msg == 1 ) {
                  toastr.success('User Role Added Successfully.','Success');
                  location.reload();
              } else {
                  toastr.error(msg,'Error');
              }
              $("#addrolesubmit").html('Add');
              $("#addrolesubmit").prop('disabled', false);
          }
      });
        return false;
    }
    //Edit Role
    function edit_role( roleId ) {
        var account_data    = 'roleId=' + roleId;
        $.ajax({
            type : "POST",
            url  : adminurl + 'users/edit_role',
            data : account_data,
            success: function( data ) { 
                $( '#add_role_form' ).hide();
                $( '#update_role_form' ).html( data );
            }
        });
    }
</script>