<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\VetSitesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vet-sites-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'id' => 'vet-sites-grid-filters',
    ]); ?>

    <div class="card-header flex">
        <div></div>
        <div class="btns flex">
            <div class="search" style="margin-bottom: -1rem!important;">
                <?= $form->field($model, 'q', [
                    'template' => '<div class="input-group">{input}<span class="btn btn-primary fa fa-search margi"></span></div>'
                ])->textInput()->label(false) ?>
            </div>
            <div class="export">
                <button class="btn btn-primary"><span class="fa fa-cloud-download-alt"></span> Export
                </button>
                <div class="export-btn">
                    <button>
                        <?= Html::a(' Excel ', Yii::$app->request->url."&export=1", ['data-pjax' => 0, 'class' => 'fa fa-file-excel']) ?>
                    </button>
                    <button>
                        <?= Html::a(' PDF ', Yii::$app->request->url."&export=2", ['data-pjax' => 0, 'class' => 'fa fa-file-pdf']) ?>
                    </button>
                </div>

            </div>
            <?= Html::a(Yii::t('cp.vetsites', 'Veterinariya uchastka qo`shish'), ['create'], ['class' => 'btn btn-success']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
