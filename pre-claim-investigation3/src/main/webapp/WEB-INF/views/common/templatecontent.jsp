<%@page import="com.preclaim.config.Config" %>
<%@page import = "java.time.LocalDateTime" %>
<%@page import = "java.time.format.DateTimeFormatter" %>
<%
String W0DATE = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd MMMM yyyy hh:mm:ss a"));
%>
<jsp:include page="templateheader.jsp"/>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE BAR -->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <a href="${pageContext.request.contextPath}/dashboard">Home</a>
                    <i class="fa fa-circle"></i>
                </li>                
            </ul>
            <ul class="page-breadcrumb" style="margin-left: 20px;">
                <li><small><%=Config.version %></small></li>
            </ul>
            <div class="page-toolbar">
                <div id="dashboard-report-range" class="pull-right tooltips btn btn-sm" data-container="body" data-placement="bottom" data-original-title="<%=W0DATE %>" aria-describedby="tooltip324660">
                    <i class="icon-calendar"></i>&nbsp;
                    <span class="thin uppercase hidden-xs"><%=W0DATE %></span>&nbsp;
                </div>
            </div>
        </div>
        <jsp:include page="../app_user/app_user.jsp"></jsp:include>
        <!-- END PAGE BAR -->
        <!-- BEGIN PAGE TITLE-->
        <!-- END PAGE TITLE-->
        <!-- END PAGE HEADER-->
        <!-- 
        <div class="row">
        <?php 
        if( $this->session->flashdata( 'errorMSG' ) ) { ?>
            <script type="text/javascript">
                toastr.error("<?php echo $this->session->flashdata( 'errorMSG' ); ?>",'Error');
            </script>
        <?php 
        }
        if( $this->session->flashdata( 'successMSG' ) ) { ?>
            <script type="text/javascript">
                toastr.success("<?php echo $this->session->flashdata( 'successMSG' ); ?>",'Success');
            </script>
        <?php 
        } ?>
        </div>
        <div class="row">
        <?php 
        if( $this->session->flashdata( 'errorMSG2' ) ) { ?>
            <div class="col-xs-12 col-sm-12 margin_t10">
                <div class="alert alert-danger">
                    <?php echo $this->session->flashdata( 'errorMSG2' ); ?>
                </div>
            </div>
        <?php 
        }
        if( $this->session->flashdata( 'successMSG2' ) ) { ?>
            <div class="col-xs-12 col-sm-12 margin_t10">
                <div class="alert alert-success">
                    <?php echo $this->session->flashdata( 'successMSG2' ); ?>
                </div>
            </div>
        <?php 
        } ?>
        </div>
        <?php echo $content; ?>-->
    </div> 
    <!-- END CONTENT BODY -->
</div>
<!-- END CONTENT -->
<jsp:include page="templatefooter.jsp"/>