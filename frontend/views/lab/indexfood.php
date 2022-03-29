<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\search\RouteSertSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('food', 'Namunalar ro\'yhati');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="route-sert-index">


    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
//            'director_id',
            [
                'attribute'=>'sample_id',
                'value'=>function($d){
                    $url = Yii::$app->urlManager->createUrl(['/lab/viewfood','id'=>$d->id]);
                    return "<a href='{$url}'>{$d->sample->samp_code}</a>";
                },
                'format'=>'raw'
            ],
//            'leader_id',
//            'executor_id',
            [
                'attribute'=>'leader_id',
                'value'=>function($d){
                    if($d->leader_id){
                        return $d->leader->name;
                    }return null;
                }
            ],
            'deadline',
            'ads',
            //'state_id',
            'created',
            //'updated',
            //'sample_id',
            //'registration_id',
//            'status_id',
            [
                'attribute'=>'status_id',
                'value'=>function($d){
                    $lg = 'uz';
                    if(Yii::$app->language == 'ru'){$lg = 'ru';}
                    return $d->status->{'name_'.$lg};
                }
            ],
        ],
    ]); ?>


</div>
