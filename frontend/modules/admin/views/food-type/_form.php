<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\FoodType */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="food-type-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'parent_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\FoodType::find()->all(),'id','name'),['prompt'=>Yii::t('cp','Yuqori turuvchi toifani tanlang')]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('food', 'Saqlash'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
