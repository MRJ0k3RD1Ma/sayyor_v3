<?php

use yii\bootstrap4\ActiveForm;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Regulations */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="regulations-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name_uz')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name_ru')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'file')->widget(\kartik\file\FileInput::class,
        [
            'name' => 'file',
            'pluginOptions' => [
                'showPreview' => false,
                'showCaption' => true,
                'showRemove' => true,
                'showUpload' => false
            ]
        ]) ?>

    <?= $form->field($model, 'creator_id')->hiddenInput(['value' => Yii::$app->user->identity->getId()])->label(false) ?>

    <?= $form->field($model, 'status')->widget(\kartik\select2\Select2::class, [
        'data' => \yii\helpers\ArrayHelper::map(\common\models\StatusList::find()->asArray()->all(), 'id', 'name'),
        'bsVersion'=>'4.x',
        'theme' => \kartik\select2\Select2::THEME_CLASSIC,
        'size' => \kartik\select2\Select2::SIZE_MEDIUM ,
        'options' => [
        ]
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
