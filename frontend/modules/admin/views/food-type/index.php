<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\FoodTypeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('food', 'Oziq-ovqat turlari');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="food-type-index">



    <div class="card-header flex">
        <div></div>
        <div class="btns flex">
            <?= Html::a(Yii::t('app', 'Oziq ovqat xisoboti kategoriyasi yaratish'), ['create'], ['class' => 'btn btn-success']) ?>

        </div>
    </div>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'name',
//            'parent_id',
            [
                'attribute'=>'parent_id',
                'value'=>function($d){
                    if($d->parent_id){
                        return $d->parent->name;
                    }else{
                        return null;
                    }
                }
            ],
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
