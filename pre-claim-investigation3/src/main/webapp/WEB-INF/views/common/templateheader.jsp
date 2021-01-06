<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>
<?php 
$assetUrl   = $this->config->item( 'base_url' );
$site_name  = $this->config->item( 'site_name' );
$user_id    = $this->session->userdata(SYS_SESSION_ID);
$userInfo   = $this->Adminusermodel->userInfo($user_id);
$upload_path_url = $this->config->item( 'upload_path_url' );
?>
<!DOCTYPE html>
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title><?php echo $site_name . ' | ' . $title; ?></title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="<?= $assetUrl; ?>assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= $assetUrl; ?>assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= $assetUrl; ?>assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!--<link href="<?= $assetUrl; ?>assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />-->
        <link href="<?= $assetUrl; ?>assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<?= $assetUrl; ?>assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<?= $assetUrl; ?>assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="<?= $assetUrl; ?>assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= $assetUrl; ?>assets/layouts/layout/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="<?= $assetUrl; ?>assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= $assetUrl; ?>assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= $assetUrl; ?>assets/custom_css/custom.css" rel="stylesheet" type="text/css" />
        <script src="<?= $assetUrl; ?>assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="<?= $assetUrl; ?>assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<?= $assetUrl; ?>assets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="<?= $assetUrl; ?>assets/img/favicon.ico" />
        <script> var adminurl = '<?= $this->config->item('base_url'); ?>'; </script>
      </head>
    <!-- END HEAD -->
    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="<?= base_url(); ?>dashboard">
                      <img src="<?= $assetUrl; ?>assets/img/logo.png" alt="logo" class="logo-default" />
                    </a>
                    <div class="menu-toggler sidebar-toggler"> </div>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!-- BEGIN NOTIFICATION DROPDOWN -->
                        <!-- BEGIN INBOX DROPDOWN -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        
                        <!-- END INBOX DROPDOWN -->
                        <!-- BEGIN USER LOGIN DROPDOWN -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-user">
                            <?php
							//error_reporting(E_ALL);
							//print_r($userInfo);
                            if($userInfo->user_image){
								$tmp = explode('/', $userInfo->user_image);
								$file_name = end($tmp);
								//(@GetImageSize($messgeInfo->msgImgThai_1))
								if (file_exists('uploads/user/thumbnail/'.$file_name)) {
                                  //$profileImg = $userInfo->user_image;
                                  $profileImg = $upload_path_url.'user/thumbnail/'.$file_name;
                                }else{
                                  $profileImg = $assetUrl.'assets/img/avatar.png';
                                }
                            }else{
                              $profileImg = $assetUrl.'assets/img/avatar.png';
                            }
                            ?>
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <img alt="<?= $userInfo->full_name; ?>" class="img-circle" src="<?= $profileImg; ?>" />
                                <span class="username username-hide-on-mobile">Welcome, <?=$this->session->userdata( 'USER_NAME' );?></span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-default">
                                <li><a href="<?= base_url(); ?>profile/edit"><i class="icon-user"></i> My Profile </a></li>
                                <li><a href="<?= base_url(); ?>logout"><i class="icon-key"></i> Log Out </a></li>
                            </ul>
                        </li>
                        <!-- END USER LOGIN DROPDOWN -->
                    </ul>
                </div>
                <!-- END TOP NAVIGATION MENU -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->

        <!-- BEGIN CONTAINER -->
        <div class="page-container">
          <!-- BEGIN SIDEBAR -->
          <?php $this->load->view( 'common/navigation', $navigation ); ?>
          <!-- END SIDEBAR -->