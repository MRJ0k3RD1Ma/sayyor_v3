<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\ReportDrugsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Dori darmonlar';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="report-drugs-index">


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'code',
            [
                'attribute' => 'type_id',
                'value' => function ($model) {
                    return \common\models\ReportDrugType::find()->where(['id' => $model->type_id])->one()->name_uz;
                }
            ],
            [
                'attribute' => 'cat_id',
                'value' => function ( $model) {
                    return \common\models\ReportFoodCategory::find()->where(['id' => $model->cat_id])->one()->name_uz;
                }
            ],
            [
                'attribute' => 'soato_id',
                'format' => 'html',
                'value' => function ($model) {
                    return \common\models\Soato::Full($model->soato_id);
                }
            ],
            'lat',
            'long',
            'detail:ntext',
            'phone',
            'created',
            'updated',
            'operator_id',
            'is_true',
            [
                'attribute' => 'status_id',
                'value' => function ($model) {
                    return \common\models\ReportStatus::findOne(['id'=>$model->status_id])->name_uz;
                }
            ],
        ],
    ]); ?>
</div>
