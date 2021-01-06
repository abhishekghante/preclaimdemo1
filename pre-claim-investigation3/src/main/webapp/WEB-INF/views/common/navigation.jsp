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
            <li class="nav-item start">
                <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                </a>
            </li>
            <li class="nav-item start">
                <a href="${pageContext.request.contextPath}/app_user/app_user" class="nav-link">
                    <i class="icon-user"></i>
                    <span class="title">App Users Management</span>
                </a>
            </li>

            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/liveTracking" class="nav-link">
                    <i class="icon-pointer"></i>
                    <span class="title">Live Tracking</span>
                </a>
            </li>

            <li class="nav-item">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-envelope-letter"></i>
                  <span class="title">Case Management </span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/messages/import" 
                  	class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Bulk case uploads
                  </a>
                </li>

                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/messages/add" 
                  	class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Create Case
                  </a>
                </li>
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/messages/pendinglist" 
                  	class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Cases
                  </a>
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/messages/list" 
                  	class="nav-link nav-toggle">
                    <i class="icon-check"></i>  Cases
                  </a>
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/messages/assignedlist" 
                  	class="nav-link nav-toggle">
                    <i class="icon-check"></i> Assigned Cases
                  </a>
                </li>
              </ul>
            </li>

            <li class="heading">
                <h3 class="uppercase">Settings</h3>
            </li>

            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/users" class="nav-link nav-toggle">
                  <i class="icon-user"></i>
                  <span class="title">Users</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/users/add" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> Add User
                  </a>
                </li>
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/users" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> User Lists
                  </a>
                </li>
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/users/role" class="nav-link nav-toggle">
                    <i class="icon-user-following"></i> User Role
                  </a>
                </li>
              </ul>
            </li>

            <li class="nav-item">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-users"></i>
                  <span class="title">Groups</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">

                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/groups/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Groups
                  </a>
                </li>

                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/groups/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Groups
                  </a>
                </li>

                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/groups/list" class="nav-link nav-toggle">
                    <i class="icon-check"></i>  Groups
                  </a>
                </li>
              </ul>
            </li>

            <li class="nav-item">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-support"></i>
                  <span class="title">Channels</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/channels/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Channel
                  </a>
                </li>
                <?php } ?>
                <?php } ?>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/channels/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Channels
                  </a>
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/channels/list" class="nav-link nav-toggle">
                    <i class="icon-check"></i>  Channels
                  </a>
                </li>
              </ul>
            </li>
            
            <li class="nav-item">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-pointer"></i>
                  <span class="title">Regions</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/regions/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Region
                  </a>
                </li>
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/regions/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Pending Regions
                  </a>
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/regions/list" class="nav-link nav-toggle">
                    <i class="icon-check"></i>  Regions
                  </a>
                </li>
              </ul>
            </li>
            
            <li class="nav-item">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-grid"></i>
                  <span class="title">Type of investigations</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/category/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> investigations
                  </a>
                </li>

                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/category/pendinglist" class="nav-link nav-toggle">
                    <i class="icon-clock"></i> Add investigations
                  </a>
                </li>
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/category/list" class="nav-link nav-toggle">
                    <i class="icon-check"></i>  investigations
                  </a>
                </li>
              </ul>
            </li>
            
            <li class="nav-item">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-shuffle"></i>
                  <span class="title">Mapping</span>
                  <span class="arrow "></span>
              </a>
              <ul class="sub-menu">
                <li class="nav-item ">
                  <a href="${pageContext.request.contextPath}/mapping/add" class="nav-link nav-toggle">
                    <i class="icon-plus"></i> Add Mapping
                  </a>
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/mapping/mappinglist" class="nav-link nav-toggle">
                    <i class="icon-list"></i> Mapping List
                  </a>
                </li>
              </ul>
            </li>
            
            <li class="heading">
                <h3 class="uppercase">----</h3>
            </li>

            <li class="nav-item">
              <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-folder-alt"></i>
                  <span class="title">Report</span>
                  <span class="arrow"></span>
              </a>
              <ul class="sub-menu">
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/report/messagesStatus" class="nav-link nav-toggle">
                    <i class="icon-bar-chart"></i> All investigations 

                  </a>
                </li>

                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/report/readmessages" class="nav-link nav-toggle">
                    <i class="icon-envelope-open"></i>  Assigned Investigators cases
                  </a>
                </li>

                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/report/likemessage" class="nav-link nav-toggle">
                    <i class="icon-like"></i> Investigators matched/unmatched client
                  </a>
                </li>
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/report/favouritemessage" class="nav-link nav-toggle">
                    <i class="icon-docs"></i> Billing Reports
                  </a>
                </li>
                
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/report/loginDetails" class="nav-link nav-toggle">
                    <i class="icon-user-follow"></i> Export data
                  </a>
                </li>
                
              </ul>
            </li>
           
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