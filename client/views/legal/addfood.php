<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\FoodSamples */
/* @var $form yii\widgets\ActiveForm */
$this->title = Yii::t('food', 'Namuna qo\'shish');
$this->params['breadcrumbs'][] = ['label' => Yii::t('food', 'Namunalar ro\'yhati'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="food-samples-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php
        $lang = Yii::$app->language;
        $lg = 'uz';
        if($lang=='ru'){
            $ads = 'ru';
            $lg = 'ru';
        }elseif($lang == 'uz'){
            $ads = 'lot';
        }else{
            $ads = 'cyr';
        }
    ?>

    <?= $form->field($model, 'tasnif_code')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\FoodType::find()->all(),'id','name'),['maxlength' => true,'class'=>'form-control select2list'
    ,'prompt'=>Yii::t('client','Mahsulotni tanlang')]) ?>

    <?= $form->field($model, 'unit_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Units::find()->all(),'id','name_'.$lg),['prompt'=>Yii::t('client','Mahsulot birligini tanlang')]) ?>

    <?= $form->field($model, 'count')->textInput() ?>

    <?= $form->field($model, 'sample_box_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\SampleBoxes::find()->all(),'id','name_'.$lg),['prompt'=>Yii::t('client','Namuna o\'ramini tanlang')]) ?>
    <?= $form->field($model, '_country')->dropDownList(
        \yii\helpers\ArrayHelper::map(\common\models\Countres::find()->all(), 'id', 'name_' . $lg), ['prompt' => Yii::t('client', 'Davlatni tanlang'),'class'=>'form-control select2list']) ?>

    <?= $form->field($model, 'sample_condition_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\SampleConditions::find()->all(),'id','name_'.$lg),[
            'prompt'=>Yii::t('client','Namuna holatini tanlang')
    ]) ?>

    <?= $form->field($model, 'total_amount')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'verification_sample')->radioList([
            0=>Yii::t('client','Tanlanmagan'),
            1=>Yii::t('client','Tanlangan'),
    ]) ?>

    <?= $form->field($model, 'producer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'serial_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'manufacture_date')->textInput(['type'=>'date']) ?>

    <?= $form->field($model, 'sell_by')->textInput(['type'=>'date']) ?>

    <?= $form->field($model, 'coments')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'laboratory_test_type_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\LaboratoryTestType::find()->all(),'id','name_'.$lg),['prompt'=>Yii::t('client','Laboratoriya test turini tanlang')]) ?>


    <div class="form-group">
        <?= Html::submitButton(Yii::t('food', 'Saqlash'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
