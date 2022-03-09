<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\LaboratoryTestTypeSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="laboratory-test-type-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'id' => 'laboratory-test-type-grid-filters',
    ]); ?>

    <div class="card-header flex">
        <div></div>
        <div class="btns flex">
            <div class="search">

                <?= $form->field($model, 'q')->label(false) ?>
            </div>
            <div class="export">

                <button class="btn btn-primary"> <span class="fa fa-cloud-download-alt"></span> <?= Yii::t('cp','Export')?></button>
                <div class="export-btn">
                    <button value="excel" class="export"><span class="fa fa-file-excel"></span>  <?= Yii::t('cp','Excel')?></button>
                    <button value="excel" class="export"><span class="fa fa-file-pdf"></span>  <?= Yii::t('cp','Pdf')?></button>
                </div>
            </div>
            <?= Html::a(Yii::t('cp.laboratory_test_type', 'tadqiqot turi qo\'shish'), ['create'], ['class' => 'btn btn-success']) ?>

        </div>

    </div><!-- end card header -->

    <?php ActiveForm::end(); ?>

</div>
