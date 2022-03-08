<?php

use common\models\Sertificates;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\SertificatesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* @var $sert Sertificates */

$this->title = Yii::t('client', 'Hayvon kasalliklari tashhisi uchun ariza yuborish');
$this->params['breadcrumbs'][] = ['label' => 'Hayvon kasalliklari tashhisi ro\'yhati', 'url' => ['indextest']];
$this->params['breadcrumbs'][] = ['label' => $sert->owner_name, 'url' => ['view', 'id' => $sert->id]];

$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sertificates-index">

    <div class="row">
        <div class="col-md-12">
            <div class="card">

                </div>
                <div class="card-body">

                    <!--asosiy yoziladigan joy-->
                    <?php $form = \yii\widgets\ActiveForm::begin()?>





                    <?php \yii\widgets\ActiveForm::end()?>


                </div>
            </div>
        </div>
    </div>



</div>
