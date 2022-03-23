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



    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'type_id',
            'cat_id',
            'soato_id',
            'lat',
            'long',
            'detail:ntext',
            'operator_id',
            'is_true',
            'report_status_id',
            'phone',
            'created',
            'updated',
            'code',
            'rep_id',
            'lang',
            'organization_id',
        ],
    ]) ?>

    <div id="map"></div>
    <script async
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeP6BCtySElOLb7G3_Dc6ngi4mssnbSaU&callback=initMap">
    </script>
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
                zoom: 4,
                center: uluru,
            });
            // The marker, positioned at Uluru
            const marker = new google.maps.Marker({
                position: uluru,
                map: map,
            });
        }


        // Append the 'script' element to 'head'
        document.head.appendChild(script);

    </script>


</div>