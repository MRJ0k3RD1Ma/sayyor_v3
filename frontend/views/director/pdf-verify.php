<?php

/* @var $regmodel common\models\SampleRegistration */
/* @var $model common\models\Samples */
/* @var $composite common\models\CompositeSamples */

/* @var $sertificate common\models\Sertificates */

use common\models\Employees;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\RouteSert;
use common\models\Soato;
use common\models\Tshx;
use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh;
use Endroid\QrCode\Label\Alignment\LabelAlignmentCenter;
use Endroid\QrCode\Label\Font\NotoSans;
use Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin;
use Endroid\QrCode\Writer\PngWriter;
use yii\helpers\VarDumper;

$composite = $regmodel->comp;
$samples = $model;
$sertificate = $samples->sert;
$resultanimal = ResultAnimal::findOne(['sample_id' => $samples->id]);


$route = RouteSert::findOne(['sample_id' => $samples->id]);
$routesert = $route->registration_id;

$lg = 'uz';


//errdeb($routesert);
$docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations', 'template_animal_regulations.regulation_id = regulations.id')
    ->innerJoin('tamplate_animal', 'template_animal_regulations.template_id = tamplate_animal.id')
    ->orderBy('template_animal_regulations.regulation_id')
    ->where('tamplate_animal.id IN (SELECT result_animal_tests.id from result_animal_tests inner join tamplate_animal on result_animal_tests.template_id=tamplate_animal.id where result_animal_tests.result_id=' . $routesert . ')')->all();
//errdeb($routesert);
//$qr = function () use ($sertificate) {
$result = Builder::create()
    ->writer(new PngWriter())
    ->writerOptions([])
    ->data(Yii::$app->urlManager->createAbsoluteUrl(['/site/get-myresult', 'id' => $sertificate->id]))
    ->encoding(new Encoding('UTF-8'))
    ->errorCorrectionLevel(new ErrorCorrectionLevelHigh())
    ->size(150)
    ->margin(1)
    ->roundBlockSizeMode(new RoundBlockSizeModeMargin())
//                        ->logoPath(Yii::$app->basePath.'/web/favicon.ico')
    ->labelText('')
    ->labelFont(new NotoSans(20))
    ->labelAlignment(new LabelAlignmentCenter())
    ->build();
$qr = "<img src='{$result->getDataUri()}'>";
//};
?>

<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th style="width: 50%;height: 100px;text-align: center;vertical-align: middle">
            <?php
            echo $regmodel->organization->NAME_FULL;
            ?>
        </th>
        <th style="width: 50%;height: 100px;text-align: center;vertical-align: middle">
            <?php  $result = Builder::create()
                ->writer(new PngWriter())
                ->writerOptions([])
                ->data(Yii::$app->urlManager->createAbsoluteUrl(['/site/viewsert', 'id' => $sertificate->id]))
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
            echo "<img src='{$result->getDataUri()}'>";?>
        </th>
    </tr>
    </thead>

</table>
<div class="align-content-center" style="text-align: center">
    <b>TEKSHIRISH BAYONNOMASI № <?= $regmodel->code ?></b>
</div>
<br>
<div>
    Buyurtmachi nomi va manzili: <?php
    if ($regmodel->inn) {
        $legal = LegalEntities::findOne(['inn' => $regmodel->inn]);
        echo $legal->inn
            . " "
            . $legal->name
            . " "
            . Tshx::findOne(['id' => $legal->tshx_id])->name_uz
            . " "
            . Soato::Full($legal->soato_id);

    } else {
        $ind = Individuals::findOne(['pnfl' => $regmodel->pnfl]);
        echo $regmodel->pnfl . " " . $regmodel->inn . " "
            . $ind->surname . " "
            . $ind->name . " "
            . $ind->middlename . " "
            . Soato::Full($ind->soato_id);
    }
    ?>
</div>
<br>
<div>
    <?php
    $res = "";
    $d = $samples;
    $res .= $d->animal->type->{'name_' . $lg} . '<br>';
    $res .= Yii::t('lab', 'Holati:') . ' ' . $d->animal->cat->{'name_' . $lg} . '<br>';
    $res .= Yii::t('lab', 'Jinsi:') . ' ' . Yii::$app->params['gender'][$d->animal->gender] . '<br>';
    $d1 = new DateTime($d->animal->birthday);
    $d2 = new DateTime(date('Y-m-d'));
    $interval = $d1->diff($d2);
    $diff = $interval->m + ($interval->y * 12);
    $res .= Yii::t('lab', 'Tug\'ilgan sanasi:') . ' ' . $d->animal->birthday . '(' . $diff . ' oy)';
    ?>
    Tekshiruv obyekti: Namuna nomi: <?= $samples->sampleTypeIs->name_uz ?>,:<?= $res?>, Namuna kodi: <?= $samples->kod ?>
</div>
<br>
<div>
    Namuna olingan joy: <?= $sertificate->vetSite->name ?>, manzili: <?= Soato::Full($sertificate->vetSite->soato) ?>
</div>
<br>
<div>
    Tekshirish usuli bo'yicha NH: <?php $n=0; foreach ($docs as $item){$n++; echo '<br>'.$n.'.'.$item->{'name_'.$lg}.' ';} ?>
</div>
<br>
<div>
    Tekshirish o'tkazilgan shartoit: Tempratura:<?= $resultanimal->temprature?>, Namlik: <?= $resultanimal->humidity?>, Regantlar: <?= $resultanimal->reagent_series.' '.$resultanimal->reagent_name?>, Boshqa sharoitlar:<?= $resultanimal->conditions?>, Izoh:<?= $resultanimal->ads?>
</div>
<br>
<div style="text-align: center">
    <b>Tekshiruv natijalari:</b>
</div>
<br>
<table class="table table-bordered table-hover" style="text-align: center">
    <thead>
    <tr>
        <th rowspan="2" style="text-align: center;vertical-align: middle;">
            Parametr (talab) nomi
        </th>
        <th colspan="3">
            Parametr qiymatlari
        </th>

    </tr>
    <tr>
        <th>
            NH bo'yicha
        </th>
        <th>
            Haqiqatda
        </th>
        <th>Birlik</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Namuna raqami</td>
        <td colspan="3"><?= $samples->kod?></td>
    </tr>
    <?php foreach ($resultanimal->tests as $item): ?>
        <tr>
            <td><?= $item->template->name_uz?></td>
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
            <td><?= $item->template->unit->{'name_' . $lg} ?></td>
        </tr>
    <?php endforeach;?>
    </tbody>
</table>

<br>
<p>Tekshirish sanasi: <?= $route->updated ?></p>
<p>Qo'shimcha ma'lumot: <?= $resultanimal->ads ?></p>
<p>
    Tekshirish o'tkazdi: <?= $route->executor->name ?>
</p>
<p>
    Tasdiqladi: <?= $route->director->name ?>
</p>