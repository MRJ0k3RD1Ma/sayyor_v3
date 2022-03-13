<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\VetSites */

$this->title = Yii::t('cp.vetsites', 'O\'zgartirish: {name}', [
    'name' => $model->name,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('cp.vetsites', 'Vet uchastkalar'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('cp.vetsites', 'O\'zgartirish');
?>
<div class="vet-sites-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
