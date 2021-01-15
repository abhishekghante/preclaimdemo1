//LOGIN VALIDATION

//FORGOT PASSWORD
function forgotValidate() {
    var username    = $( '#username' ).val();
    
    var data = { 'username' : username }
    $.ajax({
        type    : 'POST',
        url     : 'changePassword',
        data    : data,
        success : function( msg ) {
            if( msg == "****" ) {
                toastr.success('Password has been sent to your e-mail address.',"success");
            } else {
                toastr.error(msg,"error");
            }
        }
    });
}