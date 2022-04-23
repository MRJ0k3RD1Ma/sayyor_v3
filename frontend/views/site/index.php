<?php

/* @var $this yii\web\View */

$this->title = Yii::t('client','Bosh sahifa');
?>

<div class="container-fluid">

    <?php if(\common\models\EmpPosts::isDirector(Yii::$app->user->id)){?>

        <?= $this->render('_director')?>

    <?php } ?>

</div>
