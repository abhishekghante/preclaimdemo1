function updateMappingStatus( cmId, status ) {

    var table2 = $('#mapping_list').DataTable();
    
    $.ajax({
        type : 'POST',
        url  : adminurl + 'mapping/updateMappingStatus',
        data : { 'cmId' : cmId, 'status' : status },
        beforeSend: function() {
            $("#mappingStatus"+cmId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
        },
        success : function( msg ) {
            table2.ajax.reload();
        }
    });
    return false;
}
//DELETE GROUP
function deleteGroup( groupId, type ) {
    if(type == 1){
        var table2 = $('#active_group_list').DataTable();
    }else{
        var table2 = $('#pending_group_list').DataTable();
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+groupId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+groupId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'groups/deleteGroup',
            data : { 'groupId' : groupId },
            beforeSend: function() { 
                $("#continuemodal"+groupId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+groupId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+groupId).html('Yes');
                $("#continuemodal"+groupId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
function updateGroupStatus( groupId, type, status ) {
    if(type == 1){
        var table2 = $('#active_group_list').DataTable();
    }else{
        var table2 = $('#pending_group_list').DataTable();
    }
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to deactivate?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+groupId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+groupId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'groups/updateGroupStatus',
            data : { 'groupId' : groupId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+groupId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+groupId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+groupId).html('Yes');
                $("#continuemodal"+groupId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
//DELETE CHANNEL
function deleteChannel( channelId, type ) {
    if(type == 1){
        var table2 = $('#active_channel_list').DataTable();
    }else{
        var table2 = $('#pending_channel_list').DataTable();
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+channelId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+channelId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'channels/deleteChannel',
            data : { 'channelId' : channelId },
            beforeSend: function() { 
                $("#continuemodal"+channelId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+channelId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+channelId).html('Yes');
                $("#continuemodal"+channelId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
function updateChannelStatus( channelId, type, status ) {
    if(type == 1){
        var table2 = $('#active_channel_list').DataTable();
    }else{
        var table2 = $('#pending_channel_list').DataTable();
    }
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to deactivate?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+channelId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+channelId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'channels/updateChannelStatus',
            data : { 'channelId' : channelId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+channelId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+channelId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+channelId).html('Yes');
                $("#continuemodal"+channelId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
//DELETE REGION
function deleteRegion( regionId, type ) {
    if(type == 1){
        var table2 = $('#active_region_list').DataTable();
    }else{
        var table2 = $('#pending_region_list').DataTable();
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+regionId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+regionId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'regions/deleteRegion',
            data : { 'regionId' : regionId },
            beforeSend: function() { 
                $("#continuemodal"+regionId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+regionId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+regionId).html('Yes');
                $("#continuemodal"+regionId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
function updateRegionStatus( regionId, type, status ) {
    if(type == 1){
        var table2 = $('#active_region_list').DataTable();
    }else{
        var table2 = $('#pending_region_list').DataTable();
    }
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to deactivate?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+regionId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+regionId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'regions/updateRegionStatus',
            data : { 'regionId' : regionId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+regionId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+regionId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+regionId).html('Yes');
                $("#continuemodal"+regionId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
//DELETE CATEGORY
function deleteCategory( categoryId, type ) {
    if(type == 1){
        var table2 = $('#active_category_list').DataTable();
    }else{
        var table2 = $('#pending_category_list').DataTable();
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+categoryId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+categoryId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'category/deleteCategory',
            data : { 'categoryId' : categoryId },
            beforeSend: function() { 
                $("#continuemodal"+categoryId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+categoryId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+categoryId).html('Yes');
                $("#continuemodal"+categoryId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
        return false;
    });
}
function updateCategoryStatus( categoryId, type, status ) {
    if(type == 1){
        var table2 = $('#active_category_list').DataTable();
    }else{
        var table2 = $('#pending_category_list').DataTable();
    }
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to deactivate?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+categoryId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+categoryId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'category/updateCategoryStatus',
            data : { 'categoryId' : categoryId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+categoryId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+categoryId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+categoryId).html('Yes');
                $("#continuemodal"+categoryId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
//DELETE BANNER
function deleteBanner( bannerId, type ) {
    if(type == 1){
        var table2 = $('#active_banner_list').DataTable();
    }else{
        var table2 = $('#pending_banner_list').DataTable();
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+bannerId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+bannerId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'banner/deleteBanner',
            data : { 'bannerId' : bannerId },
            beforeSend: function() {
                $("#continuemodal"+bannerId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+bannerId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+bannerId).html('Yes');
                $("#continuemodal"+bannerId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
        return false;
    });
}
function updateBannerStatus( bannerId, type, status ) {
    if(type == 1){
        var table2 = $('#active_banner_list').DataTable();
    }else{
        var table2 = $('#pending_banner_list').DataTable();
    }
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to deactivate?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+bannerId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+bannerId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'banner/updateBannerStatus',
            data : { 'bannerId' : bannerId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+bannerId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+bannerId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+bannerId).html('Yes');
                $("#continuemodal"+bannerId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
//DELETE ADMIN USER
function deleteAdminUser( user_id ) {

    var table2 = $('#adminuser_list').DataTable();
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+user_id+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+user_id ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'users/deleteAdminUser',
            data : { 'user_id' : user_id },
            beforeSend: function() {
                $("#continuemodal"+user_id).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+user_id).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+user_id).html('Yes');
                $("#continuemodal"+user_id).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
        return false;
    });
}
//DELETE USER ROLE
function deleteRole( roleId ) {

    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+roleId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+roleId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'users/deleteRole',
            data : { 'roleId' : roleId },
            beforeSend: function() {
                $("#continuemodal"+roleId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+roleId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+roleId).html('Yes');
                $("#continuemodal"+roleId).prop('disabled', false);
                $('#small_modal').modal('hide');
                location.reload();
            }
        });
        return false;
    });
}
//UPDATE ADMIN USER STATUS
function updateUserStatus( user_id, type, status ) {
    var table2 = $('#adminuser_list').DataTable();
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to deactivate?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+user_id+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+user_id ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'users/updateUserStatus',
            data : { 'user_id' : user_id, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+user_id).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+user_id).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+user_id).html('Yes');
                $("#continuemodal"+user_id).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
//DELETE APP USER
function deleteAppUser( appUserId ) {

    var table2 = $('#app_user_list').DataTable();
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+appUserId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+appUserId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'appUsers/deleteAppUser',
            data : { 'appUserId' : appUserId },
            beforeSend: function() {
                $("#continuemodal"+appUserId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+appUserId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+appUserId).html('Yes');
                $("#continuemodal"+appUserId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
        return false;
    });
}
function updateAppUserStatus( appUserId, type, status ) {
    var table2 = $('#app_user_list').DataTable();
    if(type == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to deactivate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+appUserId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+appUserId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'appUsers/updateAppUserStatus',
            data : { 'appUserId' : appUserId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+appUserId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+appUserId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+appUserId).html('Yes');
                $("#continuemodal"+appUserId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
//MESSAGE STATUS
function updateMessageStatus( msgId, type, status ) {
    if(type == 1){
        var table2 = $('#active_message_list').DataTable();
    }else{
        var table2 = $('#pending_message_list').DataTable();
    }
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to deactivate?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+msgId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+msgId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'messages/updateMessageStatus',
            data : { 'msgId' : msgId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+msgId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+msgId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+msgId).html('Yes');
                $("#continuemodal"+msgId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
    });
}
//DELETE MESSAGE
function deleteMessage( msgId, type ) {
    if(type == 1){
        var table2 = $('#active_message_list').DataTable();
    }else{
        var table2 = $('#pending_message_list').DataTable();
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_body' ).html( 'Do you really want to delete this record?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+msgId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+msgId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'messages/deleteMessage',
            data : { 'msgId' : msgId },
            beforeSend: function() {
                $("#continuemodal"+msgId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+msgId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+msgId).html('Yes');
                $("#continuemodal"+msgId).prop('disabled', false);
                $('#small_modal').modal('hide');
                table2.ajax.reload();
            }
        });
        return false;
    });
}
function updateDashMessageStatus( msgId, status ) {
    
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to Reject?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+msgId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+msgId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'messages/updateMessageStatus',
            data : { 'msgId' : msgId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+msgId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+msgId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+msgId).html('Yes');
                $("#continuemodal"+msgId).prop('disabled', false);
                $('#small_modal').modal('hide');
                ajaxDashMessage();
            }
        });
    });
}
function updateDashCategoryStatus( categoryId, status ) {
    
    if(status == 1){
        $( '#sm_modal_body' ).html( 'Do you really want to activate?' );
    }else{
        $( '#sm_modal_body' ).html( 'Do you really want to Reject?' );
    }
    $( '#small_modal' ).modal();
    $( '#sm_modal_title' ).html( 'Are you Sure?' );
    $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal'+categoryId+'" class="btn green">Yes</button>' );
    $( '#continuemodal'+categoryId ).click( function() {
        $.ajax({
            type : 'POST',
            url  : adminurl + 'category/updateCategoryStatus',
            data : { 'categoryId' : categoryId, 'status' : status },
            beforeSend: function() { 
                $("#continuemodal"+categoryId).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+categoryId).prop('disabled', true);
            },
            success : function( msg ) {
                $("#continuemodal"+categoryId).html('Yes');
                $("#continuemodal"+categoryId).prop('disabled', false);
                $('#small_modal').modal('hide');
                ajaxDashCategory();
            }
        });
    });
}
function ajaxDashMessage() {
    var data = {}
    $.ajax({
        type    : 'POST',
        url     : adminurl + 'dashboard/ajaxDashMessageList',
        data    : data,
        success : function( msg ) {
            $("#dash_message_lists").html(msg);
        }
    });
}
function ajaxDashCategory() {
    var data = {}
    $.ajax({
        type    : 'POST',
        url     : adminurl + 'dashboard/ajaxDashCategoryList',
        data    : data,
        success : function( msg ) {
            $("#dash_category_lists").html(msg);
        }
    });
}
//LOGIN VALIDATION
function change_passValidate() {
    var c_pass       = $( '#c_pass' ).val();
    var n_pass       = $( '#n_pass' ).val();
    var confirm_pass = $( '#confirm_pass' ).val();
    
    var data = { 'c_pass' : c_pass, 'n_pass': n_pass, 'confirm_pass' : confirm_pass }
    $.ajax({
        type    : 'POST',
        url     : adminurl + 'profile/change_passValidate',
        data    : data,
        beforeSend: function() {
            $("#changepasswordsubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#changepasswordsubmit").prop('disabled', true);
        },
        success : function( msg ) {
            $("#changepasswordsubmit").html('Change Password');
            $("#changepasswordsubmit").prop('disabled', false);
            if( msg == 1 ) {
                $("#alert_msg").html('<div class="alert alert-success">Password updated successfully</div>');
                $("#alert_msg").show().delay(5000).fadeOut();
            } else {
                $("#alert_msg").html('<div class="alert alert-danger">'+msg+'</div>');
                $("#alert_msg").show();
                $("#alert_msg").show().delay(5000).fadeOut();
            }
        }
    });
}
//CREATE/EDIT ACCOUNT
function accountValidate() {
    
    var full_name    = $.trim($('#add_account_form #full_name').val());
    var username     = $.trim($('#add_account_form #username').val());
    var user_email   = $.trim($('#add_account_form #user_email').val());
    var password     = $.trim($('#add_account_form #password').val());
    var account_img  = $.trim($('#add_account_form #account_img').val());
    var account_type = $.trim($('#add_account_form #account_type').val());
    var status       = $.trim($('#add_account_form #status').val());
    $('#full_name').removeClass('has-error-2');
    //$('#phone').removeClass('has-error-2');
    $('#username').removeClass('has-error-2');
    $('#password').removeClass('has-error-2');
    $('#user_email').removeClass('has-error-2');
    $('#status').removeClass('has-error-2');
    $('#account_type').removeClass('has-error-2');
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
    if( account_type == "" ){
        $('#account_type').addClass('has-error-2');
        $('#account_type').focus();
        return false;
    }
    if( status == "" ){
        $('#status').addClass('has-error-2');
        $('#status').focus();
        return false;
    }
    
    $.ajax({
        type    : 'POST',
        url     : adminurl + 'users/accountValidate',
        data    : {'full_name':full_name,'username':username,'user_email':user_email,
        "password":password,"account_type":account_type,"account_img":account_img,"status":status},
        beforeSend: function() { 
            $("#addaccountsubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#addaccountsubmit").prop('disabled', true);
        },
        success : function( msg ) {
            $("#addaccountsubmit").html('Create');
            $("#addaccountsubmit").prop('disabled', false);
            if( msg == 1 ) {
                window.location.href = adminurl + "users";
            } else {
                toastr.error(msg,'Error');
                //$("#alert_msg").html('<div class="alert alert-danger">'+msg+'</div>');
                //$("#alert_msg").show().delay(5000).fadeOut();
            }
        }
    });
}

function updateAccountValidate() {
    var full_name    = $.trim($('#edit_account_form #full_name').val());
    var username     = $.trim($('#edit_account_form #username').val());
    var user_email   = $.trim($('#edit_account_form #user_email').val());
    var password     = $.trim($('#edit_account_form #password').val());
    var account_img  = $.trim($('#edit_account_form #account_img').val());
    var account_type = $.trim($('#edit_account_form #account_type').val());
    var user_id      = $.trim($('#edit_account_form #user_id').val());
    var status       = $.trim($('#edit_account_form #status').val());
    $('#full_name').removeClass('has-error-2');
    $('#username').removeClass('has-error-2');
    $('#password').removeClass('has-error-2');
    $('#user_email').removeClass('has-error-2');
    $('#status').removeClass('has-error-2');
    $('#account_type').removeClass('has-error-2');
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
    if( account_type == "" ){
        $('#account_type').addClass('has-error-2');
        $('#account_type').focus();
        return false;
    }
    if( status == "" ){
        $('#status').addClass('has-error-2');
        $('#status').focus();
        return false;
    }
    
    $.ajax({
        type    : 'POST',
        url     : adminurl + 'users/updateAccountValidate',
        data    : {'full_name':full_name,'username':username,'user_email':user_email,
        "password":password,"account_type":account_type,"user_id":user_id,"account_img":account_img,"status":status},
        beforeSend: function() { 
            $("#editaccountsubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
            $("#editaccountsubmit").prop('disabled', true);
        },
        success : function( msg ) {
            $("#editaccountsubmit").html('Update');
            $("#editaccountsubmit").prop('disabled', false);
            if( msg == 1 ) {
                window.location.href = adminurl + "users";
            } else {
                toastr.error(msg,'Error');
                //$("#alert_msg").html('<div class="alert alert-danger">'+msg+'</div>');
                //$("#alert_msg").show().delay(5000).fadeOut();
            }
        }
    });
}



$(document).ready(function() {

    $(document).on('change', '.select_box', function() {
        $("#company_branch option:selected").prop("selected", false);
    });
    $('.username').keypress(function (e) {
        var regex = new RegExp("^[a-zA-Z0-9_]+$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
            return true;
        }
        e.preventDefault();
        return false;
    });
    $('.allow_password').keypress(function (e) {
        var regex = new RegExp("^[a-zA-Z0-9_!@#$&()]+$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
            return true;
        }
        e.preventDefault();
        return false;
    });
    $('.allow_uuid').keypress(function (e) {
        var regex = new RegExp("^[a-zA-Z0-9-]+$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
            return true;
        }
        e.preventDefault();
        return false;
    });
    $('.number').keypress(function(event) {
        if (event.which == 8 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46) {
            return true;
        }else if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
});

$('.float-input').keypress(function(event) {
      if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
        event.preventDefault();
      } else {
           var entered_value = $(this).val();
          var regexPattern = /^\d{0,8}(\.\d{1,2})?$/; 
          if(regexPattern.test(entered_value)) {
              $(this).css('background-color', 'white');
              $('.err-msg').html('');
          } else {
              $(this).css('background-color', 'red');
              $('.err-msg').html('Enter a valid Decimal Number');
          }
      }
});

