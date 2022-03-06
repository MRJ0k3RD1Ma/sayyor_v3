
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
                        <span data-key="t-tables"><?= Yii::t('app','Namunalar')?></span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/register/indextest'])?>" data-key="t-basic-tables"><?= Yii::t('menu','Namunalar ro\'yhati')?></a></li>
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/register/createtest'])?>" data-key="t-data-tables"><?= Yii::t('menu','Namuna olish')?></a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="sliders"></i>
                        <span data-key="t-tables"><?= Yii::t('app','Mahsulot ekspertizasi')?></span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/register/indexproduct'])?>" data-key="t-basic-tables"><?= Yii::t('menu','Mahsulotlar ro\'yhati')?></a></li>
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/register/createproduct'])?>" data-key="t-data-tables"><?= Yii::t('menu','Mahsulot qabul qilish')?></a></li>
                    </ul>
                </li>


            </ul>

        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
