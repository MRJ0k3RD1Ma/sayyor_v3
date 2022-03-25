
<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title" data-key="t-menu">Menu</li>

                <li>
                    <a href="<?= Yii::$app->urlManager->createUrl(['/'])?>">
                        <i data-feather="home"></i>
                        <span data-key="t-dashboard"><?= Yii::t('app','Bosh sahifa')?></span>
                    </a>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="sliders"></i>
                        <span data-key="t-tables"><?= Yii::t('app','Yangi arizalar')?></span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/register/regtest'])?>" data-key="t-basic-tables"><?= Yii::t('menu','Hayvon kasalliklari tashhisi')?></a></li>
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/register/regproduct'])?>" data-key="t-data-tables"><?= Yii::t('menu','Oziq-ovqat havsizligi')?></a></li>
                    </ul>
                </li>


            </ul>

        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
