<?php

use common\models\Sertificates;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\SertificatesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('cp.sertificates', 'Dalolatnomalar');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sertificates-index">

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

                        <?= Html::a(Yii::t('cp.sertificates', 'Dalolatnoma qo\'shish'), ['createtest'], ['class' => 'btn btn-success']) ?>


                    </div>
                </div>
                <div class="card-body">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
//                        'filterModel' => $searchModel,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],

//                            'sert_id',
                            [
                                'attribute'=>'sert_id',
                                'format'=>'raw',
                                'value'=>function($d){
                                    $url = Yii::$app->urlManager->createUrl(['/register/viewtest','id'=>$d->id]);
                                    $code = substr(date('Y',strtotime($d->sert_date)),2,2).'-1-'.get3num($d->organization_id).'-'.$d->sert_id;
                                    return "<a href='{$url}'>{$code}</a>";
                                },
                            ],
                            'sert_num',
                            'sert_date',
//                            'organization_id',
                            'pnfl',
                            'owner_name',
//                            'vet_site_id',
                            [
                                'attribute'=>'vet_site_id',
                                'value'=>function($d){
                                    return $d->vetSite->name;
                                }
                            ],
                            //'operator',

                            [
                                'class' => 'yii\grid\ActionColumn',
                                'urlCreator' => function ($action, $model, $key, $index) {
                                    return \yii\helpers\Url::to(['/register/'.$action.'test', 'id' => $model->id]);
                                }
                            ],
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>



</div>
