//LOGIN VALIDATION
function loginValidate() {
    var username    = $( '#username' ).val();
    var password    = $( '#password' ).val();
    if(username == ''){
        toastr.error('Username is required.','Error');
    }
    if(password == ''){
        toastr.error('Password is required.','Error');
    }
    if(username && password){
        var data = { 'username':username,'password':password }
        $.ajax({
            type    : 'POST',
            url     : adminurl + 'login/validate',
            data    : data,
            beforeSend: function() { 
                $("#login_submit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
                $("#login_submit").prop('disabled', true);
            },
            success : function( msg ) {
                $("#login_submit").html('Login');
                $("#login_submit").prop('disabled', false);
                if( msg == 1 ) {
                    window.location.href = adminurl + "dashboard";
                }else{
                    toastr.error(msg,'Error');
                }
            }
        });
    }
}
//FORGOT PASSWORD
function forgotValidate() {
    var useremail    = $( '#useremail' ).val();
    
    var data = { 'useremail' : useremail }
    $.ajax({
        type    : 'POST',
        url     : adminurl + 'forgotpassword/validate',
        data    : data,
        success : function( msg ) {
            if( msg == 1 ) {
                alert('Password has been sent to your e-mail address.');
                window.location.href = adminurl + "login";
            } else if( msg == 2 ) {
                alert('Some Problems found in Sending Email.');
            } else {
                alert('Please enter registered email address.');
            }
        }
    });
}