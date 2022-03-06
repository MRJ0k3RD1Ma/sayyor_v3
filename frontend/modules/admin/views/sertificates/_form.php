<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Sertificates */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sertificates-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'sert_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sert_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sert_date')->textInput(['type'=>'date']) ?>

    <?= $form->field($model, 'organization_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Organizations::find()->all(),'id','NAME_FULL')) ?>

    <?= $form->field($model, 'pnfl')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Individuals::find()->all(),'pnfl','name'),['prompt'=>'PNFLni tanlang']) ?>

    <?= $form->field($model, 'owner_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vet_site_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\VetSites::find()->all(),'id','name')) ?>

    <?= $form->field($model, 'operator')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Employees::find()->all(),'id','name')) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('cp.sertificates', 'Saqlash'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
