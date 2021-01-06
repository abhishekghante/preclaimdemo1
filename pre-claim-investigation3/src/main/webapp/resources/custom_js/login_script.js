//LOGIN VALIDATION

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