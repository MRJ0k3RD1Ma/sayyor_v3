<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Animaltype */

$this->title = Yii::t('cp.animaltype', 'Hayvon turi qo\'shish');
$this->params['breadcrumbs'][] = ['label' => Yii::t('cp.animaltype', 'Hayvon turilari'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="animaltype-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
