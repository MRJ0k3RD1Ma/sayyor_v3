<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Sertificates */
/* @var $ind common\models\Individuals */
/* @var $legal common\models\LegalEntities */
/* @var $form yii\widgets\ActiveForm */
?>

    <div class="sertificates-form">
        <?php
        $lang = Yii::$app->language;
        if($lang == 'ru'){
            $ads = 'ru';
        }elseif($lang=='oz'){
            $ads = 'cyr';
        }else{
            $ads = 'lot';
        }
        ?>
        <?php $form = ActiveForm::begin(['options'=>['enctype'=>'multipart/form-data']]); ?>

        <?= $form->field($model, 'sert_num')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'sert_date')->textInput(['type'=>'date']) ?>

        <?= $form->field($model, 'owner_name')->textInput(['maxlength' => true]) ?>


        <h4>Probani qabul qiluvchi vet uchaskani tanlang</h4>
        <?= $form->field($model, 'region')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\RegionsView::find()->all(),'region_id','name_'.$ads),['prompt'=>Yii::t('client','Viloyatni tanlang')]) ?>
        <?= $form->field($model, 'district')->dropDownList([]) ?>
        <?= $form->field($model, 'qfi')->dropDownList([]) ?>
        <?= $form->field($model, 'vet_site_id')->dropDownList([]) ?>

        <h3>Probalarni tekshiruvchi tashkilotni tanlang</h3>
        <?= $form->field($model, 'organization_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Organizations::find()->all(),'id','NAME_FULL'),['prompt'=>Yii::t('client','Tashkilotni tanlang')]) ?>

        <div class="form-group">
            <?= Html::submitButton(Yii::t('cp.sertificates', 'Saqlash'), ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>



<?php
$url_district = Yii::$app->urlManager->createUrl(['/site/get-district']);
$url_qfi = Yii::$app->urlManager->createUrl(['/site/get-qfi']);
$url_vet = Yii::$app->urlManager->createUrl(['/site/get-vet']);
$this->registerJs("
        $('#sertificates-region').change(function(){
            $.get('{$url_district}?id='+$('#sertificates-region').val()).done(function(data){
                $('#sertificates-district').empty();
                $('#sertificates-district').append(data);
            })        
        })
        $('#sertificates-district').change(function(){
            $.get('{$url_qfi}?id='+$('#sertificates-district').val()+'&regid='+$('#sertificates-region').val()).done(function(data){
                $('#sertificates-qfi').empty();
                $('#sertificates-qfi').append(data);
            })        
        })
        
        $('#sertificates-qfi').change(function(){
            $.get('{$url_vet}?id='+$('#sertificates-qfi').val()).done(function(data){
                $('#sertificates-vet_site_id').empty();
                $('#sertificates-vet_site_id').append(data);
            })        
        })
        
      
    ")
?>