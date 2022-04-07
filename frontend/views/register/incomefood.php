<?php

use common\models\SampleStatus;
use common\models\SampleTypes;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Sertificates */
/* @var $animal common\models\Animals */
/* @var $sample common\models\Samples */
/* @var $reg common\models\SampleRegistration */

$this->title = Yii::t('cp.sertificates', 'Namunalarni qabul qilish');
$this->params['breadcrumbs'][] = ['label' => Yii::t('cp.sertificates', 'Arizalar'), 'url' => ['regtest']];
$this->params['breadcrumbs'][] = ['label' => $reg->code, 'url' => ['regview', 'id' => $reg->id]];
$this->params['breadcrumbs'][] = $this->title
?>
    <div class="sertificates-update">

        <?php $form = ActiveForm::begin(); ?>

        <?= $model->samp_code?> <?= Yii::t('register','Raqamli namunani qabul qilish')?>
        <?php
            $lg = 'uz';
            if(Yii::$app->language == 'ru'){
                $lg = 'ru';
            }
        ?>
        <?= $form->field($cs,'status_id')->dropDownList(ArrayHelper::map(SampleStatus::find()->all(),'id','name_'.$lg))?>

        <?= $form->field($cs,'is_group')->checkbox()?>

        <?= $form->field($cs,'ads')->textInput()?>

        <?= $form->field($route,'director_id')->dropDownList(ArrayHelper::map($director,'id','name'),['prompt'=>Yii::t('test','Direktorni tanlang')])?>

        <?= $form->field($route,'leader_id')->dropDownList(ArrayHelper::map($lider,'id','name'),['prompt'=>Yii::t('test','Labaratoriya mudirini tanlang')])?>

        <div class="form-group">
            <?= Html::submitButton(Yii::t('cp.sertificates', 'Saqlash'), ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>


    </div>
