<?php

/* @var $this yii\web\View */

use common\models\EmpPosts;

$this->title = Yii::t('client','Bosh sahifa');
?>

<div class="container-fluid">

    <?php ?>
    <?php $uid = Yii::$app->user->id; if(EmpPosts::isDirector($uid)){?>

        <?= $this->render('_director')?>

    <?php }elseif(EmpPosts::isLeader($uid)){?>

        <?= $this->render('_lider')?>

    <?php }elseif(EmpPosts::isLabor($uid)){?>

        <?= $this->render('_lab')?>

    <?php } ?>

</div>
