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
    <div class="isfalse">

        <?= $form->field($model, 'min')->textInput(['maxlength' => true]) ?>

        <div class="oraliq" style="display: none">

            <?= $form->field($model, 'min_1')->textInput(['maxlength' => true]) ?>

        </div>

        <?= $form->field($model, 'max')->textInput(['maxlength' => true]) ?>

        <div class="oraliq" style="display: none">

            <?= $form->field($model, 'max_1')->textInput(['maxlength' => true]) ?>

        </div>

    </div>

    <div class="istrue" style="display: none">

        <?= $form->field($model, 'true')->dropDownList([0=>'Yo\'q',1=>'Ha']) ?>
        <?= $form->field($model, 'true1')->dropDownList([0=>'Yo\'q',1=>'Ha']) ?>
    </div>

    <?= $form->field($model, 'ads')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model,'consept_id')->dropDownList(ArrayHelper::map(\common\models\Employees::find()->all(),'id','name'))?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Saqlash'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php
$this->registerJs("
    $('#templatefood-type_id').change(function(){
          $('.oraliq').hide();
          $('.istrue').hide();
          $('.isfalse').css('display','block');
          data = $('#templatefood-type_id').val();
          if(data == 4){
            $('.oraliq').show();
          }else if(data == 2){
             $('.istrue').css('display','block');
             $('.isfalse').css('display','none');
          }
    })
")
?>