<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\TemplateFoodSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="template-food-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'tasnif_code') ?>

    <?= $form->field($model, 'laboratory_test_type_id') ?>

    <?= $form->field($model, 'name_uz') ?>

    <?= $form->field($model, 'name_ru') ?>

    <?php // echo $form->field($model, 'unit_uz') ?>

    <?php // echo $form->field($model, 'unit_ru') ?>

    <?php // echo $form->field($model, 'type_id') ?>

    <?php // echo $form->field($model, 'min') ?>

    <?php // echo $form->field($model, 'min_1') ?>

    <?php // echo $form->field($model, 'max') ?>

    <?php // echo $form->field($model, 'max_1') ?>

    <?php // echo $form->field($model, 'ads') ?>

    <?php // echo $form->field($model, 'creator_id') ?>

    <?php // echo $form->field($model, 'consept_id') ?>

    <?php // echo $form->field($model, 'created') ?>

    <?php // echo $form->field($model, 'updated') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
