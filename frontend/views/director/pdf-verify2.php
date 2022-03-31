<?php

/* @var $regmodel common\models\SampleRegistration */
/* @var $model common\models\Samples */
/* @var $composite common\models\CompositeSamples */

/* @var $sertificate common\models\Sertificates */

use common\models\Employees;
use common\models\FoodRoute;
use common\models\Individuals;
use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\ResultFood;
use common\models\RouteSert;
use common\models\Soato;
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
$resultanimal = ResultFood::findOne(['sample_id' => $samples->id]);
$routesert = FoodRoute::findOne(['sample_id' => $samples->id])->registration_id;

$lg = 'uz';if(Yii::$app->language=='ru'){$lg='ru';}

//errdeb($routesert);
$docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_food_regulations', 'template_food_regulations.regulation_id = regulations.id')
    ->innerJoin('template_food', 'template_food_regulations.template_id = template_food.id')
    ->orderBy('template_food_regulations.regulation_id')
    ->where('template_food.id IN (SELECT result_food_tests.id from result_food_tests inner join template_food on result_food_tests.template_id=template_food.id where result_food_tests.result_id=' . $routesert . ')')->all();;

//errdeb($routesert);
$qr = function () use ($sertificate) {
    $result = Builder::create()
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
    return "<img src='{$result->getDataUri()}'>";
}
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
            <img src="<?= Yii::$app->homeUrl . "/tmp/img.png" ?>" alt="">
        </th>
    </tr>
    </thead>

</table>
<div class="align-content-center" style="text-align: center">
    <b>ТЕКШИРИШ БАЁННОМАСИ № <?= $regmodel->code ?></b>
</div>
<br>
<div>
    Буюртмачи номи ва манзили: <?php
    $ind = Individuals::findOne(['pnfl' => $regmodel->pnfl]);
    echo $regmodel->pnfl . " " . $regmodel->inn . " "
        . @$ind->surname . " "
        . @$ind->name . " "
        . @$ind->middlename . " "
        . @Soato::Full($ind->soato_id);

    ?>
</div>
<br>
<div>
    Текширув объекти: намуна номи:<?= @$samples->sampleTypeIs->name_uz ?>,кушимча маълумот:<?= $samples->coments ?>
    ,намуна
    коди: <?= $samples->samp_code ?>
</div>
<br>
<div>
    Намуна олинган жойи: <?= //$sertificate->vetSite->name
    // ,манзили: <?= @Soato::Full($sertificate->vetSite->soato)
    ''; ?>
</div>
<br>
<div>
    Текшириш усули буйича НХ: <?php foreach ($docs as $item){echo $item->{'name_'.$lg};}?>
</div>
<br>
<div>
    Текширувни утказиш шароити: (Натижани кайд этиш (07101) дан олинади: температура, намлик, регантлар, бошка шартлар,
    изох полялари)
</div>
<br>
<div style="text-align: center">
    <b>Текширув натижалари:</b>
</div>
<br>
<table class="table table-bordered table-hover" style="text-align: center">
    <thead>
    <tr>
        <th rowspan="2" style="text-align: center;vertical-align: middle;">
            Параметр (талаб) номи
        </th>
        <th colspan="2">
            Параметр кийматлари
        </th>
        <th rowspan="2" style="vertical-align: middle;">
            Талабга мослик
        </th>
    </tr>
    <tr>
        <th>
            НХ буйича
        </th>
        <th>
            Хакикатда
        </th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            Data
        </td>
        <td>
            Data
        </td>
        <td>
            Data
        </td>
        <td>
            Data
        </td>
    </tr>
    </tbody>
</table>