<%@page import = "java.util.ArrayList" %>
<%@page import="com.preclaim.models.Permission" %>
<%@page import="com.preclaim.config.CustomMethods"%>
<% 
ArrayList<Permission> role_permission = (ArrayList<Permission>) session.getAttribute("permission");
session.removeAttribute("permission");
if(role_permission == null)
	role_permission = new ArrayList<Permission>();
int roleId = Integer.parseInt((String)session.getAttribute("role_id"));
session.removeAttribute("role_id");
%>
<div class="row add-permission-form">
    <div class="col-xs-12 col-sm-12">
    	<div class="portlet box">
	      <div class="portlet-title">
	        <div class="caption">
	            <i class="icon-users font-green-sharp"></i>
	            <span class="caption-subject font-green-sharp sbold">Permission</span>
	        </div>
	        <div class="actions">
	          <div class="btn-group">
	            <a href="${pageContext.request.contextPath}/user/role" data-toggle="tooltip" title="Back" 
	            	class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" 
	            	style="margin-right: 5px;" data-original-title="Back">
	              <i class="fa fa-reply"></i>
	            </a>
	          </div>
	        </div>
	      </div>
	    </div>
        <div class="box box-primary">
            <div class="box-body">
            	<form>
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
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"appUsers")) {%>checked <%} %> name="appUsers[]" id="appUsers" class="allPLCheck0"  value = "appUsers"> <label for="appUsers">App Users</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"appUsers/index")) {%>checked <%} %> name="appUsers[]" id="appUsers_index" class="indPLCheck0" value="appUsers/index"> <label for="appUsers_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"appUsers/delete")) {%>checked <%} %> name="appUsers[]" id="appUsers_delete" class="indPLCheck0" value="appUsers/delete"> <label for="appUsers_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"appUsers/status")) {%>checked <%} %> name="appUsers[]" id="appUsers_status" class="indPLCheck0" value="appUsers/status"> <label for="appUsers_status">Approve Status</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"appUsers/import")) {%>checked <%} %> name="appUsers[]" id="appUsers_import" class="indPLCheck0" value="appUsers/import"> <label for="appUsers_import">Import</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"groups")) {%>checked <%} %> name="groups[]" id="groups" class="allPLCheck1" value="groups"> <label for="groups">Groups</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"groups/index")) {%>checked <%} %> name="groups[]" id="groups_index" class="indPLCheck1" value="groups/index"> <label for="groups_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"groups/add")) {%>checked <%} %> name="groups[]" id="groups_add" class="indPLCheck1" value="groups/add"> <label for="groups_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"groups/delete")) {%>checked <%} %> name="groups[]" id="groups_delete" class="indPLCheck1" value="groups/delete"> <label for="groups_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"groups/status")) {%>checked <%} %> name="groups[]" id="groups_status" class="indPLCheck1" value="groups/status"> <label for="groups_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"channels")) {%>checked <%} %> name="channels[]" id="channels" class="allPLCheck2" value="channels"> <label for="channels">Channels</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"channels/index")) {%>checked <%} %> name="channels[]" id="channels_index" class="indPLCheck2" value="channels/index"> <label for="channels_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"channels/add")) {%>checked <%} %> name="channels[]" id="channels_add" class="indPLCheck2" value="channels/add"> <label for="channels_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"channels/delete")) {%>checked <%} %> name="channels[]" id="channels_delete" class="indPLCheck2" value="channels/delete"> <label for="channels_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"channels/status")) {%>checked <%} %> name="channels[]" id="channels_status" class="indPLCheck2" value="channels/status"> <label for="channels_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"regions")) {%>checked <%} %> name="regions[]" id="regions" class="allPLCheck3" value="regions"> <label for="regions">Regions</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"regions/index")) {%>checked <%} %> name="regions[]" id="regions_index" class="indPLCheck3" value="regions/index"> <label for="regions_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"regions/add")) {%>checked <%} %> name="regions[]" id="regions_add" class="indPLCheck3" value="regions/add"> <label for="regions_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"regions/delete")) {%>checked <%} %> name="regions[]" id="regions_delete" class="indPLCheck3" value="regions/delete"> <label for="regions_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"regions/status")) {%>checked <%} %> name="regions[]" id="regions_status" class="indPLCheck3" value="regions/status"> <label for="regions_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"category")) {%>checked <%} %> name="category[]" id="category" class="allPLCheck4" value="category"> <label for="category">Category</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"category/index")) {%>checked <%} %> name="category[]" id="category_index" class="indPLCheck4" value="category/index"> <label for="category_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"category/add")) {%>checked <%} %> name="category[]" id="category_add" class="indPLCheck4" value="category/add"> <label for="category_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"category/delete")) {%>checked <%} %> name="category[]" id="category_delete" class="indPLCheck4" value="category/delete"> <label for="category_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"category/status")) {%>checked <%} %> name="category[]" id="category_status" class="indPLCheck4" value="category/status"> <label for="category_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"mapping")) {%>checked <%} %> name="mapping[]" id="mapping" class="allPLCheck5" value="mapping"> <label for="mapping">Mapping</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"mapping/index")) {%>checked <%} %> name="mapping[]" id="mapping_index" class="indPLCheck5" value="mapping/index"> <label for="mapping_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"mapping/add")) {%>checked <%} %> name="mapping[]" id="mapping_add" class="indPLCheck5" value="mapping/add"> <label for="mapping_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"mapping/status")) {%>checked <%} %> name="mapping[]" id="mapping_status" class="indPLCheck5" value="mapping/status"> <label for="mapping_status">UnMapping</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"banner")) {%>checked <%} %> name="banner[]" id="banner" class="allPLCheck6" value="banner"> <label for="banner">Banner</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"banner/index")) {%>checked <%} %> name="banner[]" id="banner_index" class="indPLCheck6" value="banner/index"> <label for="banner_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"banner/add")) {%>checked <%} %> name="banner[]" id="banner_add" class="indPLCheck6" value="banner/add"> <label for="banner_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"banner/delete")) {%>checked <%} %> name="banner[]" id="banner_delete" class="indPLCheck6" value="banner/delete"> <label for="banner_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"banner/status")) {%>checked <%} %> name="banner[]" id="banner_status" class="indPLCheck6" value="banner/status"> <label for="banner_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"messages")) {%>checked <%} %> name="messages[]" id="messages" class="allPLCheck7" value="messages"> <label for="messages">Broadcast</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"messages/index")) {%>checked <%} %> name="messages[]" id="messages_index" class="indPLCheck7" value="messages/index"> <label for="messages_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"messages/add")) {%>checked <%} %> name="messages[]" id="messages_add" class="indPLCheck7" value="messages/add"> <label for="messages_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"messages/delete")) {%>checked <%} %> name="messages[]" id="messages_delete" class="indPLCheck7" value="messages/delete"> <label for="messages_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"messages/status")) {%>checked <%} %> name="messages[]" id="messages_status" class="indPLCheck7" value="messages/status"> <label for="messages_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"users")) {%>checked <%} %> name="users[]" id="users" class="allPLCheck8" value="users"> <label for="users">Users</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"users/index")) {%>checked <%} %> name="users[]" id="users_index" class="indPLCheck8" value="users/index"> <label for="users_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"users/add")) {%>checked <%} %> name="users[]" id="users_add" class="indPLCheck8" value="users/add"> <label for="users_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"users/delete")) {%>checked <%} %> name="users[]" id="users_delete" class="indPLCheck8" value="users/delete"> <label for="users_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"users/status")) {%>checked <%} %> name="users[]" id="users_status" class="indPLCheck8" value="users/status"> <label for="users_status">Approve Status</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"role")) {%>checked <%} %> name="role[]" id="role" class="allPLCheck9" value="role"> <label for="role">Role</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"role/index")) {%>checked <%} %> name="role[]" id="role_index" class="indPLCheck9" value="role/index"> <label for="role_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"role/add")) {%>checked <%} %> name="role[]" id="role_add" class="indPLCheck9" value="role/add"> <label for="role_add">Add</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"role/delete")) {%>checked <%} %> name="role[]" id="role_delete" class="indPLCheck9" value="role/delete"> <label for="role_delete">Delete</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"role/status")) {%>checked <%} %> name="role[]" id="role_permission" class="indPLCheck9" value="role/permission"> <label for="role_permission">Add Permission</label>
			                    	</td>
			                    </tr>
			                    <tr>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"report")) {%>checked <%} %> name="report[]" id="report" class="allPLCheck10" value="report"> <label for="report">Report</label>
			                    	</td>
			                    	<td>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"report/index")) {%>checked <%} %> name="report[]" id="report_index" class="indPLCheck10" value="report/index"> <label for="report_index">View</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"report/messages")) {%>checked <%} %> name="report[]" id="report_messagesStatus" class="indPLCheck10" value="report/messagesStatus"> <label for="report_messagesStatus">Message Status</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"report/readmessages")) {%>checked <%} %> name="report[]" id="report_readmessages" class="indPLCheck10" value="report/readmessages"> <label for="report_readmessages">Read Messages</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"report/likemessage")) {%>checked <%} %> name="report[]" id="report_likemessage" class="indPLCheck10" value="report/likemessage"> <label for="report_likemessage">Like</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"report/favouritemessage")) {%>checked <%} %> name="report[]" id="report_favouritemessage" class="indPLCheck10" value="report/favouritemessage"> <label for="report_favouritemessage">Favourite</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"report/viewrating")) {%>checked <%} %> name="report[]" id="report_viewrating" class="indPLCheck10" value="report/viewrating"> <label for="report_viewrating">Rate App</label>
			                    		<input type="checkbox" <%if(CustomMethods.findString(role_permission,"report/loginDetails")) {%>checked <%} %> name="report[]" id="report_loginDetails" class="indPLCheck10" value="report/loginDetails"> <label for="report_loginDetails">Log In Details</label>
			                    	</td>
			                    </tr>
		                	</tbody>
                        </table>
                      </div>
                      <div style="padding-top: 10px;">
                      	<input type="hidden" name="roleId" id="roleId" value="<%= roleId%>">
                      	<button type="button" id="addPermissionBtn" onClick="return addPermission();" class="btn btn-success btn-sm">Submit</button>
		    			<a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/user/role">Back</a>
		    		  </div>	
                    </div>
                </div>
            </div>
        </div>
        </form>
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
        console.log(permission_form_data);
        $.ajax({
            type        : 'POST',
            url         : '../addPermission',
            data        : permission_form_data,
            beforeSend: function () {
            	$("#addPermissionBtn").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
            	$("#addPermissionBtn").prop('disabled', true);
            	$('#permission_table').css("opacity",".5");
            },
            success : function( msg ) {
            	$("#addPermissionBtn").html('Submit');
            	$("#addPermissionBtn").prop('disabled', false);
            	$('#permission_table').css("opacity","1");
                if( msg == "****" ) { 	
                    toastr.success(  'Permission added successfully','Success' );
                } 
                else {
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