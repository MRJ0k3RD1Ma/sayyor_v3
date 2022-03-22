<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\ReportAnimal */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Hayvon kasalliklari', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="report-animal-view">



    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'type_id',
            'cat_id',
            'soato_id',
            'lat',
            'long',
            'detail:ntext',
            'operator_id',
            'is_true',
            'report_status_id',
            'phone',
            'created',
            'updated',
            'code',
            'rep_id',
            'lang',
            'organization_id',
        ],
    ]) ?>

</div>