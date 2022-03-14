<?php

namespace backend\controllers;

use common\models\RegionsView;
use Yii;

use yii\rest\Controller;

/**
 * Site controller
 */
class SiteController extends Controller
{

   public function actionGetregion(){
       $model = RegionsView::find()->select(['region_id','name_lot','name_ru','name_cyr'])->all();

       return $model;
   }
}
