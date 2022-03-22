<?php

use yii\grid\GridView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\FoodSamplingCertificateSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('cp.food_sampling_certificate', 'Mahsulot ekspertizalari');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="food-sampling-certificate-index">


    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header flex">
                    <div></div>
                    <div class="btns flex">
                        <div class="search">

                            <input type="text">
                            <button class="btn" type="submit"><span class="fa fa-search"></span></button>

                        </div>
                        <div class="export">

                            <button class="btn btn-primary"><span
                                        class="fa fa-cloud-download-alt"></span> <?= Yii::t('cp', 'Export') ?></button>
                            <div class="export-btn">
                                <button value="excel" class="export"><span
                                            class="fa fa-file-excel"></span> <?= Yii::t('cp', 'Excel') ?></button>
                                <button value="excel" class="export"><span
                                            class="fa fa-file-pdf"></span> <?= Yii::t('cp', 'Pdf') ?></button>
                            </div>
                        </div>
                    </div>

                </div><!-- end card header -->
                <div class="card-body">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
//                        'filterModel' => $searchModel,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],

//                            'id',
                            [
                                    'attribute' =>'code',
                                'format' => 'html',
                                'value'=>function ($model){
                                    return Html::a($model->code,'viewfood?id='.$model->id);
                                }
                            ],
                            'food_id',
                            'inn',
                            'pnfl',
                            //'sampling_site',
                            //'sampling_adress',
                            //'sampler_person_pnfl',
                            //'sampler_person_inn',
                            //'verification_pupose_id',
                            //'sampling_date',
                            //'send_sample_date',
                            //'based_public_information',
                            //'message_number',
                            //'created',
                            //'updated',
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>


</div>
