<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\ReportFoodSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Oziq-ovqat ekspertizalari';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="report-food-index">


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'code',
            'rep_id',
            [
                'attribute' => 'type_id',
                'value' => function ($model) {
                    return \common\models\FoodType::find()->where(['id' => $model->type_id])->one()->name;
                }
            ],
            [
                'attribute' => 'cat_id',
                'value' => function ( $model) {
                    return \common\models\ReportFoodCategory::find()->where(['id' => $model->cat_id])->one()->name_uz;
                }
            ],
            'lat',
            'long',
            [
                'attribute' => 'soato_id',
                'format' => 'html',
                'value' => function ($model) {
                    return \common\models\Soato::Full($model->soato_id);
                }
            ],
            'phone',
            'detail:ntext',
            'created',
            'updated',
            'is_true',
            [
                'attribute' => 'report_status_id',
                'value' => function ($model) {
                    return \common\models\ReportStatus::findOne(['id'=>$model->status_id])->name_uz;
                }
            ],
            'operator_id',
        ],
    ]); ?>


</div>