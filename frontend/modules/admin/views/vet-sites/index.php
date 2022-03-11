<?php

use common\models\Soato;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\VetSitesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('cp.vetsites', 'Veterinariya uchastkalari');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vet-sites-index">

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header flex">
                    <div></div>
                    <div class="btns flex">
                        <div class="search">

                            <input type="search">
                            <button class="btn"><span class="fa fa-search"></span></button>

                        </div>
                        <div class="export">
                            <button class="btn btn-primary"><span class="fa fa-cloud-download-alt"></span> Export</button>
                            <div class="export-btn">
                                <button class=""><span class="fa fa-file-excel"></span> Excel</button>
                                <button class=""><span class="fa fa-file-pdf"></span> PDF</button>
                            </div>
                        </div>
                        <?= Html::a(Yii::t('cp.vetsites', 'Veterinariya uchastka qo`shish'), ['create'], ['class' => 'btn btn-success']) ?>

                    </div>
                </div>
                <div class="card-body">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
//                        'filterModel' => $searchModel,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],

//            'id',
                            'code',
                            'name',
                            [
                                'attribute' => 'soato',
                                'label' => 'Hudud nomi',
                                'value' => static function ($model) {
//                                    var_dump($model->soato0);exit();
                                    $soato = $model->soato0;
                                    return
                                        @Soato::find()->where(['MHOBT_cod' => $soato->res_id])->one()->name_lot
                                        . ' ' . @Soato::find()->where(['MHOBT_cod' => $soato->res_id . $soato->region_id])->one()->name_lot
                                        . ' ' . @Soato::find()->where(['MHOBT_cod' => $soato->res_id . $soato->region_id . $soato->district_id])->one()->name_lot
                                        . ' ' . @$soato->name_lot;

                                }
                            ],
                            ['class' => 'yii\grid\ActionColumn'],
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>


</div>
