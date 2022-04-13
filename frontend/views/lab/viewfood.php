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
        <div class="row">
            <div class="col-md-6">
                <h3>Topshiriq ma'lumotlari</h3>
                <?= DetailView::widget([
                    'model' => $model,
                    'attributes' => [

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
    </div>



    <?php if($model->status_id == 2 or $model->status_id == 6){?>
        <div class="row">
            <div>
                <h3 style="float: left">Natija ma'lumotlari</h3>
                <a href="<?= Yii::$app->urlManager->createUrl(['/lab/sendfood','id'=>$model->id])?>" class="btn btn-primary" style="float:right"><?= Yii::t('lab','Natijalarni yuborish')?></a>
            </div>
            <?php $form = ActiveForm::begin()?>

            <div class="row">
                <div class="col-md-6">

                    <?= $form->field($result,'require_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Requirements::find()->all(),'id','name_'.$lg),['prompt'=>Yii::t('lab','Talabga muvoffiqligini tanlang')])?>

                </div>

            </div>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th></th>
                        <th>№</th>
                        <th><?= Yii::t('lab','Parametr nomi')?></th>
                        <th><?= Yii::t('lab','Birlik')?></th>
                        <th><?= Yii::t('lab','Minimal-maksimal oraliq')?></th>
                        <th colspan="2"><?= Yii::t('lab','Qiymat')?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $lg = 'uz'; if(Yii::$app->language == 'ru')$lg = 'ru';?>
                    <?php $n=0; foreach ($test as $i=>$item): $n++;?>
                        <tr id="tr-<?= $item->id?>" style="<?= $item->checked == 1 ? 'background: #fff;' : 'background: #e9e9ef;'?>">
                            <td><?= $form->field($item,'['.$item->id.']checked')->checkbox(['value'=>1,'data-id'=>$item->id,'class'=>'checkboxok'],false)->label(false)?></td>
                            <td><?= $n?></td>
                            <td><?= $item->template->{'name_'.$lg}?></td>
                            <td><?= $item->template->{'unit_'.$lg}?></td>
                            <?php if($item->type_id == 1){?>
                                <td><?= $item->template->min.'-'.$item->template->max ?></td>
                            <?php }elseif($item->type_id == 2){?>
                                <td><?= Yii::$app->params['result'][$item->template->min] ?></td>
                            <?php }elseif($item->type_id == 3){?>
                                <td><?= $item->template->min.'-'.$item->template->max.' %' ?></td>
                            <?php }elseif($item->type_id == 4){?>
                                <td><?= $item->template->min.'-'.$item->template->max ?> <br> <?= $item->template->min_1.'-'.$item->template->max_1 ?></td>
                            <?php }?>

                            <?php if($item->type_id == 1){?>
                                    <td colspan="2"><?= $form->field($item,'['.$item->id.']result')->textInput(['placeholder'=>Yii::t('lab','Natijani kiriting'),'disabled'=>$item->checked == 1? false : true])->label(false)?></td>
                            <?php }elseif($item->type_id == 2){?>
                                <td colspan="2"><?= $form->field($item,'['.$item->id.']result')->dropDownList([0=>Yii::$app->params['result'][0],1=>Yii::$app->params['result'][1]],['prompt'=>Yii::t('lab','Natijani tanlang'),'disabled'=>$item->checked == 1? false : true])->label(false)?></td>
                            <?php }elseif($item->type_id == 3){?>
                                <td colspan="2"><?= $form->field($item,'['.$item->id.']result')->textInput(['placeholder'=>Yii::t('lab','Natijani kiriting'),'disabled'=>$item->checked == 1? false : true])->label(false)?></td>
                            <?php }elseif($item->type_id == 4){?>
                                <td><?= $form->field($item,'['.$item->id.']result')->textInput(['placeholder'=>Yii::t('lab','Natijani kiriting'),'disabled'=>$item->checked == 1? false : true])->label(false)?></td>
                                <td><?= $form->field($item,'['.$item->id.']result_2')->textInput(['placeholder'=>Yii::t('lab','Natijani kiriting'),'disabled'=>$item->checked == 1? false : true])->label(false)?></td>
                            <?php }?>


                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>

                <?= $form->field($result,'ads')->dropDownList([0=>Yii::t('lab','Tasdiqlandi'),1=>Yii::t('lab','Tasdiqlanmadi')],['prompt'=>'Umumiy natijani tanlang'])?>


            </div>

            <button type="submit" class="btn btn-success"><?= Yii::t('lab','Saqlash')?></button>

            <?php ActiveForm::end()?>

            <h3  style="margin-top:20px;">Tavfsiya qo'shish:</h3>
            <?php $f = ActiveForm::begin()?>

            <?= $f->field($recom,'name')->textInput()?>

            <button class="btn btn-primary">Tavfsiyani saqlash</button>
            <?php ActiveForm::end()?>
            <h3  style="margin-top:20px;">Tavfsiyalar ro'yhati:</h3>
            <div class="row">
                <div class="col-md-12">
                    <ul>
                        <?php $rec = \common\models\FoodRecomendation::find()->where(['sample_id'=>$sample->id])->all();

                        foreach ($rec as $item):
                            ?>
                            <li><?= $item->name?></li>
                        <?php endforeach;?>
                    </ul>
                </div>
            </div>


        </div>
    <?php } else{?>

    <div class="row">
        <div>
            <h3 style="float: left">Natija ma'lumotlari</h3>
        </div>
        <?php $form = ActiveForm::begin()?>

        <div class="row">
            <div class="col-md-6">

                <?= $form->field($result,'require_id')->dropDownList(
                        \yii\helpers\ArrayHelper::map(\common\models\Requirements::find()->all(),'id','name_'.$lg),
                        ['prompt'=>Yii::t('lab','Talabga muvoffiqligini tanlang'),'disabled'=>true]
                )?>



            </div>

        </div>

        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th></th>
                    <th>№</th>
                    <th><?= Yii::t('lab','Parametr nomi')?></th>
                    <th><?= Yii::t('lab','Birlik')?></th>
                    <th><?= Yii::t('lab','Minimal-maksimal oraliq')?></th>
                    <th colspan="2"><?= Yii::t('lab','Qiymat')?></th>
                </tr>
                </thead>
                <tbody>
                <?php $lg = 'uz'; if(Yii::$app->language == 'ru')$lg = 'ru';?>
                <?php $n=0; foreach ($test as $i=>$item): $n++;?>
                    <tr style="background: #e9e9ef;">
                        <td><?= $form->field($item,'['.$item->id.']checked')->checkbox(['value'=>1,'disabled'=>true],false)->label(false)?></td>
                        <td><?= $n?></td>
                        <td><?= $item->template->{'name_'.$lg}?></td>
                        <td><?= $item->template->{'unit_'.$lg}?></td>
                        <?php if($item->type_id == 1){?>
                            <td><?= $item->template->min.'-'.$item->template->max ?></td>
                        <?php }elseif($item->type_id == 2){?>
                            <td><?= Yii::$app->params['result'][$item->template->min] ?></td>
                        <?php }elseif($item->type_id == 3){?>
                            <td><?= $item->template->min.'-'.$item->template->max.' %' ?></td>
                        <?php }elseif($item->type_id == 4){?>
                            <td><?= $item->template->min.'-'.$item->template->max ?> <br> <?= $item->template->min_1.'-'.$item->template->max_1 ?></td>
                        <?php }?>

                        <?php if($item->type_id == 1){?>
                            <td colspan="2"><?= $form->field($item,'['.$item->id.']result')->textInput(['disabled'=>true,'placeholder'=>Yii::t('lab','Natijani kiriting')])->label(false)?></td>
                        <?php }elseif($item->type_id == 2){?>
                            <td colspan="2"><?= $form->field($item,'['.$item->id.']result')->dropDownList([0=>Yii::$app->params['result'][0],1=>Yii::$app->params['result'][1]],['prompt'=>Yii::t('lab','Natijani tanlang'),'disabled'=>true])->label(false)?></td>
                        <?php }elseif($item->type_id == 3){?>
                            <td colspan="2"><?= $form->field($item,'['.$item->id.']result')->textInput(['placeholder'=>Yii::t('lab','Natijani kiriting'),'disabled'=>true])->label(false)?></td>
                        <?php }elseif($item->type_id == 4){?>
                            <td><?= $form->field($item,'['.$item->id.']result')->textInput(['placeholder'=>Yii::t('lab','Natijani kiriting'),'disabled'=>true])->label(false)?></td>
                            <td><?= $form->field($item,'['.$item->id.']result_2')->textInput(['placeholder'=>Yii::t('lab','Natijani kiriting'),'disabled'=>true])->label(false)?></td>
                        <?php }?>


                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
            <?= $form->field($result,'ads')->dropDownList([0=>Yii::t('lab','Tasdiqlandi'),1=>Yii::t('lab','Tasdiqlanmadi')],['disabled'=>true])?>


        </div>

        <?php ActiveForm::end()?>
    </div>

        <h3  style="margin-top:20px;">Tavfsiyalar ro'yhati:</h3>
        <div class="row">
            <div class="col-md-12">
                <ul>
                    <?php $rec = \common\models\FoodRecomendation::find()->where(['sample_id'=>$sample->id])->all();
                    foreach ($rec as $item):
                        ?>
                        <li><?= $item->name?></li>
                    <?php endforeach;?>
                </ul>
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
            $('#resultfoodtests-'+id+'-result').prop('disabled',false);
        }else{
            $('#tr-'+id).css('background','#e9e9ef');
            $('#resultfoodtests-'+id+'-result').prop('disabled',true);
        }
    })
")
?>