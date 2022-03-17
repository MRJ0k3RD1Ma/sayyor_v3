<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\VaccinesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vaccines-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'id' => 'vaccines-grid-filters',
    ]); ?>

    <div class="row">
        <div class="col-md-12">
            <div class="card">
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
                        <?= Html::a(Yii::t('cp.vaccines', 'Vaksina qo\'shish'), ['create'], ['class' => 'btn btn-success']) ?>

                    </div>
                </div>
                <div class="card-body">

                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
