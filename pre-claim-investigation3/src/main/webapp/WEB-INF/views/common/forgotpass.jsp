<?php
$base_url  = $this->config->item( 'base_url' );
$this->load->library('encrypt');
error_reporting(0);
$key    = $this->config->item( 'encryption_key' );
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>MIDASCOM | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?php echo $this->config->item('base_url'); ?>assets/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo $this->config->item('base_url'); ?>assets/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?php echo $this->config->item('base_url'); ?>assets/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo $this->config->item('base_url'); ?>assets/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?php echo $this->config->item('base_url'); ?>plugins/iCheck/square/blue.css">
  <link rel="stylesheet" href="<?php echo $this->config->item('base_url'); ?>assets/css/custom.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body id="login_pg_bg" class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <center>
    <a href="<?php echo $this->config->item('base_url'); ?>">
      <img src="<?php echo $base_url;?>assets/img/midascom-logo.png" class="img-responsive" alt="Midascom Logo">
    </a>
  </center>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Enter your email address below and we'll email your password.</p>

    <?php echo form_open( '#', 'class="form-signin" autocomplete="off"' ); ?>
      <?php 
      if( $this->session->flashdata( 'err_msg' ) ) { ?>
        <div class="text-danger">
            <?php echo $this->session->flashdata( 'err_msg' ); ?>
        </div>  
      <?php 
      } ?>
      <div class="form-group has-feedback">
        <?php
        $attr = array(
                    'class'         => 'form-control',
                    'autocomplete'  => 'off',
                    'id'            => 'useremail',
                    'name'          => 'useremail',
                    'placeholder'   => 'User Email',
                    'value'         => set_value('useremail'),
                );
        echo form_input( $attr );
        ?>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-4 col-offset-2">
          <a href="<?php echo $assetUrl; ?>login" id="back-btn" class="btn btn-default pull-right btn-block btn-flat">Back</a>
        </div>
        <div class="pull-right col-xs-4 col-offset-2">
          <?php
          $attr = array(
                        'class'         => 'btn btn-success pull-right btn-block btn-flat',
                        'id'            => 'login_submit',
                        'name'          => 'forgot_submit',
                        'content'       => 'Send',
                        'onClick'       => 'forgotValidate();'
                    );
          echo form_button( $attr );
          ?>
        </div>
        <!-- /.col -->
      </div>
    <?php echo form_close(); ?>
    <!-- /.social-auth-links -->
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
<script> var adminurl = '<?php echo $this->config->item('base_url'); ?>'; </script>
<!-- jQuery 3 -->
<script src="<?php echo $this->config->item('base_url'); ?>assets/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<?php echo $this->config->item('base_url'); ?>assets/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<?php echo $this->config->item('base_url'); ?>plugins/iCheck/icheck.min.js"></script>
<script src="<?php echo $this->config->item('base_url'); ?>assets/js/custom_1.js" type="text/javascript"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
