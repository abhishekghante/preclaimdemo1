<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$base_url         = $this->config->item( 'base_url' );
global $permission_arr;
$page             = $this->uri->segment(1);

$homeactive       = '';
$technicanactive  = ''; $appuseractive = '';
$settingactive    = ''; $liveactive = '';
if($page == ''){
  $homeactive     = 'active';
}else if($page == 'dashboard'){
  $homeactive     = 'active';
}else if($page == 'appUsers'){
  $appuseractive  = 'active';
}else if($page == 'liveTracking'){
  $liveactive  = 'active';
}else{
  
}
$grpaddactive  = ''; $grppedingactive = '';
$grpactactive  = ''; $groupactive = '';

if($page == 'groups'){
  $groupactive   = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'add' || $page2 == 'edit'){
    $grpaddactive = 'active';
  }else if($page2 == 'pendinglist'){
    $grppedingactive = 'active';
  }else if($page2 == 'activelist'){
    $grpactactive    = 'active';
  }
}
$chaddactive  = ''; $chpedingactive = '';
$chactactive  = ''; $channelactive   = '';
if($page == 'channels'){
  $channelactive   = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'add' || $page2 == 'edit'){
    $chaddactive = 'active';
  }else if($page2 == 'pendinglist'){
    $chpedingactive = 'active';
  }else if($page2 == 'activelist'){
    $chactactive    = 'active';
  }
}
$regaddactive  = ''; $regpedingactive = '';
$regactactive  = ''; $regionactive   = '';
if($page == 'regions'){
  $regionactive   = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'add' || $page2 == 'edit'){
    $regaddactive = 'active';
  }else if($page2 == 'pendinglist'){
    $regpedingactive = 'active';
  }else if($page2 == 'activelist'){
    $regactactive = 'active';
  }
}
$cataddactive  = ''; $catpedingactive = '';
$catactactive  = ''; $categoryactive  = '';
if($page == 'category'){
  $categoryactive  = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'add' || $page2 == 'edit'){
    $cataddactive = 'active';
  }else if($page2 == 'pendinglist'){
    $catpedingactive = 'active';
  }else if($page2 == 'activelist'){
    $catactactive    = 'active';
  }
}
$banaddactive  = ''; $banpedingactive = '';
$banactactive  = ''; $banneractive  = '';
if($page == 'banner'){
  $banneractive  = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'add' || $page2 == 'edit'){
    $banaddactive = 'active';
  }else if($page2 == 'pendinglist'){
    $banpedingactive = 'active';
  }else if($page2 == 'activelist'){
    $banactactive    = 'active';
  }
}
$msgaddactive  = ''; $msgpendingactive = '';
$msgactactive  = ''; $messageactive  = '';
$assignedactive = '';
if($page == 'messages'){
  $messageactive  = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'add' || $page2 == 'edit'){
    $msgaddactive = 'active';
  }else if($page2 == 'pendinglist'){
    $msgpendingactive = 'active';
  }else if($page2 == 'activelist'){
    $msgactactive    = 'active';
  }else if($page2 == 'assignedlist'){
    $assignedactive  = 'active';
  }
}
$mapaddactive   = ''; 
$mapactive      = '';
$maplistactive  = '';
if($page == 'mapping'){
  $mapactive  = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'add' || $page2 == 'edit'){
    $mapaddactive = 'active';
    $maplistactive  = '';
  }else if($page2 == 'mappinglist'){
    $maplistactive = 'active';
    $mapaddactive  = '';
  }
}
$usersactive    = '';
$userlistactive = '';
$adduseractive  = '';
$roleactive     = '';
if($page == 'users'){
  $usersactive  = 'active';
  $userlistactive = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'add' || $page2 == 'edit'){
    $adduseractive = 'active';
    $userlistactive = '';
  }else if($page2 == 'role' || $page2 == 'permission'){
    $roleactive   = 'active';
    $userlistactive = '';
  }
}
$reportactive     = ''; $likeactive   = '';
$reportlistactive = ''; $favouriteactive = '';
$msgstatusactive  = ''; $ratingactive = '';
$readmsgactive    = ''; $loginactive  = '';
if($page == 'report'){
  $reportactive  = 'active';
  $reportlistactive = 'active';
  $page2  = $this->uri->segment(2);
  if($page2 == 'messagesStatus'){
    $msgstatusactive  = 'active';
    $reportlistactive = '';
  }else if($page2 == 'readmessages'){
    $readmsgactive    = 'active';
    $reportlistactive = '';
  }else if($page2 == 'likemessage'){
    $likeactive       = 'active';
    $reportlistactive = '';
  }else if($page2 == 'favouritemessage'){
    $favouriteactive  = 'active';
    $reportlistactive = '';
  }else if($page2 == 'viewrating'){
    $ratingactive     = 'active';
    $reportlistactive = '';
  }else if($page2 == 'loginDetails'){
    $loginactive      = 'active';
    $reportlistactive = '';
  }
}
if($page == 'setting'){
  $settingactive  = 'active';
}
?>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper hide">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler"> </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <li class="nav-item start <?= $homeactive; ?>">
                <a href="<?= $base_url; ?>dashboard" class="nav-link">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                </a>
            </li>
            <?php if( in_array( 'appUsers', $permission_arr ) ) { ?>
            <li class="nav-item start <?= $appuseractive; ?>">
                <a href="<?= $base_url; ?>appUsers" class="nav-link">
                    <i class="icon-user"></i>
                    <span class="title">App Users Management</span>
                </a>
            </li>
            <?php } ?>

            <li class="nav-item <?= $liveactive; ?>">
                <a href="<?= $base_url; ?>liveTracking" class="nav-link">
                    <i class="icon-pointer"></i>
                    <span class="title">Live Tracking</span>
                </a>
            </li>

            <?php if( in_array( 'messages', $permission_arr ) ) { ?>
            <li class="nav-item <?= $messageactive; ?>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-envelope-letter"></i>
                  <span class="title">Case Management </span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">

                <li class="nav-item <?= $msgaddactive; ?>">
                  <a href="<?= $base_url; ?>messages/import" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Bulk case uploads
                  </a>
                </li>

                <?php if( in_array( 'messages/add', $permission_arr ) ) { ?>
                <li class="nav-item <?= $msgaddactive; ?>">
                  <a href="<?= $base_url; ?>messages/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Create Case
                  </a>
                </li>
                <?php } ?>

                <li class="nav-item <?= $msgpendingactive; ?>">
                  <a href="<?= $base_url; ?>messages/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Cases
                  </a>
                </li>
                <li class="nav-item <?= $msgactactive; ?>">
                  <a href="<?= $base_url; ?>messages/activelist" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Cases
                  </a>
                </li>
                <li class="nav-item <?= $assignedactive; ?>">
                  <a href="<?= $base_url; ?>messages/assignedlist" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Assigned Cases
                  </a>
                </li>
              </ul>
            </li>

            <li class="heading">
                <h3 class="uppercase">Settings</h3>
            </li>

            <?php if( in_array( 'users', $permission_arr ) || in_array( 'role', $permission_arr ) ) { ?>
            <li class="nav-item <?= $usersactive; ?>">
              <a href="<?= $base_url; ?>users" class="nav-link nav-toggle">
                  <i class="icon-user"></i>
                  <span class="title">Users</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <?php if( in_array( 'users', $permission_arr ) ) { ?>
                <?php if( in_array( 'users/add', $permission_arr ) ) { ?>
                <li class="nav-item <?= $adduseractive; ?>">
                  <a href="<?= $base_url; ?>users/add" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> Add User
                  </a>
                </li>
                <?php } ?>
                <li class="nav-item <?= $userlistactive; ?>">
                  <a href="<?= $base_url; ?>users" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> User Lists
                  </a>
                </li>
                <?php } ?>
                <?php if( in_array( 'role', $permission_arr ) ) { ?>
                <li class="nav-item <?= $roleactive; ?>">
                  <a href="<?= $base_url; ?>users/role" class="nav-link nav-toggle">
                    <i class="icon-user-following"></i> User Role
                  </a>
                </li>
                <?php } ?>
              </ul>
            </li>
            <?php } ?>
            
            <?php } ?>
            <?php if( in_array( 'groups', $permission_arr ) ) { ?>
            <li class="nav-item <?= $groupactive; ?>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-users"></i>
                  <span class="title">Groups</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <?php if( in_array( 'groups/add', $permission_arr ) ) { ?>
                <?php if($this->session->userdata(SYS_ROLE_ID) == SUPER_ADMIN_ID) { ?>
                <li class="nav-item <?= $grpaddactive; ?>">
                  <a href="<?= $base_url; ?>groups/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Groups
                  </a>
                </li>
                <?php } ?>
                <?php } ?>
                <li class="nav-item <?= $grppedingactive; ?>">
                  <a href="<?= $base_url; ?>groups/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Groups
                  </a>
                </li>
                <li class="nav-item <?= $grpactactive; ?>">
                  <a href="<?= $base_url; ?>groups/activelist" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Groups
                  </a>
                </li>
              </ul>
            </li>
            <?php } ?>
            <?php if( in_array( 'channels', $permission_arr ) ) { ?>
            <li class="nav-item <?= $channelactive; ?>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-support"></i>
                  <span class="title">Channels</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <?php if( in_array( 'channels/add', $permission_arr ) ) { ?>
                <?php if($this->session->userdata(SYS_ROLE_ID) == SUPER_ADMIN_ID) { ?>
                <li class="nav-item <?= $chaddactive; ?>">
                  <a href="<?= $base_url; ?>channels/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Channel
                  </a>
                </li>
                <?php } ?>
                <?php } ?>
                <li class="nav-item <?= $chpedingactive; ?>">
                  <a href="<?= $base_url; ?>channels/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Channels
                  </a>
                </li>
                <li class="nav-item <?= $chactactive; ?>">
                  <a href="<?= $base_url; ?>channels/activelist" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Channels
                  </a>
                </li>
              </ul>
            </li>
            <?php } ?>
            <?php if( in_array( 'regions', $permission_arr ) ) { ?>
            <li class="nav-item <?= $regionactive; ?>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-pointer"></i>
                  <span class="title">Regions</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <?php if( in_array( 'regions/add', $permission_arr ) ) { ?>
                <?php if($this->session->userdata(SYS_ROLE_ID) == SUPER_ADMIN_ID) { ?>
                <li class="nav-item <?= $regaddactive; ?>">
                  <a href="<?= $base_url; ?>regions/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Region
                  </a>
                </li>
                <?php } ?>
                <?php } ?>
                <li class="nav-item <?= $regpedingactive; ?>">
                  <a href="<?= $base_url; ?>regions/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Regions
                  </a>
                </li>
                <li class="nav-item <?= $regactactive; ?>">
                  <a href="<?= $base_url; ?>regions/activelist" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active Regions
                  </a>
                </li>
              </ul>
            </li>
            <?php } ?>
            <?php if( in_array( 'category', $permission_arr ) ) { ?>
            <li class="nav-item <?= $categoryactive; ?>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-grid"></i>
                  <span class="title">Type of investigations</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <?php if( in_array( 'category/add', $permission_arr ) ) { ?>
                <?php if($this->session->userdata(SYS_ROLE_ID) == SUPER_ADMIN_ID) { ?>
                <li class="nav-item <?= $cataddactive; ?>">
                  <a href="<?= $base_url; ?>category/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> investigations
                  </a>
                </li>
                <?php } ?>
                <?php } ?>
                <li class="nav-item <?= $catpedingactive; ?>">
                  <a href="<?= $base_url; ?>category/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Add investigations
                  </a>
                </li>
                <li class="nav-item <?= $catactactive; ?>">
                  <a href="<?= $base_url; ?>category/activelist" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Active investigations
                  </a>
                </li>
              </ul>
            </li>
            <?php } ?>
            <?php if( in_array( 'mapping', $permission_arr ) ) { ?>
            <li class="nav-item <?= $mapactive; ?>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-shuffle"></i>
                  <span class="title">Mapping</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <?php if( in_array( 'mapping/add', $permission_arr ) ) { ?>
                <?php if($this->session->userdata(SYS_ROLE_ID) == SUPER_ADMIN_ID) { ?>
                <li class="nav-item <?= $mapaddactive; ?>">
                  <a href="<?= $base_url; ?>mapping/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Mapping
                  </a>
                </li>
                <?php } ?>
                <?php } ?>
                <li class="nav-item <?= $maplistactive; ?>">
                  <a href="<?= $base_url; ?>mapping/mappinglist" class="nav-link nav-toggle">
                    <i class="icon-list"></i> Mapping List
                  </a>
                </li>
              </ul>
            </li>
            <?php } ?>
            
            <li class="heading">
                <h3 class="uppercase">----</h3>
            </li>

            <?php if( in_array( 'report', $permission_arr ) ) { ?>
            <li class="nav-item <?= $reportactive; ?>">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-folder-alt"></i>
                  <span class="title">Report</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <?php if( in_array( 'report/messagesStatus', $permission_arr ) ) { ?>
                <li class="nav-item <?= $msgstatusactive; ?>">
                  <a href="<?= $base_url; ?>report/messagesStatus" class="nav-link nav-toggle">
                    <i class="icon-bar-chart"></i> All investigations 

                  </a>
                </li>
                <?php } ?>
                <?php if( in_array( 'report/readmessages', $permission_arr ) ) { ?>
                <li class="nav-item <?= $readmsgactive; ?>">
                  <a href="<?= $base_url; ?>report/readmessages" class="nav-link nav-toggle">
                    <i class="icon-envelope-open"></i>  Assigned Investigators cases
                  </a>
                </li>
                <?php } ?>
                <?php if( in_array( 'report/likemessage', $permission_arr ) ) { ?>
                <li class="nav-item <?= $likeactive; ?>">
                  <a href="<?= $base_url; ?>report/likemessage" class="nav-link nav-toggle">
                    <i class="icon-like"></i> Investigators matched/unmatched client
                  </a>
                </li>
                <?php } ?>
                <?php if( in_array( 'report/favouritemessage', $permission_arr ) ) { ?>
                <li class="nav-item <?= $favouriteactive; ?>">
                  <a href="<?= $base_url; ?>report/favouritemessage" class="nav-link nav-toggle">
                    <i class="icon-docs"></i> Billing Reports
                  </a>
                </li>
                <?php } ?>
                <?php if( in_array( 'report/loginDetails', $permission_arr ) ) { ?>
                <li class="nav-item <?= $loginactive; ?>">
                  <a href="<?= $base_url; ?>report/loginDetails" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> Export data
                  </a>
                </li>
                <?php } ?>
              </ul>
            </li>
            <?php } ?>
            
            <li class="nav-item">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-grid"></i>
                  <span class="title">Billing management</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <li class="nav-item">
                  <a href="#" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Update billing
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Payment
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link nav-toggle">
                    <i class="icon-check"></i> Capturing payment details
                  </a>
                </li>
              </ul>
            </li>

            
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->