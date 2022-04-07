<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\TemplateFood */

$this->title = Yii::t('app', 'Oziq ovqat ekspertizasi shabloni qo\'shish');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Shablonlar'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="template-food-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
