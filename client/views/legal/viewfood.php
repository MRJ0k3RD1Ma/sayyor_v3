<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\FoodSamplingCertificate */

$this->title = $model->code;
$this->params['breadcrumbs'][] = ['label' => Yii::t('cp.food_sampling_certificate', 'Dalolatnomalar ro\'yhati'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="food-sampling-certificate-view">

    <p>
        <?php if($model->status_id==0){?>
            <a class="btn btn-success" href="<?= Yii::$app->urlManager->createUrl(['/legal/sendfood','id'=>$model->id])?>">Ariza yuborish</a>
        <?php }?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'id',
            'sert_number',
            'sert_date',
            'code',
//            'pnfl',
//            'organization_id',
            [
                'label'=>Yii::t('client','Buyurtmachi'),
                'value'=>function($d){
                    if($d->pnfl){
                        return $d->pnfl.'<br>'.$d->pnfl0->name.' '.$d->pnfl0->surname.' '.$d->pnfl0->middlename;
                    }elseif($d->inn){
                        return $d->inn.'<br>'.$d->inn0->name;
                    }else return null;
                },
                'format'=>'raw'
            ],
//            'sampling_site',
            [
                'attribute'=>'sampling_site',
                'value'=>function($d){
                    return $d->samplingSite->name;
                }
            ],
            [
                'attribute'=>'sampling_adress',
                'value'=>function($d){
                    $lang = Yii::$app->language;
                    $ads = 'lot';
                    if($lang == 'ru'){
                        $ads = 'ru';
                    }elseif($lang=='uz'){
                        $ads = 'lot';
                    }else{
                        $ads = 'cyr';
                    }
                    return \common\models\Soato::Full($d->samplingSite->soato) .' '. $d->sampling_adress;
                },
                'format'=>'raw'
            ],
            [
                'label'=>Yii::t('client','Namuna oluvchi'),
                'value'=>function($d){
                    if($d->sampler_person_pnfl){
                        return $d->sampler_person_pnfl.'<br>'.$d->personPnfl->name.' '.$d->personPnfl->surname.' '.$d->personPnfl->middlename;
                    }elseif($d->sampler_person_inn){
                        return $d->sampler_person_inn.'<br>'.$d->personInn->name;
                    }else return null;
                },
                'format'=>'raw'
            ],

            [
                'attribute'=>'verification_pupose_id',
                'value'=>function($d){
                    $lang = Yii::$app->language;
                    $lg = 'uz';
                    if($lang == 'ru'){
                        $lg = 'ru';
                    }
                    if($d->verification_pupose_id){
                        return $d->verificationPupose->{'name_'.$lg};
                    }else{
                        return null;
                    }
                }
            ],
            'sampling_date',
            'send_sample_date',

            [
                'attribute'=>'based_public_information',
                'value'=>function($d){
                    if($d->based_public_information == 0){
                        return Yii::t('client','Yo\'q');
                    }else{
                        return Yii::t('client','Ha').'<br>'.'<b>№'.$d->message_number.'</b>';
                    }

                },
                'format'=>'raw'
            ],
            [
                'attribute'=>'sampler_name',
                'label'=>'Namuna oluvchi shaxs',
                'value'=>function($d){
                    return $d->sampler_name.'<br>'.$d->sampler_position;
                },
                'format'=>'raw'
            ],
            [
                'attribute'=>'status_id',
                'value'=>function($d){
                    $lg = 'uz';
                    if(Yii::$app->language == 'ru'){
                        $lg = 'ru';
                    }
                    return $d->status->{'name_'.$lg};
                }
            ],

        ],
    ]) ?>


    <div>
        <h4 style="float: left">Namunalar ro'yhati</h4>
        <?php if($model->status_id==0){ ?>
            <span style="float: right"><a class="btn btn-primary" href="<?= Yii::$app->urlManager->createUrl(['/legal/addfood','id'=>$model->id])?>">
                    <span class="fa fa-plus"></span> Namuna qo'shish
                </a>
            </span>
        <?php } ?>

    </div>

    <div class="table-responsive">
    <table class="table table-bordered  table-hover mt-3">
        <thead>
            <tr>
                <th>№</th>
                <th>Nomi</th>
                <th>Soni</th>
                <th>O'rami</th>
                <th>Holati</th>
                <th>To'plam</th>
                <th>Ishlab chiqaruvchi</th>
                <th>Serya raqami</th>
                <th>Yaroqlilik muddati</th>
                <th>Test turi</th>
            </tr>
        </thead>
        <tbody>
            <?php
                $lang = Yii::$app->language;
                $lg = 'uz';
                if($lang == 'ru'){
                    $lg = 'ru';
                }
            ?>
            <?php foreach ($samp as $item):?>
                <tr>
                    <td><?= $item->status->icon.' '.$item->samp_code ?></td>
                    <td><?= $item->tasnif->name?></td>
                    <td><?= $item->count.' '.$item->unit->{'name_'.$lg}?></td>
                    <td><?= $item->sampleBox->{'name_'.$lg}?></td>
                    <td><?= $item->sampleCondition->{'name_'.$lg}?></td>
                    <td><?= $item->total_amount?></td>
                    <td><?= $item->producer?></td>
                    <td><?= $item->serial_num?></td>
                    <td><?= $item->sell_by ?></td>
                    <td><?= $item->laboratoryTestType->{'name_'.$lg} ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    </div>
</div>
