<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model \client\models\search\SampleRegistrationSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="animals-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'id' => 'listsert-grid-filters',
        'fieldConfig' => [
        ],
    ]); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header flex">
                    <div></div>
                    <div class="btns flex">
                        <div class="search" style="margin-bottom: -1rem!important;">
                            <?= $form->field($model, 'q', [
                                'template' => '<div class="input-group">{input}<span class="btn btn-primary fa fa-search"></span></div>'
                            ])->textInput()->label(false) ?>
                        </div>

                        <div class="export">
                            <button class="btn btn-primary"><span class="fa fa-cloud-download-alt"></span> Export
                            </button>
                            <div class="export-btn">
                                <button>
                                    <?= Html::a('<span class="fa fa-file-excel"></span> Excel ',Yii::$app->urlManager->createUrl([Yii::$app->request->url,'export'=>1]) , ['data-pjax' => 0,'export'=>1 ]) ?>
                                </button>
                                <button>

                                    <?=

                                    Html::a('<span class="fa fa-file-pdf"></span> PDF ', Yii::$app->urlManager->createUrl(array_merge(['komitet/sertapp','export'=>2,],Yii::$app->request->queryParams[$model->formName()]))  , ['data-pjax' => 0]) ?>
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="card-body">

                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
