<?php

use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\RouteSert;
use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\ActiveForm;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Samples */
/* @var $result ResultAnimal */
/* @var $item ResultAnimalTests */
/* @var $d \common\models\Samples */

$this->title = $model->sample->samp_code.' '.Yii::t('cp','sonli oziq-ovqat havfsizligi bo`yicha namuna raqami');

$this->params['breadcrumbs'][] = ['label' => Yii::t('food', 'Namunalar ro\'yhati'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
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
                        'attribute' => 'executor_id',
                        'value' => function ($d) {
                            if ($d->executor_id) {
                                return $d->executor->name;
                            }
                            return null;
                        }
                    ],
                    'deadline',
                    'ads',
//                    'state_id',
//                    'sample_id',
//                    'registration_id',
//                    'status_id',
                    [
                        'attribute' => 'status_id',
                        'value' => function ($d) {
                            $lg = 'uz';
                            if (Yii::$app->language == 'ru') {
                                $lg = 'ru';
                            }
                            return $d->status->{'name_' . $lg};
                        }
                    ],
                    'created',
                    'updated',
                ],
            ]) ?>

            <h3><?= Yii::t('leader','Normativ hujjatlar')?></h3>
            <ul>
                <?php $lg = 'uz'; if(Yii::$app->language == 'ru')$lg = 'ru'?>
                <?php foreach ($docs as $item):?>
                    <?php $url = '#'; if($item->file) $url = '/uploads/'.$item->file;?>
                    <li><a href="<?= $url?>"><?= $item->{'name_'.$lg}?></a></li>
                <?php endforeach;?>
            </ul>

            <?php if ($model->status_id == 1) { ?>
                <?php $form = ActiveForm::begin() ?>

                <?php
                $data = [];
                foreach ($emp as $item) {
                    $data[$item->id] = \common\models\FoodRoute::find()->where(['executor_id' => $item->id])
                            ->andWhere(['<>', 'status_id', 3])->count('id')
                        . ' - ' . $item->name;
                }
                ?>
                <?= $form->field($model, 'executor_id')->dropDownList($data, ['prompt' => Yii::t('leader', 'Labarantni tanlang')]) ?>
                <?= $form->field($model, 'deadline')->textInput(['type' => 'date']) ?>
                <?= $form->field($model, 'ads')->textInput() ?>
                <button class="btn btn-success" type="submit">Jo'natish</button>
                <?php ActiveForm::end() ?>
            <?php } ?>
        </div>

        <div class="col-md-6">
            <h3>Namuna ma'lumotlari</h3>
            <?= DetailView::widget([
                'model' => $sample,
                'attributes' => [
//            'id',
                    [
                        'attribute'=>'is_group',
                        'value'=>function($d){
                            if($d->is_group and $d->is_group == 1){
                                return Yii::t('cp','Birlashgan namuna');
                            }else{
                                return Yii::t('cp','Alohida kelgan namuna');
                            }
                        }
                    ],
                    'samp_code',

                    [
                        'attribute'=>'category_id',
                        'value'=>function($d){
                            $lg = Yii::$app->language=='ru' ?'ru':'uz';
                            return $d->category->{'name_'.$lg};
                        }
                    ],
                    [
                        'attribute'=>'food_id',
                        'value'=>function($d){
                            $lg = Yii::$app->language=='ru' ?'ru':'uz';
                            return $d->food->{'name_'.$lg};
                        }
                    ],
                    [
                        'attribute'=>'unit_id',
                        'value'=>function($d){
                            $lg = 'uz'; if(Yii::$app->language=='ru'){$lg = 'ru';}
                            return $d->unit->{'name_'.$lg};
                        }
                    ],
                    'count',
                    [
                        'attribute'=>'sample_box_id',
                        'value'=>function($d){
                            $lg = 'uz'; if(Yii::$app->language=='ru'){$lg = 'ru';}
                            return $d->sampleBox->{'name_'.$lg};
                        }
                    ],
                    [
                        'attribute'=>'sample_condition_id',
                        'value'=>function($d){
                            $lg = 'uz'; if(Yii::$app->language=='ru'){$lg = 'ru';}
                            return $d->sampleCondition->{'name_'.$lg};
                        }
                    ],
                    'total_amount',
                    'producer',
                    'serial_num',
                    'manufacture_date',
                    'sell_by',
                    'coments',
                    [
                        'attribute'=>'_country',
                        'value'=>function($d){
                            $lg = 'uz'; if(Yii::$app->language=='ru'){$lg = 'ru';}
                            return $d->country->{'name_'.$lg};
                        }
                    ],
                    [
                        'attribute'=>'laboratory_test_type_id',
                        'value'=>function($d){
                            $lg = 'uz'; if(Yii::$app->language=='ru'){$lg = 'ru';}
                            return $d->laboratoryTestType->{'name_'.$lg};
                        }
                    ],
                    [
                        'label' => 'Namunani qabul qilgan hodim',
                        'attribute' => 'emp_id',
                        'value' => function ($d) {
                            if ($d->emp_id != -1) {
                                return $d->emp->name;
                            }
                            return null;
                        }
                    ],
//                    'repeat_code',
                ],
            ]) ?>
        </div>
    </div>
    <?php if($model->status_id >= 2){?>
        <div class="row">
            <div class="col-md-6">
                <h3>Tekshiruv sharoiti</h3>
                <?= DetailView::widget([
                    'model' => $result,
                    'attributes' => [
                        'code',
                        'temprature',
                        'humidity',
                        'reagent_series',
                        'reagent_name',
                        'conditions',
                        'end_date',
                        [
                            'attribute'=>'ads',
                            'value'=>function($d){
                                $lg = 'uz'; if(Yii::$app->language == 'ru'){$lg = 'ru';}
                                if($d->ads==0){
                                    return 'Tasdiqlanmadi';
                                }else{
                                    return 'Tasdiqlandi';
                                }
                            }
                        ],
//                        'ads',
//                        'require_id',
//                        'creator_id',

                        [
                            'attribute'=>'creator_id',
                            'value'=>function($d){
                                if($d->creator_id){
                                    return $d->creator->name;
                                }else{
                                    return null;
                                }
                            }
                        ],
                        'created',
                        'updated',
                    ]
                ])
                ?>
            </div>
            <div class="col-md-6">
                <h3>Natijalar</h3>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>???</th>
                            <th><?= Yii::t('lab', 'Parametr guruhi') ?></th>
                            <th><?= Yii::t('lab', 'Parametr nomi') ?></th>
                            <th><?= Yii::t('lab', 'Birlik') ?></th>
                            <th><?= Yii::t('lab', 'Minimal-maksimal oraliq') ?></th>
                            <th><?= Yii::t('lab', 'Qiymat') ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php $lg = 'uz';
                        if (Yii::$app->language == 'ru') $lg = 'ru'; ?>
                        <?php $n = 0;
                        foreach ($test as $i => $item): $n++; ?>
                            <tr>
                                <?php ?>
                                <td><?= $n ?></td>
                                <td><?= $item->template->group->{'name_' . $lg} ?></td>
                                <td><?= $item->template->{'name_' . $lg} ?></td>
                                <td><?= $item->template->unit->{'name_' . $lg} ?></td>
                                <?php if ($item->type_id == 1) { ?>
                                    <td><?= $item->template->min_1 . '-' . $item->template->max_1 ?></td>
                                <?php } elseif ($item->type_id == 2) { ?>
                                    <td><?= Yii::$app->params['result'][$item->template->min_1] ?></td>
                                <?php } elseif ($item->type_id == 3) { ?>
                                    <td><?= $item->template->min_1 . '-' . $item->template->max_1  ?></td>
                                <?php } elseif ($item->type_id == 4) { ?>
                                    <td><?= $item->template->min_1 . '-' . $item->template->max_1 ?>
                                        <br> <?= $item->template->min_2 . '-' . $item->template->max_2 ?></td>
                                <?php } ?>
                                <td><?= $item->result ?></td>

                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <?php }?>

    <?php if($model->status_id == 4){?>

        <?= Html::a('Tasdiqlash', ['leader/acceptfood', 'id' => $model->id], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Rad etish', ['leader/declinefood', 'id' => $model->id], ['class' => 'btn btn-danger']) ?>
    <?php }?>
</div>
