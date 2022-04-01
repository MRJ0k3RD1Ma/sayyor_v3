<?php

/* @var $regmodel common\models\SampleRegistration */
/* @var $model common\models\Samples */
/* @var $composite common\models\CompositeSamples */
/* @var $result common\models\ResultFood */
/* @var $samples \common\models\FoodSamples*/
/* @var $sertificate common\models\Sertificates */

use common\models\Employees;
use common\models\FoodRoute;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\ResultFood;
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
$resultanimal = ResultFood::findOne(['sample_id' => $samples->id]);
$route = FoodRoute::findOne(['sample_id' => $samples->id]);
$routesert = $route->registration_id;

$lg = 'uz';


?>

<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th style="width: 50%;height: 100px;text-align: center;vertical-align: middle">
            <?php
            echo $regmodel->organization->NAME_FULL;
            ?>
            <p style="font-size: 12px; font-weight: normal">STIR(INN): <?= $regmodel->organization->TIN?> Manzil: <?= Soato::Full($regmodel->organization->soato).' '. $regmodel->organization->ADDRESS ?> Telefon: <?= $regmodel->organization->TELEFON?></p>
        </th>
        <th style="width: 50%;height: 100px;text-align: center;vertical-align: middle">
            <?php
            $qr = Builder::create()
                ->writer(new PngWriter())
                ->writerOptions([])
                ->data(Yii::$app->urlManager->createAbsoluteUrl(['/site/viewsertfood', 'id' => $samples->id]))
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
            echo "<img src='{$qr->getDataUri()}'>";
            ?>
        </th>
    </tr>
    </thead>

</table>
<div class="align-content-center" style="text-align: center">
    <b>TEKSHIRUV BAYONNOMASI № <?= $resultanimal->code ?></b>
</div>
<br>
<div>
    <b>Buyurtmachi nomi va manzili:</b> <?php
    if ($regmodel->inn) {
        $legal = LegalEntities::findOne(['inn' => $regmodel->inn]);
        echo $legal->inn
            . " "
            . $legal->name
            . " "
            . Tshx::findOne(['id' => $legal->tshx_id])->name_uz
            . " "
            . Soato::Full($legal->soato_id);

    }else {
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
    <b>Tekshiruv obyekti: Namuna nomi:</b> <?= $samples->tasnif_code.'-'.$samples->tasnif->name?>; <b>Qo'shimcha ma'lumotlar:</b>
    <b>Ishlab chiqarilgan davlat:</b> <?= @$samples->country->name_uz ?>
    <b>Ishlab chiqaruvchi:</b> <?= $samples->producer?>
    <b>Seriya raqami:</b> <?= $samples->serial_num?>
    <b>Ishlab chiqarilgan sana:</b> <?= $samples->manufacture_date?>
    <b>Muddati:</b> <?= $samples->sell_by?>; <b>Namuna kodi:</b> <?= $samples->samp_code?>

</div>
<br>
<div>
    <b>Namuna olish joyi:</b> <?= $sertificate->samplingSite->name ?>, <b>manzili:</b> <?= Soato::Full($sertificate->samplingSite->soato) ?>
</div>
<br>
<div>
    <b>Tekshiruv maqsadi va vazifasi:</b> <?= @$sertificate->verificationPupose->name_uz?>
</div>
<br>
<div>
    <b>Tekshirish usuli bo'yicha NH:</b> <?php foreach ($docs as $item){echo $item->{'name_'.$lg};}?>
</div>

<br>
<div style="text-align: center">
    <b>TEKSHIRUV NATIJALARI</b>
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
        <th rowspan="2">
            Talabga mosligi
        </th>
    </tr>
    <tr>
        <th>Birlik</th>
        <th>
            NH bo'yicha
        </th>
        <th>
            Haqiqatda
        </th>

    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Namuna raqami</td>
        <td colspan="3"><?= $samples->samp_code?></td>
    </tr>
    <?php foreach ($resultanimal->tests as $item): ?>
        <tr>
            <td><?= $item->template->name_uz?></td>
            <td><?= $item->template->unit_uz ?></td>
            <?php if ($item->template->type_id == 1) { ?>
                <td><?= $item->template->min . '-' . $item->template->max ?></td>
            <?php } elseif ($item->template->type_id == 2) { ?>
                <td><?= Yii::$app->params['result'][$item->template->min] ?></td>
            <?php } elseif ($item->template->type_id == 3) { ?>
                <td><?= $item->template->min . '-' . $item->template->max . ' %' ?></td>
            <?php } elseif ($item->template->type_id == 4) { ?>
                <td><?= $item->template->min . '-' . $item->template->max ?>
                    <br> <?= $item->template->min_1 . '-' . $item->template->max_1 ?></td>
            <?php } ?>


            <?php if ($item->template->type_id == 1) { ?>
                <td><?= $item->result ?></td>
            <?php } elseif ($item->template->type_id == 2) { ?>
                <td><?= Yii::$app->params['result'][$item->result] ?></td>
            <?php } elseif ($item->template->unit->type_id == 3) { ?>
                <td><?= $item->template->min . '-' . $item->template->max ?></td>
            <?php } elseif ($item->template->type_id == 4) { ?>
                <td><?= $item->result.'-'.$item->result_2?></td>
            <?php } ?>


            <?php if ($item->template->type_id == 1) { ?>
                <td><?php if(((!$item->template->min) or intval($item->template->min) <= intval($item->result)) and (intval($item->result)<= intval($item->template->max) or (!$item->template->max))){echo 'Ha';}else{echo 'Yo\'q';} ?></td>
            <?php } elseif ($item->template->type_id == 2) { ?>
                <td>
                    <?php if($item->result==$item->template->min){?><?= Yii::$app->params['result'][1] ?><?php }else{?><?= Yii::$app->params['result'][0]?><?php }?>
                </td>
            <?php } elseif ($item->template->type_id == 3) { ?>
                <td><?= $item->result?></td>
            <?php } elseif ($item->template->type_id == 4) { ?>
                <td><?php
                    $one = true;
                    if (((!$item->template->min) or intval($item->template->min) <= intval($item->result))
                        and
                        (intval($item->result) <= intval($item->template->max) or (!$item->template->max))
                    ) {
                        $one = true;
                    } else {
                        $one = false;
                    }
                    $two = true;
                    if (((!$item->template->min_1) or intval($item->template->min_1) <= intval($item->result_2))
                        and
                        (intval($item->result_2) <= intval($item->template->max_1) or (!$item->template->max_1))
                    ) {
                        $two = true;
                    } else {
                        $two = false;
                    }

                    if($one and $two){echo "Ha";}else{echo "Yo'q";}


                    ?></td>
            <?php } ?>

        </tr>
    <?php endforeach;?>
    </tbody>
</table>

<br>
<p>Umumiy natija: <?= $resultanimal->ads ?></p>
<p>Tekshirish sanasi: <?= $route->updated ?></p>
<p>
    Tekshirish o'tkazdi: <?= $route->executor->name ?>
</p>
<p>
    Tasdiqladi: <?= $route->director->name ?>
</p>