<?php


namespace backend\controllers;

use backend\models\Image;
use common\models\AnimalCategory;
use common\models\Animaltype;
use common\models\ReportAnimal;
use common\models\ReportAnimalImages;
use common\models\Soato;
use Yii;
use common\models\DistrictView;
use common\models\QfiView;
use common\models\RegionsView;
use common\models\VetSites;
use yii\filters\Cors;
use yii\rest\ActiveController;
use yii\web\Response;
use yii\web\UploadedFile;

class ReportController extends ActiveController
{
    public $modelClass = "common\models\ReportAnimal";

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
    public function actions()
    {
        $actions = parent::actions();

        // disable the "delete" and "create" actions
        unset($actions['delete'], $actions['create']);


        return $actions;
    }
    public function actionGetregion(){
        $model = RegionsView::find()->select(['region_id','name_lot','name_cyr','name_ru'])->all();
        return $model;
    }

    public function actionGetdistrict($id){
        $model = DistrictView::find()->where(['region_id'=>$id])->select(['district_id','name_lot','name_cyr','name_ru'])->all();
        return $model;
    }
    public function actionGetqfi($id,$regid){
        $model = QfiView::find()->where(['district_id'=>$id])->andWhere(['region_id'=>$regid])->select(['MHOBT_cod','name_lot','name_cyr','name_ru'])->all();
    }

    public function actionGetVet($id,$regid){
        $model = VetSites::find()->filterWhere(['like','soato','17'.$regid.$id])->all();
        return $model;
    }

    public function actionCreate(){
        $model = new ReportAnimal();
        if($model->load(Yii::$app->request->post(),'')){
            $model->report_status_id = 1;
            $soato = Soato::findOne($model->soato_id);
            $num = ReportAnimal::find()->filterWhere(['like','created',date('Y')])->andFilterWhere(['like','soato_id',$soato->region_id.$soato->district_id])->max('rep_id');
            $num++;
            $code = substr(date('Y'),2,2).'-'.$soato->region_id.$soato->district_id.'-'.$num;
            $model->rep_id = $num;
            $model->code = $code;
            $model->is_true = -1;
            $model->lat = "{$model->lat}";
            $model->long = "{$model->long}";

            if($model->save()){
//                if($model->image and is_array($model->image)){
                    foreach ($model->image as $item){
                        $im = new ReportAnimalImages();
                        $im->report_id = $model->id;
                        $im->image = $item;
                        $im->save();
                        $im = null;
                    }
//                }
                return 1;
            }
        }
        return -1;
    }



    public function actionGetcategory(){
        return AnimalCategory::find()->select(['id','name_uz','name_ru'])->all();
    }
    public function actionGettype(){
        return Animaltype::find()->select(['id','name_uz','name_ru'])->all();
    }

    public function actionSetimage(){
        $uploads = UploadedFile::getInstancesByName("image");

        // $uploads now contains 1 or more UploadedFile instances
        $savedfiles = [];
        $n=0;
        foreach ($uploads as $file){
            $n++;
            $path = microtime(true).$file->name;
                $file->saveAs(Yii::$app->basePath.'/../frontend/web/uploads/'.$path);
            $savedfiles[$n] = $path;
        }
        return $savedfiles;

    }



}