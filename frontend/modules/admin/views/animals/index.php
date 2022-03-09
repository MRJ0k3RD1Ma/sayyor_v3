<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\AnimalsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('cp.animals', 'Hayvonlar');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="animals-index">

    <?php Pjax::begin(['enablePushState' => false, 'timeout' => false]); ?>
    <?php echo $this->render('_search', [
        'model' => $searchModel,
    ]);
    ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'id' => 'animals-grid',
//        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'name',
//            'cat_id',
//            'gender',
            'birthday',
            'inn',
            'pnfl',
            'adress',
            //'vet_site_id',
            //'bsual_tag',
            //'type_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]) ?>
    <?php Pjax::end(); ?>


</div>
