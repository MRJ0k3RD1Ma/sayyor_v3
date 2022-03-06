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

    <?= $form->field($model, 'sert_id')->textInput(['maxlength' => true,'disabled'=>true]) ?>

    <?= $form->field($model, 'sert_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'sert_date')->textInput(['type'=>'date']) ?>


    <?= $form->field($model, 'ownertype')->radioList([1=>Yii::t('reg','Jismoniy shaxs'),2=>Yii::t('reg','Yuridik shaxs')]) ?>

    <div class="indiv" style="padding-left: 10px; border-left: 1px solid #f0f0f0;">

        <?= $form->field($ind, 'pnfl')->textInput(['maxlength' => 14,'oninput'=>"this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');",'required'=>true]) ?>

        <?= $form->field($ind, 'name')->textInput(['maxlength' => true]) ?>

        <?= $form->field($ind, 'surname')->textInput(['maxlength' => true]) ?>

        <?= $form->field($ind, 'middlename')->textInput(['maxlength' => true]) ?>

        <?php if($ind->soato_id){
            $ind->region  = $ind->soato->region_id;
            $ind->district = $ind->soato->district_id;
            ?>
            <?= $form->field($ind, 'region')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\RegionsView::find()->all(),'region_id','name_'.$ads),['prompt'=>Yii::t('cp.individuals','Viloyatni tanlang')]) ?>

            <?= $form->field($ind, 'district')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\DistrictView::find()->where(['region_id'=>$ind->soato->region_id])->all(),'district_id','name_'.$ads),['prompt'=>Yii::t('cp.individuals','Tumanni tanlang')]) ?>
            <?= $form->field($ind, 'soato_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\QfiView::find()->where(['district_id'=>$ind->soato->district_id])->all(),'MHOBT_cod','name_'.$ads),['prompt'=>Yii::t('cp.individuals','QFYni tanlang')]) ?>
        <?php }else{ ?>
            <?= $form->field($ind, 'region')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\RegionsView::find()->all(),'region_id','name_'.$ads),['prompt'=>Yii::t('cp.individuals','Viloyatni tanlang')]) ?>

            <?= $form->field($ind, 'district')->dropDownList([],['prompt'=>Yii::t('cp.individuals','Tumanni tanlang')]) ?>
            <?= $form->field($ind, 'soato_id')->dropDownList([],['prompt'=>Yii::t('cp.individuals','QFYni tanlang')]) ?>
        <?php }?>

        <?= $form->field($ind, 'adress')->textInput(['maxlength' => true]) ?>

        <?= $form->field($ind, 'passport')->textInput(['maxlength' => true]) ?>

    </div>

    <div class="legdiv" style="padding-left: 10px; border-left: 1px solid #f0f0f0; display: block;">
        <?= $form->field($legal,'inn')->textInput(['maxlength' => 9,'oninput'=>"this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');",'required'=>false])?>
    </div>
    <?= $form->field($model, 'owner_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vet_site_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\VetSites::find()->all(),'id','name')) ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('cp.sertificates', 'Saqlash'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>



<?php
$url_district = Yii::$app->urlManager->createUrl(['/register/get-district']);
$url_qfi = Yii::$app->urlManager->createUrl(['/register/get-qfi']);
$url_pnfl = Yii::$app->urlManager->createUrl(['/register/get-ind']);
$this->registerJs("
        $('#individuals-region').change(function(){
            $.get('{$url_district}?id='+$('#individuals-region').val()).done(function(data){
                $('#individuals-district').empty();
                $('#individuals-district').append(data);
            })        
        })
        $('#individuals-district').change(function(){
            $.get('{$url_qfi}?id='+$('#individuals-district').val()+'&regid='+$('#individuals-region').val()).done(function(data){
                $('#individuals-soato_id').empty();
                $('#individuals-soato_id').append(data);
            })        
        })
        
        $('#sertificates-ownertype').change(function(){
            if($('#sertificates-ownertype').val()==1){
                   $('#individuals-pnfl').prop('required',true);
                   $('#legalentities-inn').prop('required',false);
                   $('#legdiv').hide();
                   $('#indiv').show();
            }else{
                   $('#individuals-pnfl').prop('required',false);
                   $('#legalentities-inn').prop('required',true);
                   $('#indiv').hide();
                   $('#legdiv').show();
            }
        })
        
        
        $('#individuals-pnfl').keyup(function(){
            if($('#individuals-pnfl').val().length == 14){
                $.get('{$url_pnfl}?pnfl='+$('#individuals-pnfl').val()).done(function(data){
                    data = JSON.parse(data);
                    $('#individuals-name').val(data.value.name);
                    $('#individuals-surname').val(data.value.surname);
                    $('#individuals-middlename').val(data.value.middlename);
                    $('#individuals-passport').val(data.value.passport);
                    $('#individuals-adress').val(data.value.adress);
                    
                    $('#individuals-region').val(data.value.region_id).trigger('change');
                    setInterval(function () {
                       if($('#individuals-district').val()){clearInterval();}
                       else{
                        $('#individuals-district').val(data.value.district_id).trigger('change');
                       }
                    }, 500);
                    setInterval(function () {
                       if($('#individuals-soato_id').val()){clearInterval();}
                       else{
                        $('#individuals-soato_id').val(data.value.soato_id);
                       }
                    }, 500);
                    
                   
                })
            }
        })
    ")
?>