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

    <h1><?= Html::encode($this->title) ?></h1>


    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'id',
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

        ],
    ]) ?>


    <h4>Namunalar ro'yhati</h4>
    <table class="table table-bordered table-responsive table-hover">
        <thead>

        </thead>
        <tbody>
            <tr>
                <td><a href="<?= Yii::$app->urlManager->createUrl(['/legal/addfood','id'=>$model->id])?>">Namuna qo'shish</a></td>
            </tr>
        </tbody>
    </table>
</div>
