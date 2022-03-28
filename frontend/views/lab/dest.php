<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\search\RouteSertSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('food', 'Namunani yo\'q qilish dalolatnomalari ro\'yhati');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="route-sert-index">


    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'code',
//            'code_id',
//            'sample_id',
            [
                'attribute'=>'sample_id',
                'value'=>function($d){
                    return $d->sample->kod;
                },
            ],
//            'destruction_date',
            'ads',
            //'creator_id',
            //'created',
            //'updated',
            'consent_id',
            [
                'attribute'=>'consent_id',
                'value'=>function($d){
                    return $d->consent->name;
                }
            ],
            //'approved_date',
            //'state_id',
            //'org_id',

        ],
    ]); ?>


</div>
