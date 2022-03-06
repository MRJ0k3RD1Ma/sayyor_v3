
<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title" data-key="t-menu">Menu</li>

                <li>
                    <a href="<?= Yii::$app->urlManager->createUrl(['/client/legal'])?>">
                        <i data-feather="home"></i>
                        <span data-key="t-dashboard"><?= Yii::t('client','Bosh sahifa')?></span>
                    </a>
                </li>

                <li>
                    <a href="<?= Yii::$app->urlManager->createUrl(['/client/legal/list'])?>">
                        <i data-feather="mail"></i>
                        <span data-key="t-dashboard"><?= Yii::t('client','Arizalar ro\'yhati')?></span>
                    </a>
                </li>

                <li>
                    <a href="<?= Yii::$app->urlManager->createUrl(['/site/create'])?>">
                        <i data-feather="mail"></i>
                        <span data-key="t-dashboard"><?= Yii::t('client','Ariza berish')?></span>
                    </a>
                </li>


            </ul>

        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
