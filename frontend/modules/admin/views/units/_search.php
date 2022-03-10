<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\UnitsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="units-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'id' => 'units-grid-filters',
    ]); ?>

    <div class="card-header flex">
        <div></div>
        <div class="btns flex">
            <div class="search">

                <?= $form->field($model, 'q')->label(false) ?>

            </div>
            <div class="export">
                <button class="btn btn-primary"><span class="fa fa-cloud-download-alt"></span> Export
                </button>
                <div class="export-btn">
                    <button>
                        <?= Html::a(' Excel ', ['index', 'export' => 1, 'id' => $model->id], ['data-pjax' => 0, 'class' => 'fa fa-file-excel']) ?>
                    </button>
                    <button class=""><span class="fa fa-file-pdf"></span> PDF</button>
                </div>

            </div>
            <?= Html::a(Yii::t('cp.units', 'Birlik qo\'shish'), ['create'], ['class' => 'btn btn-success']) ?>
        </div>

    </div>
    <?php ActiveForm::end(); ?>

</div>
