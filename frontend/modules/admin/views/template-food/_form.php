<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\TemplateFood */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="template-food-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tasnif_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'laboratory_test_type_id')->textInput() ?>

    <?= $form->field($model, 'name_uz')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name_ru')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_uz')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_ru')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'type_id')->textInput() ?>

    <?= $form->field($model, 'min')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'min_1')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'max')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'max_1')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ads')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'creator_id')->textInput() ?>

    <?= $form->field($model, 'consept_id')->textInput() ?>

    <?= $form->field($model, 'created')->textInput() ?>

    <?= $form->field($model, 'updated')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
