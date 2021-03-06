<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ReportDrugType */

$this->title = Yii::t('app', 'Create Report Drug Type');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Report Drug Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="report-drug-type-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
