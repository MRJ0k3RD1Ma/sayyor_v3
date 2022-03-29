<?php


/*@var DestructionSampleAnimal $model*/
?>
<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th style="width: 50%;height: 100px;text-align: center;vertical-align: middle">
            <?php

            use common\models\DestructionSampleAnimal;

            echo "OK";// $model->organization->NAME_FULL;
            ?>
        </th>
        <th style="width: 50%;height: 100px;text-align: center;vertical-align: middle">
            <img src="<?=   "http://sayyor.loc/img.png" ?>" alt="">
        </th>
    </tr>
    </thead>

</table>
<div class="align-content-center" style="text-align: center">
    <b>Yo'q qilish bayonnomasi № <?= $model->code ?></b>
</div>
<br>
<div>
    <?php
    $about =function($d){
        $samp = $d->sample;
        $res = "";
        $lg = 'uz'; if(Yii::$app->language=='ru')$lg='ru';
        $res .= Yii::t('model','Namuna nomi').': '.$samp->tasnif->{'name'}.'<br>';
        $res .= Yii::t('model','Soni').': '.$samp->count;

        return $res;
    };
    ?>
    Hayvon haqida ma'lumot <?= $about($model) ?>
</div>
<br>
<div>
    Текширув объекти: намуна номи:<?= @$model->sample->sampleTypeIs->name_uz ?>,кушимча маълумот:<?= $model->sample->coments ?>
    ,намуна
    коди: <?= $model->sample->samp_code ?>
</div>
<br>
<div>
    Tasdiqladi: <?= $model->consent->name ?>
</div>
<br>
<div>
    Namuna yo'q qilingan sana: <?= $model->destruction_date ?>
</div>
<br>
<div>
    Laborant : <?= $model->creator->name ?>
</div>
<br>
<div>
    Текшириш усули буйича НХ: (танланган шаблон буйича 07102 да танланган шаблонда келтирилган «норматив хужжат» поляси,
    бир нечта булиши мумкин, факат такрорланмасин)
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