<?php


/* @var $this \yii\web\View */
/* @var $dataProvider \yii\data\ActiveDataProvider */
/* @var $dataProvider2 \yii\data\ActiveDataProvider */
/* @var $model2 Soato */

/* @var $searchModel \client\models\search\SertificatesSearch */

use common\models\Sertificates;
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
            'label' => 'Jami dalolatnomalar',
            'headerOptions' => [
                'rowspan' => 2,
            ],
            'value' => function ($model2) use ($dataProvider) {
                $count=0;
                foreach($dataProvider->getModels() as $model){
                    $count+=($model->vetSite->soato0->region_id==$model2->region_id);
                }
               return  $count;
            }
        ]

    ]
]) ?>