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

    <?= $form->field($model, 'tasnif_code')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\FoodType::find()->all(),'id','name_'.$lg),['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Units::find()->all(),'id','name_'.$lg),['prompt'=>Yii::t('client','Mahsulot birligini tanlang')]) ?>

    <?= $form->field($model, 'count')->textInput() ?>

    <?= $form->field($model, 'sample_box_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\SampleBoxes::find()->all(),'id','name_'.$lg),['prompt'=>Yii::t('client','Namuna o\'ramini tanlang')]) ?>

    <?= $form->field($model, 'sample_condition_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\SampleConditions::find()->all(),'id','name_'.$lg)) ?>

    <?= $form->field($model, 'total_amount')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'verification_sample')->textInput() ?>

    <?= $form->field($model, 'producer')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'serial_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'manufacture_date')->textInput() ?>

    <?= $form->field($model, 'sell_by')->textInput() ?>

    <?= $form->field($model, 'coments')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sampling_date')->textInput() ?>

    <?= $form->field($model, 'send_sample_date')->textInput() ?>

    <?= $form->field($model, 'explanations')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'laboratory_test_type_id')->textInput() ?>

    <?= $form->field($model, 'created')->textInput() ?>

    <?= $form->field($model, 'updated')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('food', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
