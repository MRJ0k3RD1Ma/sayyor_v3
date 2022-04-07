<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\EmployeesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('cp', 'Foydalanuvchilar');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <?php Pjax::begin(['enablePushState' => false, 'timeout' => false]); ?>
            <?php echo $this->render('_search', [
                'model' => $searchModel,
            ]); ?>
            <div class="card-body">
                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'id' => 'employees-grid',
//                    'filterModel' => $searchModel,
                    'columns' => [
                        ['class' => 'yii\grid\SerialColumn'],

//                        'id',
                        'name',
                        'email:email',
                        'phone',
//                        'password',

                        ['class' => 'yii\grid\ActionColumn'],
                    ],
                ]) ?>
                <?php Pjax::end();?>
            </div>
        </div>
    </div>
</div>