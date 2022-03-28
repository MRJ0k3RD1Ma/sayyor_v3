<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */
/* @var $model common\models\DestructionSampleAnimal */

$this->title = $model->code;
$this->params['breadcrumbs'][] = ['label' => Yii::t('food', 'Namunani yo\'q qilish dalolatnomalarii'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="destruction-sample-animal-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">
        <div class="col-md-6">
            <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
//            'id',
                    'code',
//            'code_id',
//            'sample_id',
                    [
                        'attribute'=>'sample_id',
                        'value'=>function($d){
                            return $d->sample->kod;
                        },
                        'format'=>'raw'
                    ],
                    [
                        'label'=>Yii::t('lab','Hayvon haqida ma\'lumot'),
                        'value'=>function($model){
                            $d = $model->sample;
                            $lg = 'uz';
                            if(Yii::$app->language == 'ru')$lg = 'ru';
                            $res = "";
                            $res .= $d->animal->type->{'name_'.$lg}.'<br>';
                            $res .= Yii::t('lab','Holati:').' '.$d->animal->cat->{'name_'.$lg}.'<br>';
                            $res .= Yii::t('lab','Jinsi:').' '.Yii::$app->params['gender'][$d->animal->gender].'<br>';
                            $d1 = new DateTime($d->animal->birthday);
                            $d2 = new DateTime(date('Y-m-d'));
                            $interval = $d1->diff($d2);
                            $diff = $interval->m+($interval->y*12);
                            $res .= Yii::t('lab','Tug\'ilgan sanasi:').' '.$d->animal->birthday.'('.$diff.' oy)';

                            return $res;
                        },
                        'format'=>'raw'
                    ],
                    'ads',
                    [
                        'attribute'=>'consent_id',
                        'value'=>function($d){
                            return $d->consent->name;
                        }
                    ],
                    'destruction_date',
                    //'approved_date',
//            'state_id',

                    [
                        'attribute'=>'creator_id',
                        'value'=>function($d){
                            return $d->creator->name;
                        }
                    ],
                    //'org_id',
                    'approved_date',
                    [
                        'attribute'=>'state_id',
                        'value'=>function($d){
                            $s = [
                                1=>Yii::t('lab','Namuna yo\'q qilingan'),
                                2=>Yii::t('lab','Rahbar tasdiqlashi kutilmoqda'),
                                3=>Yii::t('lab','Namuna yo\'q qilinish jarayonida')
                            ];
                            return $s[$d->state_id];
                        }
                    ],
//            'state_id',
//            'org_id',
                ],
            ]) ?>
        </div>
        <div class="col-md-6">
            <?php if($model->state_id == 3){?>
                <?php $form = ActiveForm::begin()?>

                <?= $form->field($model,'ads')->textInput()?>

                <?= $form->field($model,'destruction_date')->textInput(['type'=>'date'])?>

                <button class="btn btn-success">Saqlash</button>
                <?php ActiveForm::end()?>
            <?php }?>
        </div>
    </div>


</div>
