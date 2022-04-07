<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\search\RouteSertSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('food', 'Hayvon kasalliklari namunalar ro\'yhati');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="route-sert-index">


    <?php Pjax::begin(['enablePushState' => 0, 'timeout' => false]); ?>
    <?php
    echo $this->render('_searchregproduct', [
        'model' => $searchModel,
    ]);

    ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'id' => 'regproduct-grid',
//        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
//            'director_id',
            [
                'attribute' => 'sample_id',
                'value' => function ($d) {
                    $url = Yii::$app->urlManager->createUrl(['/leader/viewanimal', 'id' => $d->id]);
                    return "<a href='{$url}'>{$d->sample->kod}</a>";
                },
                'format' => 'raw'
            ],
//            'leader_id',
//            'executor_id',
            [
                'attribute' => 'executor_id',
                'value' => function ($d) {
                    if ($d->executor_id) {
                        return $d->executor->name;
                    }
                    return null;
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
                'attribute' => 'status_id',
                'format' => 'html',
                'value' => function ($d) {
                    $lg = 'uz';
                    if (Yii::$app->language == 'ru') {
                        $lg = 'ru';
                    }
                    return "<span class='" . $d->status->icon . "'>" . @$d->status->class . ' ' . $d->status->{'name_' . $lg} . "</span>";
                }
            ],
        ],
    ]); ?>


</div>
