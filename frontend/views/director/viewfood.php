<?php

use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\RouteSert;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\web\YiiAsset;
use yii\widgets\ActiveForm;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Samples */
/* @var $result ResultAnimal */
/* @var $item ResultAnimalTests */
/* @var $d \common\models\Samples */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('food', 'Namunalar ro\'yhati'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
YiiAsset::register($this);
?>
<div class="samples-view">


    <div class="row">
        <div class="col-md-6">
            <div class="col-md-6">
                <a href="<?= Url::to(['director/pdf-food', 'id' => $model->sample_id]) ?>" class="btn btn-warning">Arizani PDF
                    ko'rinishda yuklab olish</a>
            </div>
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


        </div>

        <div class="col-md-6">
            <h3>Namuna ma'lumotlari</h3>
            <?= DetailView::widget([
                'model' => $sample,
                'attributes' => [
//            'id',
                    'samp_code',
                    [
                        'attribute'=>'tasnif_code',
                        'value'=>function($d){
                            return $d->tasnif->name;
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
                <h3>Shablon ma'lumotlari</h3>
                <?= DetailView::widget([
                    'model' => $result,
                    'attributes' => [
                        'code',
                        'ads',
//                        'require_id',
//                        'creator_id',
                        [
                            'attribute'=>'require_id',
                            'value'=>function($d){
                                $lg = 'uz'; if(Yii::$app->language == 'ru'){$lg = 'ru';}
                                if($d->require_id){
                                    return $d->require->{'name_'.$lg};
                                }else{
                                    return null;
                                }
                            }
                        ],
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
                            <th>№</th>
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
                                <td><?= $item->template->{'name_' . $lg} ?></td>
                                <td><?= $item->template->{'unit_' . $lg} ?></td>
                                <?php if ($item->type_id == 1) { ?>
                                    <td><?= $item->template->min . '-' . $item->template->max ?></td>
                                <?php } elseif ($item->type_id == 2) { ?>
                                    <td><?= Yii::$app->params['result'][$item->template->min] ?></td>
                                <?php } elseif ($item->type_id == 3) { ?>
                                    <td><?= $item->template->min . '-' . $item->template->max . ' %' ?></td>
                                <?php } elseif ($item->type_id == 4) { ?>
                                    <td><?= $item->template->min . '-' . $item->template->max ?>
                                        <br> <?= $item->template->min_1 . '-' . $item->template->max_1 ?></td>
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

    <?php if($model->status_id == 5){?>

        <?= Html::a('Tasdiqlash', ['director/acceptfood', 'id' => $model->id], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Rad etish', ['director/declinefood', 'id' => $model->id], ['class' => 'btn btn-danger']) ?>
    <?php }?>
</div>
