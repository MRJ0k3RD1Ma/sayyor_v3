<?php

namespace client\controllers;

use client\models\InnForm;
use client\models\search\SertificatesSearch;
use common\models\Animals;
use common\models\DistrictView;
use common\models\Emlash;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\QfiView;
use common\models\Samples;
use common\models\Sertificates;
use common\models\Vaccination;
use frontend\models\ResendVerificationEmailForm;
use frontend\models\VerifyEmailForm;
use Yii;
use yii\base\BaseObject;
use yii\base\InvalidArgumentException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use yii\web\NotFoundHttpException;

/**
 * Site controller
 */
class LegalController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }
    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function beforeAction($action)
    {

        if(Yii::$app->session->has('doc_type')){
            if(!Yii::$app->session->has('doc_'.Yii::$app->session->get('doc_type'))){
                header('Location: /client/site/login');
                exit;
            }
        }else{
            header('Location: /client/site/login');
            exit;
        }

        return parent::beforeAction($action); // TODO: Change the autogenerated stub
    }


    public function actionListanimal(){

        $searchModel = new SertificatesSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('indextest', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);

    }

    public function actionSend($id){

    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionCreate($type = null){
        if($type){
            return $this->redirect(['/legal/'.$type]);
        }
        return $this->render('create');
    }

    public function actionAnimal(){
        $model = new Sertificates();
        $legal = LegalEntities::findOne(['inn'=>Yii::$app->session->get('doc_inn')]);
        $model->sert_date = date('Y-m-d');
        if($model->load(Yii::$app->request->post())){
           $org = $model->organization_id;

            $num = Sertificates::find()->where(['organization_id'=>$org])->andFilterWhere(['like','sert_date',date('Y')])->max('sert_id');

            $num = $num+1;

            $model->sert_id = "$num";
            $model->inn = $legal->inn;
            $model->sert_num = "{$model->sert_num}";
            if($model->save()){
                return $this->redirect(['view','id'=>$model->id]);
            }else{
                Yii::$app->session->setFlash('error','Ma\'lumotlarni to\'ldirishda xatolik yuzaga keldi');
            }
        }

        return $this->render('animal',['model'=>$model]);
    }

    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    public function actionGetbirka($id){
        if($model = Animals::findOne(['bsual_tag'=>$id])){
            return json_encode([
                'code'=>['result'=>'2200'],
                'data'=>[
                    'id'=>$model->id,
                    'birth'=>$model->birthday,
                    'tin'=>$model->inn,
                    'type'=>$model->type_id,
                    'sex'=>$model->gender,
                    'address'=>$model->adress,
                    'owner'=>$model->name,
                ]
            ]);
        }else{
            return get_web_page(Yii::$app->params['hamsa']['url']['getanimalinfo'].'?birka='.$id,'hamsa');
        }
    }


    public function actionAdd($id){
        $model = $this->findModel($id);

        $animal = new Animals();

        $sample = new Samples();
        $animal->pnfl = $model->pnfl;
        $animal->inn = $model->organization->TIN;
        $sample->animal_id = -1;
        $sample->sert_id = intval($id);
        if(Yii::$app->request->isPost){

            if($animal->load(Yii::$app->request->post())){
                $animal->inn = "{$animal->inn}";
                if($animal->save()){}
                if($sample->load(Yii::$app->request->post())){
                    $sample->animal_id = $animal->id;
                    $sample->sert_id = intval($id);
                    if($sample->save(false)){
                        return $this->redirect(['view','id'=>$id]);
                    }
                }
            }
            /*echo "<pre>";
//            var_dump($animal);
            echo "________________<br><br><hr>";
            var_dump($sample);
            exit;*/
        }

        return $this->render('add',[
            'model'=>$model,
            'animal'=>$animal,
            'sample'=>$sample
        ]);
    }
    protected function findModel($id)
    {
        if (($model = Sertificates::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('cp.sertificates', 'The requested page does not exist.'));
    }
    public function actionVaccination($id,$sert_id){

        $model = new Vaccination();
        $model->animal_id = $id;
        $animal = Animals::findOne($id);
        if($model->load(Yii::$app->request->post()) and $model->save()){
            return $this->redirect(['view','id'=>$sert_id]);
        }
        return $this->render('vaccination',['model'=>$model,'animal'=>$animal]);
    }

    public function actionEmlash($id,$sert_id){

        $model = new Emlash();
        $model->animal_id = $id;
        $animal = Animals::findOne($id);
        if($model->load(Yii::$app->request->post()) and $model->save()){
            return $this->redirect(['view','id'=>$sert_id]);
        }
        return $this->render('emlash',['model'=>$model,'animal'=>$animal]);

    }


    public function actionGetDistrict($id){
        $model = DistrictView::find()->where(['region_id'=>$id])->all();
        $text = Yii::t('cp.vetsites','- Tumanni tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item){
            if($lang == 'ru'){
                $name = $item->name_ru;
            }elseif($lang == 'oz'){
                $name = $item->name_cyr;
            }else{
                $name = $item->name_lot;
            }
            $res .= "<option value='{$item->district_id}'>{$name}</option>";
        }
        echo $res;
        exit;
    }
    public function actionGetQfi($id,$regid){
        $model = QfiView::find()->where(['district_id'=>$id])->andWhere(['region_id'=>$regid])->all();
        $text = Yii::t('cp.vetsites','- QFYni tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item){
            if($lang == 'ru'){
                $name = $item->name_ru;
            }elseif($lang == 'oz'){
                $name = $item->name_cyr;
            }else{
                $name = $item->name_lot;
            }
            $res .= "<option value='{$item->MHOBT_cod}'>{$name}</option>";
        }
        echo $res;
        exit;
    }
}
