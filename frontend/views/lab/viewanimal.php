<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Samples */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('food', 'Namunalar ro\'yhati'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="samples-view">

    <div class="row">
        <div class="col-md-6">
            <h3>Topshiriq ma'lumotlari</h3>
            <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
//                    'id',
//                    'director_id',
//                    'leader_id',
//                    'executor_id',
                    [
                        'attribute'=>'executor_id',
                        'value'=>function($d){
                            if($d->executor_id){
                                return $d->executor->name;
                            }return null;
                        }
                    ],
                    'deadline',
                    'ads',
//                    'state_id',
//                    'sample_id',
//                    'registration_id',
//                    'status_id',
                    [
                        'attribute'=>'status_id',
                        'value'=>function($d){
                            $lg = 'uz';
                            if(Yii::$app->language == 'ru'){$lg = 'ru';}
                            return $d->status->{'name_'.$lg};
                        }
                    ],
                    'created',
                    'updated',
                ],
            ]) ?>

            <?php if($model->status_id == 1){?>
                <?php $form = \yii\widgets\ActiveForm::begin()?>

                <?php
                $data = [];
                foreach ($emp as $item){
                    $data[$item->id] = \common\models\RouteSert::find()->where(['executor_id'=>$item->id])
                            ->andWhere(['<>','status_id',3])->count('id')
                        .' - '. $item->name;
                }
                ?>
                <?= $form->field($model,'executor_id')->dropDownList($data,['prompt'=>Yii::t('leader','Labarantni tanlang')])?>
                    <?= $form->field($model,'deadline')->textInput(['type'=>'date'])?>
                    <?= $form->field($model,'ads')->textInput()?>
                <button class="btn btn-success" type="submit">Jo'natish</button>
                <?php \yii\widgets\ActiveForm::end()?>
            <?php }?>
        </div>
        <div class="col-md-6">
            <h3>Namuna ma'lumotlari</h3>
            <?= DetailView::widget([
                'model' => $sample,
                'attributes' => [
//            'id',
                    'kod',
//            'samp_id',
                    'label',
//                    'sample_type_is',
//                    'sample_box_id',
                    [
                        'attribute'=>'sample_type_is',
                        'value'=>function($d){
                            $lg = 'uz';
                            if(Yii::$app->language == 'ru')$lg = 'ru';
                            return $d->sampleTypeIs->{'name_'.$lg};
                        }
                    ],
                    [
                        'attribute'=>'sample_box_id',
                        'value'=>function($d){
                            $lg = 'uz';
                            if(Yii::$app->language == 'ru')$lg = 'ru';
                            return $d->sampleBox->{'name_'.$lg};
                        }
                    ],
//                    'animal_id',
                    [
                        'attribute'=>'animal_id',
                        'value'=>function($d){
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
//            'sert_id',
//                    'suspected_disease_id',
                    [
                        'attribute'=>'suspected_disease_id',
                        'value'=>function($d){
                            $lg = 'uz';
                            if(Yii::$app->language == 'ru')$lg = 'ru';
                            return $d->suspectedDisease->{'name_'.$lg};
                        }
                    ],
                    [
                        'attribute'=>'test_mehod_id',
                        'value'=>function($d){
                            $lg = 'uz';
                            if(Yii::$app->language == 'ru')$lg = 'ru';
                            return $d->testMehod->{'name_'.$lg};
                        }
                    ],

//            'state_id',
//                    'status_id',
//                    'emp_id',
                    [
                        'label'=>'Namunani qabul qilgan hodim',
                        'attribute'=>'emp_id',
                        'value'=>function($d){
                            if($d->emp_id != -1){
                                return $d->emp->name;
                            }
                            return null;
                        }
                    ],
                    'repeat_code',
                ],
            ]) ?>
        </div>
    </div>



    <div class="row">
        <h3>Shablon ma'lumotlari</h3>
        <pre>
            <?php var_dump($template); ?>
        </pre>
    </div>
</div>