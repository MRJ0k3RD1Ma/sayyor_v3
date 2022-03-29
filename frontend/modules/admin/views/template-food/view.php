<?php

use common\models\Regulations;
use common\models\TemplateAnimalRegulations;
use common\models\TemplateFood;
use common\models\TemplateFoodRegulations;
use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\TemplateFood */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Template Foods'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
?>
<div class="template-food-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'tasnif_code',
            [
                'label' => 'regulation',
                'format' => 'html',
                'value' => function (TemplateFood $model) {
                    $out = [];
                    $rel = TemplateFoodRegulations::find()->where(['template_id' => $model->id])->asArray()->all();
                    foreach (array_column($rel, 'regulation_id') as $reg) {
                        $out[]= Regulations::findOne(['id'=>$reg])->name_uz;
                    }
                    return implode("<br>", $out);

                }
            ],
            'laboratory_test_type_id',
            'name_uz',
            'name_ru',
            'unit_uz',
            'unit_ru',
            'type_id',
            'min',
            'min_1',
            'max',
            'max_1',
            'ads',
            'creator_id',
            'consept_id',
            'created',
            'updated',
        ],
    ]) ?>

</div>
