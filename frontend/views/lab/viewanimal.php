<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Samples */
/* @var $result common\models\ResultAnimal */
/* @var $test common\models\ResultAnimalTests */

$this->title = $model->sample->kod.' '.Yii::t('cp','sonli hayvon kasalliklari tashhisi bo`yicha namuna');
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
                            <th>ID</th>
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
                                <td><?= $item->id ?></td>
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
                            <?= $form->field($result,'patonomiya')->checkbox(['value'=>1])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'organoleptika')->checkbox(['value'=>1])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'mikroskopiya_nurli')->checkbox(['value'=>1])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'mikroskopiya_lyuminesent')->checkbox(['value'=>1])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'bakterilogik')->checkbox(['value'=>1])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'virusologik_TE_KE')->checkbox(['value'=>1])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'virusologik_XM_KK')->checkbox(['value'=>1])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'biologik')->checkbox(['value'=>1])?>
                        </div>


                   <h4> Serologik tekshiruvlar:</h4>
                        <div class="row">
                            <div class="col-md-2">
                                <?= $form->field($result,'RA_KR')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RSK')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RDSK')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RBP')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RMA')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RP_RDP')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RH')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RNGA')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'RGA')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'IFA')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'IXLA')->checkbox(['value'=>1])?>
                            </div>
                            <div class="col-md-2">
                                <?= $form->field($result,'boshqa_serologiya')->checkbox(['value'=>1])?>
                            </div>
                        </div>


                   <div class="row">
                       <div class="col-md-2">
                           <?= $form->field($result,'PSR')->checkbox(['value'=>1])?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'gistologiya')->checkbox(['value'=>1])?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'gemotologiya')->checkbox(['value'=>1])?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'koprologiya')->checkbox(['value'=>1])?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'kimyoviy')->checkbox(['value'=>1])?>
                       </div>
                       <div class="col-md-2">
                           <?= $form->field($result,'biokimyoviy')->checkbox(['value'=>1])?>
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
                            <th>ID</th>
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
                                <td><?= $item->id ?></td>
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
                <h4>O`tkazilgan tekshruv 4VET uchun:</h4>
                <div class="row">
                    <div class="col-md-2">
                        <?= $form->field($result,'patonomiya')->checkbox(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'organoleptika')->checkbox(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'mikroskopiya_nurli')->checkbox(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'mikroskopiya_lyuminesent')->checkbox(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'bakterilogik')->checkbox(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'virusologik_TE_KE')->checkbox(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'virusologik_XM_KK')->checkbox(['disabled'=>true])?>
                    </div>
                    <div class="col-md-2">
                        <?= $form->field($result,'biologik')->checkbox(['disabled'=>true])?>
                    </div>


                    <h4> Serologik tekshiruvlar:</h4>
                    <div class="row">
                        <div class="col-md-2">
                            <?= $form->field($result,'RA_KR')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RSK')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RDSK')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RBP')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RMA')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RP_RDP')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RH')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RNGA')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'RGA')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'IFA')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'IXLA')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'boshqa_serologiya')->checkbox(['disabled'=>true])?>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-2">
                            <?= $form->field($result,'PSR')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'gistologiya')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'gemotologiya')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'koprologiya')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'kimyoviy')->checkbox(['disabled'=>true])?>
                        </div>
                        <div class="col-md-2">
                            <?= $form->field($result,'biokimyoviy')->checkbox(['disabled'=>true])?>
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