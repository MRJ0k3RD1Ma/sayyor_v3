<?php

namespace backend\controllers;

use common\models\RegionsView;
use Yii;

use yii\filters\Cors;
use yii\rest\ActiveController;
use yii\web\Response;


class PlaceController extends ActiveController
{
    public $modelClass = '\common\models\ReportAnimal';
    public function behaviors()
    {
        $behaviors = parent::behaviors();

        $behaviors['corsFilter'] =[
            'class'=>Cors::className()
        ];

        $behaviors['formats'] = [
            'class'=>'yii\filters\ContentNegotiator',
            'formats'=>[
                'application/json'=>Response::FORMAT_JSON
            ]
        ];

        return $behaviors;
    }

   public function actionGetregion(){

       $model = RegionsView::find()->select(['region_id','name_lot','name_ru','name_cyr'])->all();

       return $model;
   }
}
