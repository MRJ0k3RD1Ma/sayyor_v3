<?php


/* @var $this \yii\web\View */
/* @var $dataProvider \yii\data\ActiveDataProvider */
/* @var $dataProvider2 \yii\data\ActiveDataProvider */
/* @var $model2 Soato */

/* @var $searchModel \client\models\search\SertificatesSearch */

use common\models\Soato;
use yii\grid\GridView;


?>


<?= GridView::widget([
    'dataProvider' => $dataProvider2,
    'summary' => '',
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
        [
            'attribute' => 'name_lot',
            'label' => 'Hududlar',
            'format' => 'html',
            'value' => function ($model2) {
                return \yii\bootstrap4\Html::a($model2->name_lot, ['/komitet/stat-animal', 'id' => $model2->region_id]);
            }
        ],
        [
            'label' => 'Jami dalolatnomalar(shundan)',
            'headerOptions' => [
                'rowspan' => 2,
            ],
            'value' => function ($model2) {
                return '-';
            }
        ]

    ]
]) ?>