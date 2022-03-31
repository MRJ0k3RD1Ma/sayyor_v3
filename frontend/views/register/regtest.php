<?php

use common\models\Sertificates;
use yii\helpers\Html;
use yii\grid\GridView;

use yii\helpers\Url;
use yii\grid\ActionColumn;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\SertificatesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('cp.sertificates', 'Dalolatnomalar');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sertificates-index">

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header flex">
                    <div></div>
                    <div class="btns flex">
                        <div class="search">

                            <input type="search">
                            <button class="btn"><span class="fa fa-search"></span></button>

                        </div>
                        <div class="export">
                            <button class="btn btn-primary"><span class="fa fa-cloud-download-alt"></span> Export
                            </button>
                            <div class="export-btn">
                                <button class=""><span class="fa fa-file-excel"></span> Excel</button>
                                <button class=""><span class="fa fa-file-pdf"></span> PDF</button>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="card-body">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
//                        'filterModel' => $searchModel,
                        'columns' => [
                            ['class' => 'yii\grid\SerialColumn'],

//                            'id',
//                            'code',
                            [
                                'attribute' => 'code',
                                'value' => function ($d) {
                                    $url = Yii::$app->urlManager->createUrl(['/register/regview', 'id' => $d->id]);
                                    return "<a href='{$url}'>{$d->code}</a>";
                                },
                                'filter' => false,
                                'format' => 'raw'
                            ],
                            [
                                'label' => Yii::t('register', 'Yuboruvchi'),
                                'value' => function ($d) {
                                    if ($d->inn) {
                                        return $d->inn . '<br>' . $d->inn0->name;
                                    } elseif ($d->pnfl) {
                                        return $d->pnfl . '<br>' . $d->pnfl0->name . ' ' . $d->pnfl0->surname . ' ' . $d->pnfl0->middlename;
                                    } else {
                                        return null;
                                    }
                                },
                                'format' => 'raw'
                            ],
//                            'is_research',
                            [
                                'attribute' => 'is_research',
                                'value' => function ($d) {
                                    $s = [0 => 'Shoshilinch emas', 1 => 'Shohilinch'];
                                    return $s[$d->is_research];
                                }
                            ],
//                            'code_id',
                            //'code',
                            //'research_category_id',
                            [
                                'attribute' => 'research_category_id',
                                'value' => function ($d) {
                                    return $d->researchCategory->name_uz;
                                }
                            ],
                            //'results_conformity_id',
                            //'organization_id',
                            //'emp_id',
//                            'reg_date',
                            //'reg_id',
                            'sender_name',
                            'sender_phone',
                            'created',
                            [
                                'attribute' => 'status_id',
                                'format' => 'html',
                                'value' => function ($d) {
                                    $lg = 'uz';
                                    if (Yii::$app->language == 'ru') $lg = 'ru';
                                    return "<span class='" . $d->status->class . "'>" . @$d->status->icon . ' ' . $d->status->{'name_' . $lg} . "</span>";
                                    return $d->status->{'name_' . $lg};
                                }
                            ],
                            //'updated',
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
    </div>


</div>
