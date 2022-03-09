<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\AnimalCategorySearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="animal-category-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'id' => 'animals-category-grid-filters',
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
                            <?= $form->field($model, 'q')->label(false) ?>
                            <!--                            <span class="fa fa-search"></span>-->
                            <!--                            <input type="search">-->
                            <!--                            <button class="btn"></button>-->

                        </div>

                        <div class="export">
                            <button class="btn btn-primary"><span class="fa fa-cloud-download-alt"></span> Export
                            </button>
                            <div class="export-btn">
                                <button class=""><span class="fa fa-file-excel"></span> Excel</button>
                                <button class=""><span class="fa fa-file-pdf"></span> PDF</button>
                            </div>

                        </div>
                        <?= Html::a(Yii::t('cp.animal', 'Hayvon kategoriyasini yaratish'), ['create'], ['class' => 'btn btn-success']) ?>
                    </div>
                </div>
                <div class="card-body">

                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
