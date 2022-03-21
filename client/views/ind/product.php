<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\FoodSamplingCertificate */
/* @var $form yii\widgets\ActiveForm */
$this->title = Yii::t('client', 'Oziq-ovqat ekspertizasi uchun ariza');
?>

    <div class="food-sampling-certificate-form">

        <?php $form = ActiveForm::begin(); ?>

        <?php
        $lang = Yii::$app->language;
        if ($lang == 'ru') {
            $ads = 'ru';
        } elseif ($lang == 'oz') {
            $ads = 'cyr';
        } else {
            $ads = 'lot';
        }
        ?>

        <?php if($model->sampling_site) {

            $model->region = $model->samplingSite->soato0->region_id;
            $model->district = $model->samplingSite->soato0->district_id;

            ?>
                        <?= $form->field($model, 'region')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\RegionsView::find()->all(),'region_id','name_'.$ads),['prompt'=>Yii::t('cp.vetsites','Viloyatni tanlang')]) ?>

            <?= $form->field($model, 'district')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\DistrictView::find()->where(['region_id' => $model->samplingSite->soato0->region_id])->all(), 'district_id', 'name_' . $ads), ['prompt' => Yii::t('cp.vetsites', 'Tumanni tanlang')]) ?>
            <?= $form->field($model, 'soato')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\QfiView::find()->where(['district_id' => $model->samplingSite->soato0->district_id])->all(), 'MHOBT_cod', 'name_' . $ads), ['prompt' => Yii::t('cp.vetsites', 'QFYni tanlang')]) ?>
            <?= $form->field($model, 'sampling_site')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\VetSites::find()->where(['soato' => $model->samplingSite->soato0->qfi_id])->all(), 'id', 'name'), ['prompt' => Yii::t('cp.vetsites', 'Vet uchstkani tanlang')]) ?>

        <?php }else{ ?>
            <?= $form->field($model, 'region')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\RegionsView::find()->all(),'region_id','name_'.$ads),['prompt'=>Yii::t('cp.vetsites','Viloyatni tanlang')]) ?>

            <?= $form->field($model, 'district')->dropDownList([],['prompt'=>Yii::t('cp.vetsites','Tumanni tanlang')]) ?>
            <?= $form->field($model, 'soato')->dropDownList([],['prompt'=>Yii::t('cp.vetsites','QFYni tanlang')]) ?>
            <?= $form->field($model, 'sampling_site')->dropDownList([],['prompt'=>Yii::t('cp.vetsites','Vet uchstkani tanlang')]) ?>

        <?php }?>

        <?= $form->field($model, 'sampling_adress')->textInput(['maxlength' => true]) ?>


        <?= $form->field($model, 'sampler_person_pnfl')->textInput() ?>


        <?= $form->field($model, 'verification_pupose_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\VerificationPurposes::find()->all(),'id','name_uz'),['prompt'=>'Tekshirishdan maqsadni tanlang']) ?>


        <?= $form->field($model, 'sampling_date')->textInput(['type' => 'date']) ?>

        <?= $form->field($model, 'send_sample_date')->textInput(['type' => 'date']) ?>

        <?= $form->field($model, 'based_public_information')->dropDownList([0 => 'Yo\'q', 1 => 'Ha']) ?>

        <?= $form->field($model, 'message_number')->textInput() ?>

        <?= $form->field($pro, 'is_urget_test')->checkbox(['value' => 1]) ?>
        <?= $form->field($pro, 'expertise_type')->radioList([0 => Yii::t('client', 'Bepul'), 1 => Yii::t('client', 'Pullik')]) ?>
        <?= $form->field($pro, 'phone')->textInput() ?>


        <div class="form-group">
            <?= Html::submitButton(Yii::t('cp.food_sampling_certificate', 'Saqlash'), ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

<?php
$url_district = Yii::$app->urlManager->createUrl(['/site/get-district']);
$url_qfi = Yii::$app->urlManager->createUrl(['/site/get-qfi']);
$url_vetsites = Yii::$app->urlManager->createUrl(['/site/get-vet']);
$this->registerJs("
        $('#foodsamplingcertificate-region').change(function(){
            $.get('{$url_district}?id='+$('#foodsamplingcertificate-region').val()).done(function(data){
                $('#foodsamplingcertificate-district').empty();
                $('#foodsamplingcertificate-district').append(data);
            })        
        })
        $('#foodsamplingcertificate-district').change(function(){
            $.get('{$url_qfi}?id='+$('#foodsamplingcertificate-district').val()+'&regid='+$('#foodsamplingcertificate-region').val()).done(function(data){
                $('#foodsamplingcertificate-soato').empty();
                $('#foodsamplingcertificate-soato').append(data);
            })        
        })
        
         $('#foodsamplingcertificate-soato').change(function(){
            $.get('{$url_vetsites}?id='+$('#foodsamplingcertificate-soato').val()).done(function(data){
                $('#foodsamplingcertificate-sampling_site').empty();
                $('#foodsamplingcertificate-sampling_site').append(data);
            })        
        })
    ")
?>