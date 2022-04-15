<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Samples */
/* @var $result common\models\ResultAnimal */
/* @var $test common\models\ResultAnimalTests */

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

                <h3><?= Yii::t('leader', 'Normativ hujjatlar') ?></h3>
                <ul>
                    <?php $lg = 'uz';
                    if (Yii::$app->language == 'ru') $lg = 'ru' ?>
                    <?php foreach ($docs as $item): ?>
                        <?php $url = '#';
                        if ($item->file) $url = '/uploads/' . $item->file; ?>
                        <li><a href="<?= $url ?>"><?= $item->{'name_' . $lg} ?></a></li>
                    <?php endforeach; ?>
                </ul>
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
                        [
                            'label' => Yii::t('lab', 'Vaksinalashlar tarixi'),
                            'value' => function ($d) {
                                $vac = $d->animal->vaccinations;
                                $res = "";
                                $lg = 'uz';
                                if (Yii::$app->language == 'ru') $lg = 'ru';
                                foreach ($vac as $item) {
                                    $res .= "{$item->disease->{'name_'.$lg}} - {$item->disease_date}<br>";
                                }
                                return $res;
                            },
                            'format' => 'raw',
                        ],
                        [
                            'label' => Yii::t('lab', 'Davolashlar tarixi'),
                            'value' => function ($d) {
                                $vac = $d->animal->emlash;
                                $res = "";
                                $lg = 'uz';
                                if (Yii::$app->language == 'ru') $lg = 'ru';
                                foreach ($vac as $item) {
                                    $res .= "{$item->antibiotic} - {$item->emlash_date}<br>";
                                }
                                return $res;
                            },
                            'format' => 'raw',
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


        <?php if ($model->status_id == 2 or $model->status_id == 6) { ?>
            <div class="row">
                <div>
                    <h3 style="float: left">Tekshiruv sharoiti</h3>
                    <a href="<?= Yii::$app->urlManager->createUrl(['/lab/sendanimal', 'id' => $model->id]) ?>"
                       class="btn btn-primary" style="float:right"><?= Yii::t('lab', 'Natijalarni yuborish') ?></a>
                </div>
                <?php $form = ActiveForm::begin() ?>

                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($result, 'temprature')->textInput(['type' => 'number']) ?>

                        <?= $form->field($result, 'humidity')->textInput(['type' => 'number']) ?>

                        <?= $form->field($result, 'reagent_series')->textInput() ?>

                        <?= $form->field($result, 'reagent_name')->textInput() ?>

                    </div>
                    <div class="col-md-6">
                        <?= $form->field($result, 'conditions')->textInput() ?>

                        <?= $form->field($result, 'end_date')->textInput(['type' => 'date']) ?>


                </div>
            </div>

                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th></th>
                            <th>№</th>
                            <th><?= Yii::t('lab', 'Parametr nomi') ?></th>
                            <th><?= Yii::t('lab', 'Birlik') ?></th>
                            <th><?= Yii::t('lab', 'Minimal-maksimal oraliq') ?></th>
                            <th colspan="2"><?= Yii::t('lab', 'Qiymat') ?></th>
                            <th><?= Yii::t('lab', 'Emlashga aloqadorligi') ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php $lg = 'uz';
                        if (Yii::$app->language == 'ru') $lg = 'ru'; ?>
                        <?php $n = 0;
                        foreach ($test as $i => $item): $n++; ?>
                            <tr id="tr-<?= $item->id ?>"
                                style="<?= $item->checked == 1 ? 'background: #fff;' : 'background: #e9e9ef;' ?>">
                                <td><?= $form->field($item, '[' . $item->id . ']checked')->checkbox(['value' => 1, 'data-id' => $item->id, 'class' => 'checkboxok'], false)->label(false) ?></td>
                                <td><?= $n ?></td>
                                <td><?= $item->template->{'name_' . $lg} ?></td>
                                <td><?= $item->template->unit->{'name_' . $lg} ?></td>
                                <?php if ($item->template->unit->type_id == 1) { ?>
                                    <td><?= $item->template->min . '-' . $item->template->max ?></td>
                                <?php } elseif ($item->template->unit->type_id == 2) { ?>
                                    <td><?= Yii::$app->params['result'][$item->template->min] ?></td>
                                <?php } elseif ($item->template->unit->type_id == 3) { ?>
                                    <td><?= $item->template->min . '-' . $item->template->max . ' %' ?></td>
                                <?php } elseif ($item->template->unit->type_id == 4) { ?>
                                    <td><?= $item->template->min . '-' . $item->template->max ?>
                                        <br> <?= $item->template->min_1 . '-' . $item->template->max_1 ?></td>
                                <?php } ?>

                                <?php if ($item->template->unit->type_id == 1) { ?>
                                    <td colspan="2"><?= $form->field($item, '[' . $item->id . ']result')->textInput(['placeholder' => Yii::t('lab', 'Natijani kiriting'), 'disabled' => $item->checked == 1 ? false : true])->label(false) ?></td>
                                <?php } elseif ($item->template->unit->type_id == 2) { ?>
                                    <td colspan="2"><?= $form->field($item, '[' . $item->id . ']result')->dropDownList([0 => Yii::$app->params['result'][0], 1 => Yii::$app->params['result'][1]], ['prompt' => Yii::t('lab', 'Natijani tanlang'), 'disabled' => $item->checked == 1 ? false : true])->label(false) ?></td>
                                <?php } elseif ($item->template->unit->type_id == 3) { ?>
                                    <td colspan="2"><?= $form->field($item, '[' . $item->id . ']result')->textInput(['placeholder' => Yii::t('lab', 'Natijani kiriting'), 'disabled' => $item->checked == 1 ? false : true])->label(false) ?></td>
                                <?php } elseif ($item->template->unit->type_id == 4) { ?>
                                    <td>
                                        <?= $form->field($item, '[' . $item->id . ']result')->textInput(['placeholder' => Yii::t('lab', 'Natijani kiriting'), 'disabled' => $item->checked == 1 ? false : true])->label(false) ?>
                                    </td>
                                    <td>
                                        <?= $form->field($item, '[' . $item->id . ']result_2')->textInput(['placeholder' => Yii::t('lab', 'Natijani kiriting'), 'disabled' => $item->checked == 1 ? false : true])->label(false) ?>
                                    </td>

                                <?php } ?>

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
                    <?= $form->field($result,'ads')->dropDownList(['0'=>Yii::t('lab','Tasdiqlanmadi'),1=>Yii::t('lab','Tasdiqlandi')],['prompt'=>Yii::t('lab','Umumiy tekshiruv natijasi')])?>
            </div>

                <h4>O'tkazilgan tekshiruv natijalari:</h4>
                    <div class="row">
                        <div class="col-md-2">
                            <?= $form->field($result,'patonomiya')->textInput()?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'organoleptika')->textInput()?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'mikroskopiya_nurli')->textInput()?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'mikroskopiya_lyuminesent')->textInput()?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'bakterilogik')->textInput()?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'virusologik_TE_KE')->textInput()?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'virusologik_XM_KK')->textInput()?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'biologik')->textInput()?>
                        </div>


                   <h4> Serologik tekshiruvlar:</h4>
                        <div class="row">
                            <div class="col-md-2">
                                <?= $form->field($result,'RA_KR')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RSK')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RDSK')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RBP')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RMA')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RP_RDP')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RH')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RNGA')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RGA')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'IFA')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'IXLA')->textInput()?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'boshqa_serologiya')->textInput()?>
                            </div>
                        </div>


                   <div class="row">
                       <div class="col-md-2">
                           <?= $form->field($result,'PSR')->textInput()?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'gistologiya')->textInput()?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'gemotologiya')->textInput()?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'koprologiya')->textInput()?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'kimyoviy')->textInput()?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'biokimyoviy')->textInput()?>
                       </div>

                   </div>
                    </div>


                <button type="submit" class="btn btn-success"><?= Yii::t('lab', 'Saqlash') ?></button>

                <?php ActiveForm::end() ?>
                <h3  style="margin-top:20px;">Tavfsiya qo'shish:</h3>
                <?php $f = ActiveForm::begin()?>

                    <?= $f->field($recom,'name')->textInput()?>

                    <button class="btn btn-primary">Tavfsiyani saqlash</button>
                <?php ActiveForm::end()?>
                <h3  style="margin-top:20px;">Tavfsiyalar ro'yhati:</h3>
                <div class="row">
                    <div class="col-md-12">
                        <ul>
                            <?php $rec = \common\models\SampleRecomendation::find()->where(['sample_id'=>$sample->id])->all();
                            foreach ($rec as $item):
                                ?>
                                <li><?= $item->name?></li>
                            <?php endforeach;?>
                        </ul>
                    </div>
                </div>



            </div>
        <?php } else { ?>

            <div class="row">
                <div>
                    <h3 style="float: left">Tekshiruv sharoiti</h3>
                </div>
                <?php $form = ActiveForm::begin() ?>
                <?= $form->field($result, 'id')->hiddenInput()->label(false) ?>

                <div class="row">
                    <div class="col-md-6">
                        <?= $form->field($result, 'temprature')->textInput(['type' => 'number', 'disabled' => true]) ?>

                        <?= $form->field($result, 'humidity')->textInput(['type' => 'number', 'disabled' => true]) ?>

                        <?= $form->field($result, 'reagent_series')->textInput(['disabled' => true]) ?>

                        <?= $form->field($result, 'reagent_name')->textInput(['disabled' => true]) ?>

                    </div>
                    <div class="col-md-6">
                        <?= $form->field($result, 'conditions')->textInput(['disabled' => true]) ?>

                        <?= $form->field($result, 'end_date')->textInput(['type' => 'date', 'disabled' => true]) ?>

                        <?= $form->field($result, 'ads')->textInput(['disabled' => true]) ?>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th></th>
                            <th>№</th>
                            <th><?= Yii::t('lab', 'Parametr nomi') ?></th>
                            <th><?= Yii::t('lab', 'Birlik') ?></th>
                            <th><?= Yii::t('lab', 'Minimal-maksimal oraliq') ?></th>
                            <th colspan="2"><?= Yii::t('lab', 'Qiymat') ?></th>
                            <th><?= Yii::t('lab', 'Emlashga aloqadorligi') ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php $lg = 'uz';
                        if (Yii::$app->language == 'ru') $lg = 'ru'; ?>
                        <?php $n = 0;
                        foreach ($test as $i => $item): $n++; ?>
                            <tr style="background: #e9e9ef;">
                                <td><?= $form->field($item, '[' . $item->id . ']checked')->checkbox(['value' => 1, 'disabled' => true], false)->label(false) ?></td>
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

                                <?php if ($item->type_id == 1) { ?>
                                    <td colspan="2"><?= $form->field($item, '[' . $item->id . ']result')->textInput(['disabled' => true, 'placeholder' => Yii::t('lab', 'Natijani kiriting')])->label(false) ?></td>
                                <?php } elseif ($item->type_id == 2) { ?>
                                    <td colspan="2"><?= $form->field($item, '[' . $item->id . ']result')->dropDownList([0 => Yii::$app->params['result'][0], 1 => Yii::$app->params['result'][1]], ['prompt' => Yii::t('lab', 'Natijani tanlang'), 'disabled' => true])->label(false) ?></td>
                                <?php } elseif ($item->type_id == 3) { ?>
                                    <td colspan="2"><?= $form->field($item, '[' . $item->id . ']result')->textInput(['placeholder' => Yii::t('lab', 'Natijani kiriting'), 'disabled' => true])->label(false) ?></td>
                                <?php } elseif ($item->type_id == 4) { ?>
                                    <td><?= $form->field($item, '[' . $item->id . ']result')->textInput(['placeholder' => Yii::t('lab', 'Natijani kiriting'), 'disabled' => true])->label(false) ?></td>
                                    <td><?= $form->field($item, '[' . $item->id . ']result_2')->textInput(['placeholder' => Yii::t('lab', 'Natijani kiriting'), 'disabled' => true])->label(false) ?></td>
                                <?php } ?>

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
            <?= $form->field($result,'ads')->dropDownList(['0'=>Yii::t('lab','Tasdiqlanmadi'),1=>Yii::t('lab','Tasdiqlandi')],['prompt'=>Yii::t('lab','Umumiy tekshiruv natijasi'),'disabled'=>true])?>

        </div>
                <h4>O'tkazilgan tekshiruv natijalari:</h4>
                <div class="row">
                    <div class="col-md-2">
                        <?= $form->field($result,'patonomiya')->textInput(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'organoleptika')->textInput(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'mikroskopiya_nurli')->textInput(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'mikroskopiya_lyuminesent')->textInput(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'bakterilogik')->textInput(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'virusologik_TE_KE')->textInput(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'virusologik_XM_KK')->textInput(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'biologik')->textInput(['disabled'=>true])?>
                    </div>


                    <h4> Serologik tekshiruvlar:</h4>
                    <div class="row">
                        <div class="col-md-2">
                            <?= $form->field($result,'RA_KR')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RSK')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RDSK')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RBP')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RMA')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RP_RDP')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RH')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RNGA')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RGA')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'IFA')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'IXLA')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'boshqa_serologiya')->textInput(['disabled'=>true])?>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-2">
                            <?= $form->field($result,'PSR')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'gistologiya')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'gemotologiya')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'koprologiya')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'kimyoviy')->textInput(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'biokimyoviy')->textInput(['disabled'=>true])?>
                        </div>

                    </div>
                </div>
        <?php ActiveForm::end()?>


                <div class="row">
                    <div class="col-md-12">
                        <h3  style="margin-top:20px;">Tavfsiyalar ro'yhati:</h3>

                        <ul>
                            <?php $rec = \common\models\SampleRecomendation::find()->where(['sample_id'=>$sample->id])->all();
                            foreach ($rec as $item):
                                ?>
                                <li><?= $item->name?></li>
                            <?php endforeach;?>
                        </ul>
                    </div>
                </div>

            </div>

    <?php }?>

</div>


<?php
$this->registerJs("
    $('.checkboxok').change(function(){
        // is cheked bolsa shatadi shuni yoziparaman
        var id = this.getAttribute('data-id');
        if(this.checked){
            $('#tr-'+id).css('background','#fff');
            $('#resultanimaltests-'+id+'-result').prop('disabled',false);
            $('#resultanimaltests-'+id+'-result_2').prop('disabled',false);
        }else{
            $('#tr-'+id).css('background','#e9e9ef');
            $('#resultanimaltests-'+id+'-result').prop('disabled',true);
            $('#resultanimaltests-'+id+'-result_2').prop('disabled',true);
        }
    })
")
?>