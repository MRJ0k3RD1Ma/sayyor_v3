<?php

use common\models\Employees;
use common\models\Regulations;
use common\models\TamplateAnimal;
use common\models\TemplateAnimalRegulations;
use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\TamplateAnimal */

$this->title = $model->name_uz || $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Hayvon kasalliklari tashhisi'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $model->id;
YiiAsset::register($this);
?>
<div class="tamplate-animal-view">

    <p>        <?= Html::a(Yii::t('cp', 'Yana qo`shish'), ['create'], ['class' => 'btn btn-success']) ?>

        <?= Html::a(Yii::t('app', 'Yangilash'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'O\'chirish'), ['delete', 'id' => $model->id], [
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
            'vet4',
            [
                'attribute' => 'type_id',
                'value' => function (TamplateAnimal $model) {
                    return $model->type->name_uz;
                }
            ],
            [
                'label' => 'regulation',
                'format' => 'html',
                'value' => function (TamplateAnimal $model) {
                    $out = [];
                    $rel = TemplateAnimalRegulations::find()->where(['template_id' => $model->id])->asArray()->all();
                    foreach (array_column($rel, 'regulation_id') as $reg) {
                        $out[] = Regulations::findOne(['id' => $reg])->name_uz;
                    }
                    return implode("<br>", $out);

                }
            ],
            [
                'attribute' => 'gender',
                'value' => function (TamplateAnimal $model) {
                    $list = [1 => 'Erkak',
                        0 => 'Urg\'ochi'];
                    return $list[$model->gender];
                }
            ],
            'age',
            [
                'attribute' => 'diseases_id',
                'value' => function (TamplateAnimal $model) {
                    return $model->diseases->name_uz;
                }
            ],
            [
                'attribute' => 'test_method_id',
                'value' => function (TamplateAnimal $model) {
                    return $model->testMethod->name_uz;
                }
            ],
            'name_uz',
            'name_ru',
            [
                'attribute' => 'unit_id',
                'value' => function (TamplateAnimal $model) {
                    return $model->unit->name_uz;
                }
            ],
            'min',
            'min_1',
            'max',
            'max_1',
            'is_vaccination',
            'dead_days',
            [
                'attribute' => 'creator_id',
                'value' => function (TamplateAnimal $model) {
                    return Employees::findOne(['id' => Yii::$app->user->identity->id])->name;
                }
            ],
            'consent_id',
            [
                'attribute' => 'state_id',
                'value' => function (TamplateAnimal $model) {
                    return $model->state->name;
                }
            ],
        ],
    ]) ?>

</div>
