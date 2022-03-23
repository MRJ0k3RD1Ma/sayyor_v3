<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\ReportAnimal */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Hayvon kasalliklari', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="report-animal-view">

    <?php
        $lang = Yii::$app->language;
        $lg = 'uz';
        if($lang == 'ru'){
            $lg = 'ru';
        }
    ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'id',
//            'type_id',
            'code',
            [
                'attribute'=>'type_id',
                'value'=>function($d){
                    $lang = Yii::$app->language;
                    $lg = 'uz';
                    if($lang == 'ru'){
                        $lg = 'ru';
                    }
                    return $d->type->{'name_'.$lg};
                }
            ],
            [
                'attribute'=>'cat_id',
                'value'=>function($d){
                    $lang = Yii::$app->language;
                    $lg = 'uz';
                    if($lang == 'ru'){
                        $lg = 'ru';
                    }
                    return $d->cat->{'name_'.$lg};
                }
            ],
//            'cat_id',
            [
                'attribute'=>'soato_id',
                'value'=>function($d){
                    $lang = Yii::$app->language;
                    $lg = 'uz';
                    if($lang == 'ru'){
                        $lg = 'ru';
                    }
                    return \common\models\Soato::Full($d->soato_id);
                }
            ],
//            'lat',
//            'long',
            'detail:ntext',
//            'operator_id',
            [
                'attribute'=>'operator_id',
                'value'=>function($d){
                    if($d->operator_id){
                        return $d->operator->name;
                    }else{
                        return null;
                    }
                }
            ],
//            'is_true',
            [
                'attribute'=>'is_true',
                'value'=>function($d){
                    $s = [0=>Yii::t('komitet','Yo\'q'),1=>Yii::t('komitet','Ha'),-1=>Yii::t('komitet','Tekshirilmagan')];
                    return $s[$d->is_true];
                }
            ],
            'report_status_id',
            'phone',
            'created',
            'updated',

//            'rep_id',
//            'lang',
            'organization_id',
        ],
    ]) ?>



    <div id="map"></div>

    <style>
        /* Set the size of the div element that contains the map */
        #map {
            height: 400px;
            /* The height is 400 pixels */
            width: 100%;
            /* The width is the width of the web page */
        }
    </style>
    <div id="map"></div>
    <script>

        // Attach your callback function to the `window` object
        // Initialize and add the map
        function initMap() {
            // The location of Uluru
            const uluru = { lat: <?= $model->lat?>, lng: <?= $model->long?> };
            // The map, centered at Uluru
            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 10,
                center: uluru,
            });
            // The marker, positioned at Uluru
            const marker = new google.maps.Marker({
                position: uluru,
                map: map,
            });
        }

    </script>
    <script async
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAKc6n_ShV0w0BIcrtYymLAwK4UB1g0g4&callback=initMap">
    </script>



</div>