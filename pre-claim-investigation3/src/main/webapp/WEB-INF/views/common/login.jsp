<!DOCTYPE html>
<html lang="en">
  <!--<![endif]-->
  <!-- BEGIN HEAD -->
  <head>
      <meta charset="utf-8" />
      <title>Pre-Claim Investigation | Login</title>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta content="width=device-width, initial-scale=1" name="viewport" />
      <meta content="" name="description" />
      <meta content="" name="author" />
      <!-- BEGIN GLOBAL MANDATORY STYLES -->
      <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
      <!-- END GLOBAL MANDATORY STYLES -->
      <!-- BEGIN PAGE LEVEL PLUGINS -->
      <link href="${pageContext.request.contextPath}/resources/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
      <!-- END PAGE LEVEL PLUGINS -->
      <!-- BEGIN THEME GLOBAL STYLES -->
      <link href="${pageContext.request.contextPath}/resources/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
      <!-- END THEME GLOBAL STYLES -->
      <!-- BEGIN PAGE LEVEL STYLES -->
      <link href="${pageContext.request.contextPath}/resources/pages/css/login-4.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/resources/custom_css/custom.css" rel="stylesheet" type="text/css" />
      <!-- END PAGE LEVEL STYLES -->
      <!-- BEGIN THEME LAYOUT STYLES -->
      <!-- END THEME LAYOUT STYLES -->
      <script> 
      	var adminurl = '{pageContext.request.contextPath}/login'; 
      </script>
      <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" />
    </head>
  <!-- END HEAD -->
  <body class=" login">
      <!-- BEGIN LOGO -->
      <div class="logo">
          <a href="javascript:;">
            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" />
          </a>
      </div>
      <!-- END LOGO -->
      <!-- BEGIN LOGIN -->
      <div class="content">
          <!-- BEGIN LOGIN FORM -->
          <form>
              <h3 class="form-title">Login to your account</h3>
              <div class="alert alert-danger display-hide">
                  <button class="close" data-close="alert"></button>
                  <span> Enter any username and password. </span>
              </div>
             
              <div class="form-group">
                  <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                  <label class="control-label visible-ie8 visible-ie9">Username</label>
                  <div class="input-icon">
                    <i class="fa fa-user"></i>
                    <input type="text" class="form-control placeholder-no-fix" autocomplete="off" id="username" name="username" placeholder="Username" value="">
                  </div>
              </div>
              <div class="form-group">
                  <label class="control-label visible-ie8 visible-ie9">Password</label>
                  <div class="input-icon">
                    <i class="fa fa-lock"></i>
                    <input type="password" class="form-control placeholder-no-fix" id="password" autocomplete="off" name="password" placeholder="Password">
                  </div>
              </div>
              <div class="form-actions">
                  <label class="checkbox">
                    <input type="checkbox" name="remember" value="1" /> Remember me </label>
                    <input type="button" id="login_submit" class="btn green pull-right" name="login_submit" onclick="loginValidate()" value="submit"/>
              </div>
              <div class="forget-password">
                <p class="text-center"></p>
              </div>
</form>
          <!-- END LOGIN FORM -->
      </div>
      <!-- END LOGIN -->
      <!-- BEGIN COPYRIGHT -->
      <div class="copyright" style="color:#7a1315;"> 2020 &copy; Pre-Claim Investigation. </div>
      <!-- END COPYRIGHT -->
      <!-- BEGIN CORE PLUGINS -->
      <script src="${pageContext.request.contextPath}/resources/global/plugins/jquery.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/js.cookie.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
      <!-- END CORE PLUGINS -->
      <!-- BEGIN PAGE LEVEL PLUGINS -->
      <script src="${pageContext.request.contextPath}/resources/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
      <!-- END PAGE LEVEL PLUGINS -->
      <!-- BEGIN THEME GLOBAL SCRIPTS -->
      <script src="${pageContext.request.contextPath}/resources/global/scripts/app.min.js" type="text/javascript"></script>
      <script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
      <!-- END THEME GLOBAL SCRIPTS -->
      <!-- BEGIN PAGE LEVEL SCRIPTS -->
      <script src="${pageContext.request.contextPath}/resources/custom_js/login_script.js" type="text/javascript"></script>
      <!-- END PAGE LEVEL SCRIPTS -->
      <!-- BEGIN THEME LAYOUT SCRIPTS -->
      <!-- END THEME LAYOUT SCRIPTS -->
  </body>

</html>