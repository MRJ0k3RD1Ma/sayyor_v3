<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\DestructionSampleAnimal */

$this->title = $model->code.' '.Yii::t('cp','Oziq-ovqat ekspertizasi bo`yicha kelgan namuna raqami');
$this->params['breadcrumbs'][] = ['label' => Yii::t('food', 'Namunani yo\'q qilish dalolatnomalari'), 'url' => ['register/destfood']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="destruction-sample-animal-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">
        <div class="col-md-6">
            <?php if ($model->state_id == 1): ?>
                <div class="row">
                    <div class="col-md-12">
                        <a href="<?= Url::to(['register/dest-pdffood', 'id' => $model->id]) ?>" class="btn btn-warning">Dalolatnomani PDF shaklda yuklab olish</a>
                    </div>
                </div>
            <?php endif; ?>
            <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
//            'id',
                    'code',
//            'code_id',
//            'sample_id',
                    [
                        'attribute' => 'sample_id',
                        'value' => function ($d) {
                            return $d->sample->samp_code;
                        },
                        'format' => 'raw'
                    ],
                    [
                        'label'=>Yii::t('lab','Namuna ma\'lumotlari'),
                        'value'=>function($d){
                            $samp = $d->sample;
                            $res = "";
                            $lg = 'uz'; if(Yii::$app->language=='ru')$lg='ru';
                            $res .= Yii::t('model','Mahsulot guruhi').': '.$samp->category->{'name_'.$lg}.'-'.$samp->food->{'name_'.$lg}.'<br>';
                            $res .= Yii::t('model','Soni').': '.$samp->count;

                            return $res;
                        },
                        'format'=>'raw'
                    ],
                    'ads',
                    [
                        'attribute' => 'consent_id',
                        'value' => function ($d) {
                            return $d->consent->name;
                        }
                    ],
                    'destruction_date',


                    [
                        'attribute' => 'creator_id',
                        'value' => function ($d) {
                            return $d->creator->name;
                        }
                    ],

                    'approved_date',
                    [
                        'attribute' => 'state_id',
                        'value' => function ($d) {
                            $s = [
                                1 => Yii::t('lab', 'Namuna yo\'q qilingan'),
                                2 => Yii::t('lab', 'Rahbar tasdiqlashi kutilmoqda'),
                                3 => Yii::t('lab', 'Namuna yo\'q qilinish jarayonida')
                            ];
                            return $s[$d->state_id];
                        }
                    ],
//            'state_id',
//            'org_id',
                ],
            ]) ?>
        </div>
    </div>


</div>
