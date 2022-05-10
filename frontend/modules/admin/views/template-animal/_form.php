<?php

use common\models\Animaltype;
use common\models\Diseases;
use common\models\Regulations;
use common\models\StateList;
use common\models\TemplateAnimalRegulations;
use common\models\TemplateUnit;
use common\models\TestMethod;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\bootstrap4\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\TamplateAnimal */
/* @var $form yii\widgets\ActiveForm */
?>

    <div class="tamplate-animal-form">
        <div class="row">
            <?php $form = ActiveForm::begin(); ?>
            <?= $form->field($model, 'vet4')->textInput(['maxlength' => true]) ?>
            <?= $form->field($model, 'type_id')->dropDownList(
                ArrayHelper::map(Animaltype::find()->asArray()->all(), 'id', 'name_uz')
            ) ?>
            <?= $form->field($model, 'gender')->dropDownList([
                1 => 'Erkak',
                0 => 'Urg\'ochi'
            ]) ?>
            <?= $form->field($model, 'age')->textInput() ?>

            <?= $form->field($model, 'diseases_id')->dropDownList(
                ArrayHelper::map(Diseases::find()->asArray()->all(), 'id', 'name_uz')
            ) ?>
            <?php
            $res = TemplateAnimalRegulations::find()->select(['regulation_id'])->where(['template_id' => $model->id])->all();
            $arr = [];
            foreach ($res as $item) {
                $arr[] = $item->regulation_id;
            }
            ?>
            <?= $form->field($model, 'regulations[]')->widget(Select2::class,
                [
                    'data' => ArrayHelper::map(Regulations::find()->asArray()->all(), 'id', 'name_uz'),
                    'theme' => Select2::THEME_KRAJEE,
                    'size' => Select2::SIZE_MEDIUM,
                    'value' => $arr,
                    'options' => [
                        'multiple' => true
                    ]
                ])->label(Yii::t('cp', 'Normativ hujjatlar'))

            ?>

            <?= $form->field($model, 'test_method_id')->dropDownList(
                ArrayHelper::map(TestMethod::find()->asArray()->all(), 'id', 'name_uz')
            ) ?>

            <?= $form->field($model, 'name_uz')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'name_ru')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'unit_id')->dropDownList(
                ArrayHelper::map(TemplateUnit::find()->asArray()->all(), 'id', 'name_uz')
            ) ?>

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

                <?= $form->field($model, 'true')->dropDownList([0 => 'Yo\'q', 1 => 'Ha']) ?>
                <?= $form->field($model, 'true1')->dropDownList([0 => 'Yo\'q', 1 => 'Ha']) ?>
            </div>


            <?= $form->field($model, 'is_vaccination')->dropDownList([0 => 'Yo\'q', 1 => 'Ha', 2 => 'Baribir']) ?>

            <?= $form->field($model, 'dead_days')->textInput(['type' => 'number']) ?>

            <?= $form->field($model, 'creator_id')->hiddenInput(['value' => Yii::$app->user->identity->getId()])->label(false) ?>

            <?= $form->field($model, 'consent_id')->dropDownList(ArrayHelper::map(\common\models\Employees::find()->all(), 'id', 'name'), ['prompt' => Yii::t('cp', 'Tasdiqlovchini tanlang')]) ?>

            <!--Tasdiqlovchi kiritish keyinroq Abduraxmon aytgan roldagi odamga beriladi-->

            <?= $form->field($model, 'state_id')->dropDownList(
                ArrayHelper::map(StateList::find()->asArray()->all(), 'id', 'name')
            ) ?>
        </div>
        <div class="form-group">
            <?= Html::submitButton(Yii::t('app', 'Saqlash'), ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

    <style>
        .oraliq {
            display: block;
        }
    </style>
<?php
$url = Yii::$app->urlManager->createUrl(['/cp/template-animal/gettype']);
// minimal va maksimallarni aniqlashtirib ishlash kerak
$this->registerJs("
    $('#tamplateanimal-unit_id').change(function(){
//         alert($('#tamplateanimal-unit_id').val());
          $.get('{$url}?id='+$('#tamplateanimal-unit_id').val()).done(function(data){
              $('.oraliq').css('display','none');
              $('.istrue').css('display','none');
              $('.isfalse').css('display','block');
              if(data==4){
                  $('.isfalse').css('display','block');
                  $('.oraliq').css('display','block');
                  $('.istrue').css('display','none');
              }else if(data==2){
                  $('.oraliq').css('display','none');
                  $('.isfalse').css('display','none');
                  $('.istrue').css('display','block');
              }else{
                  $('.oraliq').css('display','none');
                  $('.istrue').css('display','none');
                  $('.isfalse').css('display','block');
              }
          })
    })
")

?>