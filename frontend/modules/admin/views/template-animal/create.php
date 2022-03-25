<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\TamplateAnimal */

$this->title = Yii::t('app', 'Hayvon kasalliklari tashhisi qo\'shish');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Hayvon kasalliklari tashhisi'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tamplate-animal-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
