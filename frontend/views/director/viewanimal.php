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

$this->title = $model->id;
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

            <?php if ($model->status_id == 1) { ?>
                <?php $form = ActiveForm::begin() ?>

                <?php
                $data = [];
                foreach ($emp as $item) {
                    $data[$item->id] = RouteSert::find()->where(['executor_id' => $item->id])
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
                    'kod',
//            'samp_id',
                    'label',
//                    'sample_type_is',
//                    'sample_box_id',
                    [
                        'attribute' => 'sample_type_is',
                        'value' => function ($d) {
                            $lg = 'uz';
                            if (Yii::$app->language == 'ru') $lg = 'ru';
                            return $d->sampleTypeIs->{'name_' . $lg};
                        }
                    ],
                    [
                        'attribute' => 'sample_box_id',
                        'value' => function ($d) {
                            $lg = 'uz';
                            if (Yii::$app->language == 'ru') $lg = 'ru';
                            return $d->sampleBox->{'name_' . $lg};
                        }
                    ],
//                    'animal_id',
                    [
                        'attribute' => 'animal_id',
                        'value' => function ($d) {
                            $lg = 'uz';
                            if (Yii::$app->language == 'ru') $lg = 'ru';
                            $res = "";
                            $res .= $d->animal->type->{'name_' . $lg} . '<br>';
                            $res .= Yii::t('lab', 'Holati:') . ' ' . $d->animal->cat->{'name_' . $lg} . '<br>';
                            $res .= Yii::t('lab', 'Jinsi:') . ' ' . Yii::$app->params['gender'][$d->animal->gender] . '<br>';
                            $d1 = new DateTime($d->animal->birthday);
                            $d2 = new DateTime(date('Y-m-d'));
                            $interval = $d1->diff($d2);
                            $diff = $interval->m + ($interval->y * 12);
                            $res .= Yii::t('lab', 'Tug\'ilgan sanasi:') . ' ' . $d->animal->birthday . '(' . $diff . ' oy)';

                            return $res;
                        },
                        'format' => 'raw'
                    ],
//            'sert_id',
//                    'suspected_disease_id',
                    [
                        'attribute' => 'suspected_disease_id',
                        'value' => function ($d) {
                            $lg = 'uz';
                            if (Yii::$app->language == 'ru') $lg = 'ru';
                            return $d->suspectedDisease->{'name_' . $lg};
                        }
                    ],
                    [
                        'attribute' => 'test_mehod_id',
                        'value' => function ($d) {
                            $lg = 'uz';
                            if (Yii::$app->language == 'ru') $lg = 'ru';
                            return $d->testMehod->{'name_' . $lg};
                        }
                    ],

//            'state_id',
//                    'status_id',
//                    'emp_id',
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
                    'repeat_code',
                ],
            ]) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <h3>Shablon ma'lumotlari</h3>
            <?= DetailView::widget([
                'model' => $result,
                'attributes' => [
                    'temperature',
                    'humidity',
                    'reagent_series',
                    'reagent_name',
                    'conditions',
                    'end_date',
                    'ads',
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
                        <th><?= Yii::t('lab', 'Birliki') ?></th>
                        <th><?= Yii::t('lab', 'Maksimal-minimal oraliq') ?></th>
                        <th><?= Yii::t('lab', 'Qiymat') ?></th>
                        <th><?= Yii::t('lab', 'Emlashga aloqadorligi') ?></th>
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
                            <td><?= $item->template->unit->{'name_' . $lg} ?></td>
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
                            <td><?php
                                echo Yii::$app->params['is_vaccination'][$item->template->is_vaccination] . '<br>';
                                if ($item->template->is_vaccination == 1) {
                                    if ($item->template->dead_days <= 0) {
                                        echo Yii::t('lab', 'Doimiy');
                                    } else {
                                        echo $item->template->dead_days . ' ' . Yii::t('lab', 'Kun');
                                    }
                                }
                                ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <?= Html::a('Imzolash', ['director/verifyanimal', 'id' => $model->id], ['class' => 'btn btn-success']) ?>
    <?= Html::a('Rad etish', ['director/declineanimal', 'id' => $model->id], ['class' => 'btn btn-danger']) ?>


</div>
