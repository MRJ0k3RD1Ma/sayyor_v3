<?php

use common\models\EmpPosts;
use common\models\RouteSert;
use common\models\RouteStatus;

?>

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
                <?php if(EmpPosts::isRegister(Yii::$app->user->identity->getId())):?>
                <li class="menu-title" data-key="t-menu">Registrator</li>

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
                <?php endif;?>
                <?php if(EmpPosts::isDirector(Yii::$app->user->identity->getId())):?>
                    <li class="menu-title" data-key="t-menu">Rahbar</li>
                    <?php
                    $lg = 'uz';
                    if(Yii::$app->language == 'ru'){
                        $lg = 'ru';
                    }
                    ?>
                    <li>
                        <a href="javascript: void(0);" class="has-arrow">
                            <i data-feather="sliders"></i>
                            <span data-key="t-tables"><?= Yii::t('app','Hayvon kasalliklari')?></span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="<?= Yii::$app->urlManager->createUrl(['/director/indexanimal'])?>" data-key="t-basic-tables">Barchasi
                                    <span class="badge badge-primary"><?= RouteSert::find()->where(['director_id'=>Yii::$app->user->id])->count('id')?></span>
                                </a></li>
                            <?php foreach (RouteStatus::find()->all() as $item):?>
                                <li><a href="<?= Yii::$app->urlManager->createUrl(['/director/indexanimal','status'=>$item->id])?>" data-key="t-basic-tables"><?= $item->{'name_'.$lg}?>
                                        <span class="badge badge-primary"><?= RouteSert::find()->where(['director_id'=>Yii::$app->user->id])->andWhere(['status_id'=>$item->id])->count('id')?></span>
                                    </a></li>
                            <?php endforeach;?>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript: void(0);" class="has-arrow">
                            <i data-feather="sliders"></i>
                            <span data-key="t-tables"><?= Yii::t('app','Oziq-ovqat havsizligi')?></span>
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="<?= Yii::$app->urlManager->createUrl(['/director/indexfood'])?>" data-key="t-basic-tables">Barchasi </a></li>
                            <?php foreach (RouteStatus::find()->all() as $item):?>
                                <li><a href="<?= Yii::$app->urlManager->createUrl(['/director/indexfood','status'=>$item->id])?>" data-key="t-basic-tables"><?= $item->{'name_'.$lg}?></a></li>
                            <?php endforeach;?>
                        </ul>
                    </li>
                <?php endif;?>
                <?php if(EmpPosts::isLeader(Yii::$app->user->identity->getId())):?>
                <li class="menu-title" data-key="t-menu">Labaratoriya mudiri</li>
                <?php
                    $lg = 'uz';
                    if(Yii::$app->language == 'ru'){
                        $lg = 'ru';
                    }
                ?>
                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="sliders"></i>
                        <span data-key="t-tables"><?= Yii::t('app','Hayvon kasalliklari')?></span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/leader/indexanimal'])?>" data-key="t-basic-tables">Barchasi
                                <span class="badge badge-primary"><?= RouteSert::find()->where(['leader_id'=>Yii::$app->user->id])->count('id')?></span>
                            </a></li>
                        <?php foreach (RouteStatus::find()->all() as $item):?>
                            <li><a href="<?= Yii::$app->urlManager->createUrl(['/leader/indexanimal','status'=>$item->id])?>" data-key="t-basic-tables"><?= $item->{'name_'.$lg}?>
                                    <span class="badge badge-primary"><?= RouteSert::find()->where(['leader_id'=>Yii::$app->user->id])->andWhere(['status_id'=>$item->id])->count('id')?></span>
                                </a></li>
                        <?php endforeach;?>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="sliders"></i>
                        <span data-key="t-tables"><?= Yii::t('app','Oziq-ovqat havsizligi')?></span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/leader/indexfood'])?>" data-key="t-basic-tables">Barchasi </a></li>
                        <?php foreach (RouteStatus::find()->all() as $item):?>
                            <li><a href="<?= Yii::$app->urlManager->createUrl(['/leader/indexfood','status'=>$item->id])?>" data-key="t-basic-tables"><?= $item->{'name_'.$lg}?></a></li>
                        <?php endforeach;?>
                    </ul>
                </li>
                <?php endif;?>
                <?php if(EmpPosts::isLabor(Yii::$app->user->identity->getId())):?>
                <li class="menu-title" data-key="t-menu">Labaratoriya</li>
                <?php
                $lg = 'uz';
                if(Yii::$app->language == 'ru'){
                    $lg = 'ru';
                }
                ?>
                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="sliders"></i>
                        <span data-key="t-tables"><?= Yii::t('app','Hayvon kasalliklari')?></span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/lab/indexanimal'])?>" data-key="t-basic-tables">Barchasi
                                <span class="badge badge-primary"><?= \common\models\RouteSert::find()->where(['executor_id'=>Yii::$app->user->id])->count('id')?></span>
                            </a></li>
                        <?php foreach (\common\models\RouteStatus::find()->all() as $item):?>
                            <li><a href="<?= Yii::$app->urlManager->createUrl(['/lab/indexanimal','status'=>$item->id])?>" data-key="t-basic-tables"><?= $item->{'name_'.$lg}?>
                                    <span class="badge badge-primary"><?= \common\models\RouteSert::find()->where(['executor_id'=>Yii::$app->user->id])->andWhere(['status_id'=>$item->id])->count('id')?></span>
                                </a></li>
                        <?php endforeach;?>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="sliders"></i>
                        <span data-key="t-tables"><?= Yii::t('app','Oziq-ovqat havsizligi')?></span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="<?= Yii::$app->urlManager->createUrl(['/lab/indexfood'])?>" data-key="t-basic-tables">Barchasi </a></li>
                        <?php foreach (\common\models\RouteStatus::find()->all() as $item):?>
                            <li><a href="<?= Yii::$app->urlManager->createUrl(['/lab/indexfood','status'=>$item->id])?>" data-key="t-basic-tables"><?= $item->{'name_'.$lg}?></a></li>
                        <?php endforeach;?>
                    </ul>
                </li>
                <?php endif;?>
            </ul>

        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
