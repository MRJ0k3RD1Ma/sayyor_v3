<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh;
use Endroid\QrCode\Label\Alignment\LabelAlignmentCenter;
use Endroid\QrCode\Label\Font\NotoSans;
use Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin;
use Endroid\QrCode\Writer\PngWriter;

/* @var $this yii\web\View */
/* @var $model common\models\Sertificates */

$this->title = $model->sert_full;
$this->params['breadcrumbs'][] = ['label' => Yii::t('cp.sertificates', 'Dalolatnomalar'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="sertificates-view">


    <p>
        <?= Html::a(Yii::t('cp.sertificates', 'O\'zgartirish'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?php if($model->status_id == 1){?>
            <?= Html::a(Yii::t('cp.sertificates', 'Arizani yuborish'), ['send', 'id' => $model->id], ['class' => 'btn btn-success']) ?>
        <?php }?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'sert_full',
            'sert_num',
            'sert_date',
//            'organization_id',
            [
                'attribute'=>'organization_id',
                'value'=>function($d){
                    return $d->organization->NAME_FULL;
                }
            ],
//            'pnfl',
            'owner_name',
//            'vet_site_id',
            [
                'attribute'=>'vet_site_id',
                'value'=>function($d){
                    return $d->vetSite->name;
                }
            ],
            [
                'attribute'=>'status_id',
                'value'=>function($d){
                    if(Yii::$app->language == 'ru'){
                        return $d->status->name_ru;
                    }
                    return $d->status->name_uz;
                }
            ],
            [
                'label'=>Yii::t('client','Arizani kuzatish'),
                'value'=>function($d){
                    $result = Builder::create()
                        ->writer(new PngWriter())
                        ->writerOptions([])
                        ->data(Yii::$app->urlManager->createAbsoluteUrl(['/site/viewsert','id'=>$d->id]))
                        ->encoding(new Encoding('UTF-8'))
                        ->errorCorrectionLevel(new ErrorCorrectionLevelHigh())
                        ->size(100)
                        ->margin(3)
                        ->roundBlockSizeMode(new RoundBlockSizeModeMargin())
//                        ->logoPath(Yii::$app->basePath.'/web/favicon.ico')
                        ->labelText('')
                        ->labelFont(new NotoSans(20))
                        ->labelAlignment(new LabelAlignmentCenter())
                        ->build();
                    return "<img src='{$result->getDataUri()}'>";

                },
                'format'=>'raw'
            ],
//            'operator',
        ],
    ]) ?>

</div>


<div class="row">
    <div class="col-md-12 table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th rowspan="2">№</th>
                    <th rowspan="2">Namuna belgisi</th>
                    <th rowspan="2">Namuna turi</th>
                    <th rowspan="2">Namuna o'rami</th>
                    <th colspan="4">Namuna olingan hayvon haqida ma'lumot</th>
                    <th colspan="2">Emlash</th>
                    <th colspan="2">Davolash</th>
                    <th rowspan="2">Qaysi kasallikga gumon</th>
                    <th rowspan="2">Tahlil usuli</th>
                    <th rowspan="2">Takroriy tahlil raqami</th>
                </tr>
                <tr>
                    <th>Identifikatsiya raqami</th>
                    <th>Hayvon turi</th>
                    <th>Hayvon jinsi</th>
                    <th>Yoshi oy</th>
                    <th>Kasallikga qarshi</th>
                    <th>Emlash sanasi</th>
                    <th>Antibiotik turi</th>
                    <th>Sanasi</th>
                </tr>
            </thead>
            <tbody>
                <?php $n=0; foreach (\common\models\Samples::find()->where(['sert_id'=>$model->id])->all() as $item): $n++;
                $cnt_vac = \common\models\Vaccination::find()->where(['animal_id'=>$item->animal_id])->count('*');
                $cnt_eml = \common\models\Emlash::find()->where(['animal_id'=>$item->animal_id])->count('*');
                if($cnt_vac > $cnt_eml){
                    $cnt = $cnt_vac;
                }else{
                    $cnt = $cnt_eml;
                }
                ?>
                    <tr>
                        <td rowspan="<?= $cnt + 1?>"><?= $n?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->label ?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->sampleTypeIs->name_uz ?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->sampleBox->name_uz ?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->animal_id ?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->animal->type->name_uz ?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= Yii::$app->params['gender'][$item->animal->gender] ?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->animal->birthday ?></td>
                        <td colspan="2"><a class="btn btn-primary" href="<?= Yii::$app->urlManager->createUrl(['/legal/vaccination','id'=>$item->animal_id,'sert_id'=>$model->id])?>">Emlash</a></td>
                        <td colspan="2"><a class="btn btn-primary" href="<?= Yii::$app->urlManager->createUrl(['/legal/emlash','id'=>$item->animal_id,'sert_id'=>$model->id])?>">Davolash</a></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->suspectedDisease->name_uz?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->testMehod->name_uz?></td>
                        <td rowspan="<?= $cnt + 1?>"><?= $item->kod?></td>
                    </tr>
                    <?php
                    $vac = \common\models\Vaccination::find()->where(['animal_id'=>$item->animal_id])->orderBy(['disease_date'=>SORT_DESC])->all();
                    $eml = \common\models\Emlash::find()->where(['animal_id'=>$item->animal_id])->orderBy(['emlash_date'=>SORT_DESC])->all();
                    for ($i=0;$i<$cnt; $i++):?>
                    <tr>
                        <td><?= isset($vac[$i]) ? $vac[$i]->disease->name_uz : ' ' ?></td>
                        <td><?= isset($vac[$i]) ? $vac[$i]->disease_date : ' '?></td>
                        <td><?= isset($eml[$i]) ? $eml[$i]->antibiotic : ' ' ?></td>
                        <td><?= isset($eml[$i]) ? $eml[$i]->emlash_date : ' '?></td>
                    </tr>
                    <?php endfor; ?>
                <?php endforeach;?>
                <tr>
                    <td colspan="15"><a href="<?= Yii::$app->urlManager->createUrl(['/legal/add','id'=>$model->id])?>" class="btn btn-primary">Yana qo'shish</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>