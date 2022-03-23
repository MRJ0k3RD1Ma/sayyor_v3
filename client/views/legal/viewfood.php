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
            'sampling_site',
            'sampling_adress',
//            'sampler_organization_code',
            'sampler_person_pnfl',
//            'unit_id',
//            'count',
            'verification_sample',
//            'producer',
//            'serial_num',
//            'manufacture_date',
//            'sell_by',
//            'coments',
            'verification_pupose_id',
//            'sample_box_id',
//            'sample_condition_id',
            'sampling_date',
            'send_sample_date',
//            'explanations',
            'based_public_information',
            'message_number',
//            'laboratory_test_type_id',
        ],
    ]) ?>

</div>
