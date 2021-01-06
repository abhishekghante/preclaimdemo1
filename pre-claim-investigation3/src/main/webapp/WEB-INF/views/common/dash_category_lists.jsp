<?php
defined('BASEPATH') OR exit('No direct script access allowed');
global $permission_arr;
?>
<div class="tab-pane active" id="tab_cat_pending">
    <!-- BEGIN: Actions -->
    <div class="mt-actions">
        <div class="mt-action">
            <div class="mt-action-body">
                <?php 
                if($pendingCatlist){
                    foreach ($pendingCatlist as $key => $pCatlist) {
                    ?>
                    <div class="mt-action-row">
                        <div class="mt-action-info ">
                            <div class="mt-action-details ">
                                <span class="mt-action-author"><?= substr($pCatlist->categoryNameEn,0,35); ?></span>
                            </div>
                        </div>
                        <div class="mt-action-datetime ">
                            <span class="mt-action-date"><?= date('d M',strtotime($pCatlist->createdDate)); ?></span>
                            <span class="mt-action-dot bg-green"></span>
                            <span class="mt=action-time"><?= date('h:i:s A',strtotime($pCatlist->createdDate)); ?> </span>
                        </div>
                        <div class="mt-action-buttons ">
                            <div class="btn-group btn-group-circle">
                                <button type="button" onClick="return updateDashCategoryStatus(<?=$pCatlist->categoryId; ?>,1);" class="btn btn-outline green btn-sm">Appove</button>
                                <button type="button" onClick="return updateDashCategoryStatus(<?=$pCatlist->categoryId; ?>,2);" class="btn btn-outline red btn-sm">Reject</button>
                              
                            </div>
                        </div>
                    </div>
                    <!-- 
                    <div class="mt-action-row">
                        <div class="mt-action-info ">
                            <div class="mt-action-details ">
                                <p class="mt-action-desc">No Categories Found</p>
                            </div>
                        </div>
                    </div>
                 -->
            </div>
        </div>
    </div>
    <!-- END: Actions -->
</div>
<div class="tab-pane" id="tab_cat_completed">
    <!-- BEGIN:Completed-->
    <div class="mt-actions">
        <div class="mt-action">
            <div class="mt-action-body">
                <?php 
                if($activeCatlist){
                    foreach ($activeCatlist as $key => $aCatlist) {
                    ?>
                    <div class="mt-action-row">
                        <div class="mt-action-info ">
                            <div class="mt-action-details ">
                                <span class="mt-action-author"><?= substr($aCatlist->categoryNameEn,0,35); ?></span>
                            </div>
                        </div>
                        <div class="mt-action-datetime ">
                            <span class="mt-action-date"><?= date('d M',strtotime($aCatlist->createdDate)); ?></span>
                            <span class="mt-action-dot bg-green"></span>
                            <span class="mt=action-time"><?= date('h:i:s A',strtotime($aCatlist->createdDate)); ?></span>
                        </div>
                    </div>
                    <?php
                    }
                }else{ ?>
                    <div class="mt-action-row">
                        <div class="mt-action-info ">
                            <div class="mt-action-details ">
                                <p class="mt-action-desc">No Categories Found</p>
                            </div>
                        </div>
                    </div>
                <?php
                }
                ?>
            </div>
        </div>
        <!-- END: Completed -->
    </div>
</div>