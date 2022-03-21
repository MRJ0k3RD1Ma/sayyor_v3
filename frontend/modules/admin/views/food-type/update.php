<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\FoodType */

$this->title = Yii::t('food', 'Update Food Type: {name}', [
    'name' => $model->name,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('food', 'Food Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('food', 'Update');
?>
<div class="food-type-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
