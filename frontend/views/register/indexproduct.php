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

                            <button class="btn btn-primary"> <span class="fa fa-cloud-download-alt"></span> <?= Yii::t('cp','Export')?></button>
                            <div class="export-btn">
                                <button value="excel" class="export"><span class="fa fa-file-excel"></span>  <?= Yii::t('cp','Excel')?></button>
                                <button value="excel" class="export"><span class="fa fa-file-pdf"></span>  <?= Yii::t('cp','Pdf')?></button>
                            </div>
                        </div>
                        <?= Html::a(Yii::t('cp.food_sampling_certificate', 'Mahsulot ekspertizasi qo\'shish'), ['create'], ['class' => 'btn btn-success']) ?>

                    </div>

                </div><!-- end card header -->
                <div class="card-body">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
//                        'filterModel' => $searchModel,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],

//                            'id',
                            'kod',
                            'pnfl',
//                            'organization_id',
//                            'sampling_site',
                            'sampling_adress',
                            //'sampler_organization_code',
                            //'sampler_person_pnfl',
                            //'unit_id',
                            'count',
                            //'verification_sample',
                            'producer',
                            //'serial_num',
                            //'manufacture_date',
                            //'sell_by',
                            //'coments',
                            //'verification_pupose_id',
                            //'sample_box_id',
                            //'sample_condition_id',
                            //'sampling_date',
                            //'send_sample_date',
                            'explanations',
                            //'based_public_information',
                            //'message_number',
                            //'laboratory_test_type_id',

                            [
                                'class' => 'yii\grid\ActionColumn',
                                'header' => 'Buyruqlar',
                                'headerOptions' => ['style' => 'color:#337ab7'],
                                'template' => '{view}  {update}  {delete}',
                                'buttons' => [
                                    'view' => function ($url, $model) {
                                        return Html::a('<span class="fa fa-eye"></span>', $url, [
                                            'title' => Yii::t('app', 'Batafsil'),
                                        ]);
                                    },

                                    'update' => function ($url, $model) {
                                        return Html::a('<span class="fa fa-pen"></span>', $url, [
                                            'title' => Yii::t('app', 'Yangilash'),
                                        ]);
                                    },
                                    'delete' => function ($url, $model) {
                                        return Html::a('<span class="fa fa-trash"></span>', $url, [
                                            'title' => Yii::t('app', 'O\'chirish'),
                                        ]);
                                    }

                                ],
                                'urlCreator' => function ($action, $model, $key, $index) {
                                    if ($action === 'view') {
                                        $url = 'viewproduct?id=' . $model->id;
                                        return $url;
                                    }

                                    if ($action === 'update') {
                                        $url = 'updateproduct?id='  . $model->id;
                                        return $url;
                                    }
                                    if ($action === 'delete') {
                                        $url = '&id=' . $model->id;
                                        return $url;
                                    }
                                }
                            ],
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>



</div>
