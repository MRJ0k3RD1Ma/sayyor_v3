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
$this->params['breadcrumbs'][] = ['label' => $reg->code, 'url' => ['regview', 'id' => $reg->id]];
$this->params['breadcrumbs'][] = $this->title
?>
    <div class="sertificates-update">

        <?php $form = ActiveForm::begin(); ?>

        <?= $model->kod?> <?= Yii::t('register','Raqamli namunani qabul qilish')?>



        <div class="form-group">
            <?= Html::submitButton(Yii::t('cp.sertificates', 'Saqlash'), ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>


    </div>
