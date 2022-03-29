<?php

use common\models\FoodType;
use common\models\LaboratoryTestType;
use common\models\Regulations;
use common\models\TemplateFoodRegulations;
use common\models\TemplateUnitType;
use kartik\base\BootstrapInterface;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\bootstrap4\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\TemplateFood */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="template-food-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tasnif_code')->dropDownList(ArrayHelper::map(FoodType::find()->all(), 'id', 'name')) ?>

    <?= $form->field($model, 'laboratory_test_type_id')->dropDownList(ArrayHelper::map(LaboratoryTestType::find()->all(), 'id', 'name_uz')) ?>

    <?= $form->field($model, 'name_uz')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name_ru')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_uz')->textInput(['maxlength' => true]) ?>

    <?php
    $res = TemplateFoodRegulations::find()->select(['regulation_id'])->where(['template_id' => $model->id])->all();
    $arr = [];
    foreach ($res as $item) {
        $arr[] = $item->regulation_id;
    }
    ?>
    <?= $form->field($model, 'regulations[]')->widget(Select2::class,
        [
            'data' => ArrayHelper::map(Regulations::find()->asArray()->all(), 'id', 'name_uz'),
            'theme' => Select2::THEME_KRAJEE,
            'size' => BootstrapInterface::SIZE_MEDIUM,
            'value' => $arr,
            'options' => [
                'multiple' => true
            ]
        ])->label(Yii::t('cp', 'Normativ hujjatlar'))

    ?>

    <?= $form->field($model, 'unit_ru')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'type_id')->dropDownList(ArrayHelper::map(TemplateUnitType::find()->all(), 'id', 'name_uz')) ?>

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
