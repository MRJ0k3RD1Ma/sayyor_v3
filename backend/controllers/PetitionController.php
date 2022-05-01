<?php


namespace backend\controllers;

use common\models\AnimalCategory;
use common\models\Animaltype;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\Organizations;
use common\models\SampleRegistration;
use common\models\Sertificates;
use Yii;
use common\models\DistrictView;
use common\models\QfiView;
use common\models\RegionsView;
use common\models\VetSites;
use yii\base\BaseObject;
use yii\filters\Cors;
use yii\rest\ActiveController;
use yii\web\Response;

class PetitionController extends ActiveController
{
    public $modelClass = "common\models\SampleRegistration";

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
        unset($actions['delete'], $actions['create'],$actions['index']);


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
        return $model;
    }

    public function actionGetVet($id,$regid){
        $model = VetSites::find()->filterWhere(['like','soato','17'.$regid.$id])->all();
        return $model;
    }

    public function actionGetcategory(){
        return AnimalCategory::find()->select(['id','name_uz','name_ru'])->all();
    }
    public function actionGettype(){
        return Animaltype::find()->select(['id','name_uz','name_ru'])->all();
    }

    public function actionGetorg(){
        return Organizations::find()->where(['type_id'=>1])->all();
    }

    public function actionCreate(){

        $model = new SampleRegistration();
        $model->is_registon = 1;
        if(Yii::$app->request->isPost){
            $transaction = Yii::$app->db->beginTransaction();
            $allok = true;
            try {

                $post = Yii::$app->request->post();
                $sert = new Sertificates();
                $sert->registon_id = $post['sert']['registon_id'];
                $sert->is_registon = 1;
                $sert->sert_date = $post['sert']['sert_date'];
                $sert->sampler_name = $post['sert']['sampler_name'];
                $sert->sampler_position = $post['sert']['sampler_position'];
                $sert->vet_site_id = $post['sert']['vet_site_id'];

                if($post['sert']['ownertype']==1){
                    if($ind = Individuals::findOne(['pnfl'=>$post['sert']['owner']['pnfl']])){
                        $sert->pnfl = $ind->pnfl;
                    }else{
                        $ind = new Individuals();
                        $ind->pnfl = $post['sert']['owner']['pnfl'];
                        $ind->name = $post['sert']['owner']['name'];
                        $ind->surname = $post['sert']['owner']['surname'];
                        $ind->middlename = $post['sert']['owner']['middlename'];
                        $ind->soato_id = $post['sert']['owner']['soato_id'];
                        $ind->adress = $post['sert']['owner']['adress'];
                        $ind->passport = $post['sert']['owner']['passport'];
                        $ind->save();
                        $sert->pnfl = $ind->pnfl;
                    }
                }else{
                    if($ind = LegalEntities::findOne(['inn'=>$post['sert']['owner']['inn']])){
                        $sert->inn = $ind->inn;
                    }else{
                        $ind = new LegalEntities();
                        $ind->inn = $post['sert']['owner']['inn'];
                        $ind->name = $post['sert']['owner']['name'];
                        $ind->tshx_id = $post['sert']['owner']['tshx_id'];
                        $ind->soogu = $post['sert']['owner']['adress'];
                        $ind->soato_id = $post['sert']['owner']['soato_id'];
                        $ind->status_id = 1;
                        $ind->save();
                        $sert->inn = $ind->inn;
                    }
                }

            $sert->save();

                $model->registon_id = $post['registon_id'];
                $model->organization_id = $post['organization_id'];
                $model->sender_name = $post['sender_name'];
                $model->sender_phone = $post['sender_phone'];
                $model->research_category_id = $post['research_category_id'];


                if($allok){
                    $transaction->commit();
                }
            }catch (\Exception $e){
                $transaction->rollBack();
            }


            return $allok;
        }

        return 0;
    }

}