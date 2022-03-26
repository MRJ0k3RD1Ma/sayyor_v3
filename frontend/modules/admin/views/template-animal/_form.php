<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\TamplateAnimal */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="tamplate-animal-form">
<div class="row">
    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'type_id')->dropDownList(
        \yii\helpers\ArrayHelper::map(\common\models\Animaltype::find()->asArray()->all(), 'id', 'name_uz')
    ) ?>
    <?= $form->field($model, 'gender')->dropDownList([
        1 => 'Erkak',
        0 => 'Urg\'ochi'
    ]) ?>
    <?= $form->field($model, 'age')->textInput() ?>

    <?= $form->field($model, 'diseases_id')->dropDownList(
        \yii\helpers\ArrayHelper::map(\common\models\Diseases::find()->asArray()->all(), 'id', 'name_uz')
    ) ?>
    <?php
        $res = \common\models\TemplateAnimalRegulations::find()->select(['regulation_id'])->where(['template_id'=>$model->id])->all();
        $arr = [];
        foreach ($res as $item){
            $arr[] = $item->regulation_id;
        }
    ?>
    <?= $form->field($model, 'regulations[]')->widget(\kartik\select2\Select2::class,
        [
            'data' => \yii\helpers\ArrayHelper::map(\common\models\Regulations::find()->asArray()->all(), 'id', 'name_uz'),
            'theme' => \kartik\select2\Select2::THEME_KRAJEE,
            'size'=>\kartik\select2\Select2::SIZE_MEDIUM,
            'value'=>$arr,
            'options' => [
                 'multiple'=>true
            ]
        ])->label(Yii::t('cp','Normativ hujjatlar'))

    ?>

    <?= $form->field($model, 'test_method_id')->dropDownList(
        \yii\helpers\ArrayHelper::map(\common\models\TestMethod::find()->asArray()->all(), 'id', 'name_uz')
    ) ?>

    <?= $form->field($model, 'name_uz')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name_ru')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'unit_id')->dropDownList(
        \yii\helpers\ArrayHelper::map(\common\models\TemplateUnit::find()->asArray()->all(), 'id', 'name_uz')
    ) ?>

    <?= $form->field($model, 'min')->textInput(['maxlength' => true]) ?>

    <div class="oraliq">

        <?= $form->field($model, 'min_1')->textInput(['maxlength' => true]) ?>

    </div>

    <?= $form->field($model, 'max')->textInput(['maxlength' => true]) ?>

    <div class="oraliq">

        <?= $form->field($model, 'max_1')->textInput(['maxlength' => true]) ?>

    </div>

    <?= $form->field($model, 'is_vaccination')->dropDownList([0=>'Yo\'q',1=>'Ha',2=>'Baribir']) ?>

    <?= $form->field($model, 'dead_days')->textInput(['type'=>'number']) ?>

    <?= $form->field($model, 'creator_id')->hiddenInput(['value' => Yii::$app->user->identity->getId()])->label(false) ?>

   <!--Tasdiqlovchi kiritish keyinroq Abduraxmon aytgan roldagi odamga beriladi-->

    <?= $form->field($model, 'state_id')->dropDownList(
        \yii\helpers\ArrayHelper::map(\common\models\StateList::find()->asArray()->all(), 'id', 'name')
    ) ?>
</div>
    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<style>
    .oraliq{
        display: block;
    }
</style>

<?php
$url = Yii::$app->urlManager->createUrl(['/cp/template-animal/gettype']);
// minimal va maksimallarni aniqlashtirib ishlash kerak
$this->registerJs("
    $('#templateanimal-unit_id').change(function(){
    
    })
")

?>