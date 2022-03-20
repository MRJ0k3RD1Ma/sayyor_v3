<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Sertificates */
/* @var $animal common\models\Animals */
/* @var $sample common\models\Samples */
/* @var $reg common\models\SampleRegistration */

$this->title = Yii::t('cp.sertificates', 'Namunalarni qabul qilish');
$this->params['breadcrumbs'][] = ['label' => Yii::t('cp.sertificates', 'Arizalar'), 'url' => ['regtest']];
$this->params['breadcrumbs'][] = ['label' => $model->code, 'url' => ['regview', 'id' => $model->id]];
$this->params['breadcrumbs'][] = $this->title
?>
    <div class="sertificates-update">

        <?php $form = ActiveForm::begin(); ?>

        <?= $model->code?> <?= Yii::t('register','Raqamli namunani qabul qilish')?>
        <hr>
        <?php foreach ($cs as $item):?>
            <p style="font-weight: bold">№<?= $item->sample->kod?>, <?= Yii::t('register','Belgisi').': '.$item->sample->label?> - <?= $item->sample->sampleBox->name_uz?></p>

            <div class="row">
                <div class="col-md-4"><?= $form->field($item,'sample_status_id['.$item->sample_id.']')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\SampleStatus::find()->all(),'id','name_uz'))?></div>
            </div>

            <hr>
        <?php endforeach;?>

        <div class="form-group">
            <?= Html::submitButton(Yii::t('cp.sertificates', 'Saqlash'), ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>


    </div>
