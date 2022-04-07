<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\TemplateFood */

$this->title = Yii::t('app', 'O\'zgartirish: {name}', [
    'name' => $model->name_uz,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shablonlar'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'O\'zgartirish');
?>
<div class="template-food-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
