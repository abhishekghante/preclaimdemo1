<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<?php $this->load->view( 'common/templateheader', $header ); ?>
<?php
$settingInfo = $this->Adminusermodel->settingInfo(1);
if($settingInfo->system_version){
    $version = $settingInfo->system_version;
}else{
    $version = VERSION;
}
?>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
    <!-- BEGIN CONTENT BODY -->
    <div class="page-content">
        <!-- BEGIN PAGE HEADER-->
        <!-- BEGIN PAGE BAR -->
        <div class="page-bar">
            <ul class="page-breadcrumb">
                <li>
                    <a href="<?= base_url(); ?>dashboard">Home</a>
                    <i class="fa fa-circle"></i>
                </li>
                <?php echo $breadcrumb; ?>
            </ul>
            <ul class="page-breadcrumb" style="margin-left: 20px;">
                <li><small><?= $version; ?></small></li>
            </ul>
            <div class="page-toolbar">
                <div id="dashboard-report-range" class="pull-right tooltips btn btn-sm" data-container="body" data-placement="bottom" data-original-title="<?=date('jS M Y h:i:s A'); ?>" aria-describedby="tooltip324660">
                    <i class="icon-calendar"></i>&nbsp;
                    <span class="thin uppercase hidden-xs"><?=date('jS M Y h:i:s A'); ?></span>&nbsp;
                </div>
            </div>
        </div>
        <!-- END PAGE BAR -->
        <!-- BEGIN PAGE TITLE-->
        <!-- END PAGE TITLE-->
        <!-- END PAGE HEADER-->
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
        <?php echo $content; ?>
    </div>
    <!-- END CONTENT BODY -->
</div>
<!-- END CONTENT -->

<?php $this->load->view( 'common/templatefooter', $footer ); ?>