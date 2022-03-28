<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\TemplateFood */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="template-food-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tasnif_code')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\FoodType::find()->all(),'id','name')) ?>

    <?= $form->field($model, 'laboratory_test_type_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\LaboratoryTestType::find()->all(),'id','name_uz')) ?>

    <?= $form->field($model, 'name_uz')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name_ru')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_uz')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_ru')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'type_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\TemplateUnitType::find()->all(),'id','name_uz')) ?>

    <?= $form->field($model, 'min')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'min_1')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'max')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'max_1')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ads')->textInput(['maxlength' => true]) ?>


    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
