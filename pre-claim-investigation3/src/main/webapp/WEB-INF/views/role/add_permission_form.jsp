<?php
$permission_arr     = array(); 
if( isset( $permission_list ) && !empty( $permission_list )  ) {
	foreach ( $permission_list as $key => $value ) {
		$permission_arr[ $value->module ] = $value->module;
	} 
}
?>
<div class="row add-permission-form">
    <div class="col-xs-12 col-sm-12">
    	<div class="portlet box">
	      <div class="portlet-title">
	        <div class="caption">
	            <i class="icon-users font-green-sharp"></i>
	            <span class="caption-subject font-green-sharp sbold"><?= rawurldecode( $roleInfo->role ); ?> - Permission</span>
	        </div>
	        <div class="actions">
	          <div class="btn-group">
	            <a href="<?= base_url(); ?>users/role" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
	              <i class="fa fa-reply"></i>
	            </a>
	          </div>
	        </div>
	      </div>
	    </div>
        <div class="box box-primary">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                      <div id="message_role"></div>
                      <div class="box-body table-responsive no-padding">
                        <table id="permission_table" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Module</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'appUsers', $permission_arr ) ) { ?> checked <?php } ?> name="appUsers[]" id="appUsers" class="allPLCheck0" value="appUsers"> <label for="appUsers">App Users</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'appUsers/index', $permission_arr ) ) { ?> checked <?php } ?> name="appUsers[]" id="appUsers_index" class="indPLCheck0" value="appUsers/index"> <label for="appUsers_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'appUsers/delete', $permission_arr ) ) { ?> checked <?php } ?> name="appUsers[]" id="appUsers_delete" class="indPLCheck0" value="appUsers/delete"> <label for="appUsers_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'appUsers/status', $permission_arr ) ) { ?> checked <?php } ?> name="appUsers[]" id="appUsers_status" class="indPLCheck0" value="appUsers/status"> <label for="appUsers_status">Approve Status</label>
			                    		<input type="checkbox" <?php if( in_array( 'appUsers/import', $permission_arr ) ) { ?> checked <?php } ?> name="appUsers[]" id="appUsers_import" class="indPLCheck0" value="appUsers/import"> <label for="appUsers_import">Import</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'groups', $permission_arr ) ) { ?> checked <?php } ?> name="groups[]" id="groups" class="allPLCheck1" value="groups"> <label for="groups">Groups</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'groups/index', $permission_arr ) ) { ?> checked <?php } ?> name="groups[]" id="groups_index" class="indPLCheck1" value="groups/index"> <label for="groups_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'groups/add', $permission_arr ) ) { ?> checked <?php } ?> name="groups[]" id="groups_add" class="indPLCheck1" value="groups/add"> <label for="groups_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'groups/delete', $permission_arr ) ) { ?> checked <?php } ?> name="groups[]" id="groups_delete" class="indPLCheck1" value="groups/delete"> <label for="groups_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'groups/status', $permission_arr ) ) { ?> checked <?php } ?> name="groups[]" id="groups_status" class="indPLCheck1" value="groups/status"> <label for="groups_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'channels', $permission_arr ) ) { ?> checked <?php } ?> name="channels[]" id="channels" class="allPLCheck2" value="channels"> <label for="channels">Channels</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'channels/index', $permission_arr ) ) { ?> checked <?php } ?> name="channels[]" id="channels_index" class="indPLCheck2" value="channels/index"> <label for="channels_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'channels/add', $permission_arr ) ) { ?> checked <?php } ?> name="channels[]" id="channels_add" class="indPLCheck2" value="channels/add"> <label for="channels_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'channels/delete', $permission_arr ) ) { ?> checked <?php } ?> name="channels[]" id="channels_delete" class="indPLCheck2" value="channels/delete"> <label for="channels_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'channels/status', $permission_arr ) ) { ?> checked <?php } ?> name="channels[]" id="channels_status" class="indPLCheck2" value="channels/status"> <label for="channels_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'regions', $permission_arr ) ) { ?> checked <?php } ?> name="regions[]" id="regions" class="allPLCheck3" value="regions"> <label for="regions">Regions</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'regions/index', $permission_arr ) ) { ?> checked <?php } ?> name="regions[]" id="regions_index" class="indPLCheck3" value="regions/index"> <label for="regions_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'regions/add', $permission_arr ) ) { ?> checked <?php } ?> name="regions[]" id="regions_add" class="indPLCheck3" value="regions/add"> <label for="regions_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'regions/delete', $permission_arr ) ) { ?> checked <?php } ?> name="regions[]" id="regions_delete" class="indPLCheck3" value="regions/delete"> <label for="regions_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'regions/status', $permission_arr ) ) { ?> checked <?php } ?> name="regions[]" id="regions_status" class="indPLCheck3" value="regions/status"> <label for="regions_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'category', $permission_arr ) ) { ?> checked <?php } ?> name="category[]" id="category" class="allPLCheck4" value="category"> <label for="category">Category</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'category/index', $permission_arr ) ) { ?> checked <?php } ?> name="category[]" id="category_index" class="indPLCheck4" value="category/index"> <label for="category_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'category/add', $permission_arr ) ) { ?> checked <?php } ?> name="category[]" id="category_add" class="indPLCheck4" value="category/add"> <label for="category_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'category/delete', $permission_arr ) ) { ?> checked <?php } ?> name="category[]" id="category_delete" class="indPLCheck4" value="category/delete"> <label for="category_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'category/status', $permission_arr ) ) { ?> checked <?php } ?> name="category[]" id="category_status" class="indPLCheck4" value="category/status"> <label for="category_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'mapping', $permission_arr ) ) { ?> checked <?php } ?> name="mapping[]" id="mapping" class="allPLCheck5" value="mapping"> <label for="mapping">Mapping</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'mapping/index', $permission_arr ) ) { ?> checked <?php } ?> name="mapping[]" id="mapping_index" class="indPLCheck5" value="mapping/index"> <label for="mapping_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'mapping/add', $permission_arr ) ) { ?> checked <?php } ?> name="mapping[]" id="mapping_add" class="indPLCheck5" value="mapping/add"> <label for="mapping_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'mapping/status', $permission_arr ) ) { ?> checked <?php } ?> name="mapping[]" id="mapping_status" class="indPLCheck5" value="mapping/status"> <label for="mapping_status">UnMapping</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'banner', $permission_arr ) ) { ?> checked <?php } ?> name="banner[]" id="banner" class="allPLCheck6" value="banner"> <label for="banner">Banner</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'banner/index', $permission_arr ) ) { ?> checked <?php } ?> name="banner[]" id="banner_index" class="indPLCheck6" value="banner/index"> <label for="banner_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'banner/add', $permission_arr ) ) { ?> checked <?php } ?> name="banner[]" id="banner_add" class="indPLCheck6" value="banner/add"> <label for="banner_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'banner/delete', $permission_arr ) ) { ?> checked <?php } ?> name="banner[]" id="banner_delete" class="indPLCheck6" value="banner/delete"> <label for="banner_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'banner/status', $permission_arr ) ) { ?> checked <?php } ?> name="banner[]" id="banner_status" class="indPLCheck6" value="banner/status"> <label for="banner_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'messages', $permission_arr ) ) { ?> checked <?php } ?> name="messages[]" id="messages" class="allPLCheck7" value="messages"> <label for="messages">Broadcast</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'messages/index', $permission_arr ) ) { ?> checked <?php } ?> name="messages[]" id="messages_index" class="indPLCheck7" value="messages/index"> <label for="messages_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'messages/add', $permission_arr ) ) { ?> checked <?php } ?> name="messages[]" id="messages_add" class="indPLCheck7" value="messages/add"> <label for="messages_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'messages/delete', $permission_arr ) ) { ?> checked <?php } ?> name="messages[]" id="messages_delete" class="indPLCheck7" value="messages/delete"> <label for="messages_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'messages/status', $permission_arr ) ) { ?> checked <?php } ?> name="messages[]" id="messages_status" class="indPLCheck7" value="messages/status"> <label for="messages_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'users', $permission_arr ) ) { ?> checked <?php } ?> name="users[]" id="users" class="allPLCheck8" value="users"> <label for="users">Users</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'users/index', $permission_arr ) ) { ?> checked <?php } ?> name="users[]" id="users_index" class="indPLCheck8" value="users/index"> <label for="users_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'users/add', $permission_arr ) ) { ?> checked <?php } ?> name="users[]" id="users_add" class="indPLCheck8" value="users/add"> <label for="users_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'users/delete', $permission_arr ) ) { ?> checked <?php } ?> name="users[]" id="users_delete" class="indPLCheck8" value="users/delete"> <label for="users_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'users/status', $permission_arr ) ) { ?> checked <?php } ?> name="users[]" id="users_status" class="indPLCheck8" value="users/status"> <label for="users_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'role', $permission_arr ) ) { ?> checked <?php } ?> name="role[]" id="role" class="allPLCheck9" value="role"> <label for="role">Role</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'role/index', $permission_arr ) ) { ?> checked <?php } ?> name="role[]" id="role_index" class="indPLCheck9" value="role/index"> <label for="role_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'role/add', $permission_arr ) ) { ?> checked <?php } ?> name="role[]" id="role_add" class="indPLCheck9" value="role/add"> <label for="role_add">Add</label>
			                    		<input type="checkbox" <?php if( in_array( 'role/delete', $permission_arr ) ) { ?> checked <?php } ?> name="role[]" id="role_delete" class="indPLCheck9" value="role/delete"> <label for="role_delete">Delete</label>
			                    		<input type="checkbox" <?php if( in_array( 'role/permission', $permission_arr ) ) { ?> checked <?php } ?> name="role[]" id="role_permission" class="indPLCheck9" value="role/permission"> <label for="role_permission">Add Permission</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'report', $permission_arr ) ) { ?> checked <?php } ?> name="report[]" id="report" class="allPLCheck10" value="report"> <label for="report">Report</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <?php if( in_array( 'report/index', $permission_arr ) ) { ?> checked <?php } ?> name="report[]" id="report_index" class="indPLCheck10" value="report/index"> <label for="report_index">View</label>
			                    		<input type="checkbox" <?php if( in_array( 'report/messagesStatus', $permission_arr ) ) { ?> checked <?php } ?> name="report[]" id="report_messagesStatus" class="indPLCheck10" value="report/messagesStatus"> <label for="report_messagesStatus">Message Status</label>
			                    		<input type="checkbox" <?php if( in_array( 'report/readmessages', $permission_arr ) ) { ?> checked <?php } ?> name="report[]" id="report_readmessages" class="indPLCheck10" value="report/readmessages"> <label for="report_readmessages">Read Messages</label>
			                    		<input type="checkbox" <?php if( in_array( 'report/likemessage', $permission_arr ) ) { ?> checked <?php } ?> name="report[]" id="report_likemessage" class="indPLCheck10" value="report/likemessage"> <label for="report_likemessage">Like</label>
			                    		<input type="checkbox" <?php if( in_array( 'report/favouritemessage', $permission_arr ) ) { ?> checked <?php } ?> name="report[]" id="report_favouritemessage" class="indPLCheck10" value="report/favouritemessage"> <label for="report_favouritemessage">Favourite</label>
			                    		<input type="checkbox" <?php if( in_array( 'report/viewrating', $permission_arr ) ) { ?> checked <?php } ?> name="report[]" id="report_viewrating" class="indPLCheck10" value="report/viewrating"> <label for="report_viewrating">Rate App</label>
			                    		<input type="checkbox" <?php if( in_array( 'report/loginDetails', $permission_arr ) ) { ?> checked <?php } ?> name="report[]" id="report_loginDetails" class="indPLCheck10" value="report/loginDetails"> <label for="report_loginDetails">Log In Details</label>
			                    	</td>
			                    </tr>
		                	</tbody>
                        </table>
                      </div>
                      <div style="padding-top: 10px;">
                      	<input type="hidden" name="roleId" id="roleId" value="<?=$roleId;?>">
                    	<button type="button" id="addPermissionBtn" onClick="return addPermission();" class="btn btn-success btn-sm">Submit</button>
		    			<a class="btn btn-danger btn-sm" href="<?php echo base_url(); ?>users/role">Back</a>
		    		  </div>	
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

	$( '.allPLCheck0' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck0' ).prop( "checked", true );
		} else {
			$( '.indPLCheck0' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck1' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck1' ).prop( "checked", true );
		} else {
			$( '.indPLCheck1' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck2' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck2' ).prop( "checked", true );
		} else {
			$( '.indPLCheck2' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck3' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck3' ).prop( "checked", true );
		} else {
			$( '.indPLCheck3' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck4' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck4' ).prop( "checked", true );
		} else {
			$( '.indPLCheck4' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck5' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck5' ).prop( "checked", true );
		} else {
			$( '.indPLCheck5' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck6' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck6' ).prop( "checked", true );
		} else {
			$( '.indPLCheck6' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck7' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck7' ).prop( "checked", true );
		} else {
			$( '.indPLCheck7' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck8' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck8' ).prop( "checked", true );
		} else {
			$( '.indPLCheck8' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck9' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck9' ).prop( "checked", true );
		} else {
			$( '.indPLCheck9' ).prop( 'checked', false );
		}
	});
	$( '.allPLCheck10' ).on( 'click', function() {
		if( $( this ).is( ':checked' ) ) {
			$( '.indPLCheck10' ).prop( "checked", true );
		} else {
			$( '.indPLCheck10' ).prop( 'checked', false );
		}
	});
   function addPermission() {
   		$('#permission_table').css("opacity",".5");
        var form_name            = $( '.add-permission-form' ).find( 'input, select, button, textarea' );
        var permission_form_data = form_name.serialize();
        $.ajax({
            type        : 'POST',
            url         : adminurl + 'users/addPermission',
            data        : permission_form_data,
            async       : false,
            dataType    : 'json',
            beforeSend: function () {
            	$("#addPermissionBtn").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            	$("#addPermissionBtn").prop('disabled', true);
            	$('#permission_table').css("opacity",".5");
            },
            success : function( msg ) {
                if( msg == 1 ) {
                    toastr.success(  'Permission added successfully','Success' );
                } else if ( msg == 2 ) {
                    toastr.error(  'Permission Already added','Error' );
                } else {
                    toastr.error(  'Error while adding Permission','Error' );
                }
                $("#addPermissionBtn").html('Submit');
              	$("#addPermissionBtn").prop('disabled', false);
              	$('#permission_table').css("opacity","");
            }
        });
        return false;
    }
</script>