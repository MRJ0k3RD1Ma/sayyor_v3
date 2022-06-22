<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\SampleBoxes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sample-boxes-form">

    <?php $form = ActiveForm::begin(); ?>


    <?= $form->field($model, 'name_uz')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name_ru')->textInput(['maxlength' => true]) ?>


    <div class="form-group">
        <?= Html::submitButton(Yii::t('cp.sample_boxes', 'Saqlash'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
