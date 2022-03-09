<?php

namespace client\controllers;

use client\models\InnForm;
use client\models\search\SertificatesSearch;
use common\models\Animals;
use common\models\CompositeSamples;
use common\models\DistrictView;
use common\models\Emlash;
use common\models\FoodSamplingCertificate;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\ProductExpertise;
use common\models\QfiView;
use common\models\SampleRegistration;
use common\models\Samples;
use common\models\search\FoodSamplingCertificateSearch;
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

            $code = substr(date('Y'),2,2).'-1-'.get3num($org).'-';

            $num = $num+1;
            $code .= $num;
            $model->sert_id = "$num";
            $model->inn = $legal->inn;
            $model->sert_full = $code;
            $model->sert_num = "{$model->sert_num}";
            if($model->save()){
                Yii::$app->session->setFlash('success','Proba tekshiruvchi tashkilotga muvoffaqtiyatli yuborildi');
                return $this->redirect(['view','id'=>$model->id]);
            }else{
                Yii::$app->session->setFlash('error','Ma\'lumotlarni to\'ldirishda xatolik yuzaga keldi');
            }
        }

        return $this->render('animal',[
            'model'=>$model,
        ]);
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

    public function actionSend($id){
        $model = $this->findModel($id);
        if($model->status_id == 1){
            $model->status_id = 2;
            $model->save();
        }

        return $this->redirect(['view','id'=>$id]);
    }

    public function actionAdd($id){
        $model = $this->findModel($id);

        $animal = new Animals();
        $reg = new SampleRegistration();
        $sample = new Samples();

        $animal->inn = Yii::$app->session->get('doc_inn');
        $sample->animal_id = -1;
        $sample->sert_id = intval($id);

        $reg->inn = $animal->inn;
        $org = $model->organization_id;
        $reg->organization_id = $model->organization_id;
        $num = SampleRegistration::find()->where(['organization_id'=>$org])->andFilterWhere(['like','reg_date',date('Y')])->max('reg_id');

        $code = substr(date('Y'),2,2).'-1-'.get3num($org).'-';

        $num = $num+1;
        $code .= $num;
        $reg->reg_id = $num;
        $reg->code = $code;
        if(Yii::$app->request->isPost){

            if($animal->load(Yii::$app->request->post()) and $reg->load(Yii::$app->request->post())){
                $animal->inn = "{$animal->inn}";
                $sample->kod = $reg->code;
                if($animal->save() and $sample->load(Yii::$app->request->post())){
                    $sample->animal_id = $animal->id;
                    $sample->sert_id = intval($id);
                    if($sample->save(false)){
                        $com = new CompositeSamples();
                        $com->sample_id = $sample->id;
                        $com->status_id = 1;
                        $com->save();
                        $reg->composite_sample_id = $com->id;
                        $reg->save();
                        Yii::$app->session->setFlash('success',Yii::t('client','Namuna muvoffaqiyatli saqlandi'));
                        return $this->redirect(['view','id'=>$id]);
                    }
                }
            }

        }

        return $this->render('add',[
            'model'=>$model,
            'animal'=>$animal,
            'sample'=>$sample,
            'reg'=>$reg
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

    public function actionProduct(){
        $model = new FoodSamplingCertificate();
        $pro = new ProductExpertise();
        $model->inn = Yii::$app->session->get('doc_inn');
        if($model->load(Yii::$app->request->post())){

            $org = $model->organization_id;

            $num = FoodSamplingCertificate::find()->where(['organization_id'=>$org])->andFilterWhere(['like','food_id',date('Y')])->max('food_id');

            $code = substr(date('Y'),2,2).'-2-'.get3num($org).'-';

            $num = $num+1;
            $code .= $num;
            $model->kod = $code;
            $model->food_id = $num;
            $pro->orgaization_id = $model->organization_id;
            $pro->inn = $model->inn;
            $pro->vet_site_id = $model->sampling_site;
            if($model->save() and $pro->load(Yii::$app->request->post())){
                $pro->food_sampling_certificate = $model->id;
                $pro->save();
                return $this->redirect(['viewfood','id'=>$model->id]);
            }
        }
        return $this->render('product',['model'=>$model,'pro'=>$pro]);
    }

    public function actionViewfood($id){
        $model = FoodSamplingCertificate::findOne($id);
        return $this->render('viewfood',[
            'model'=>$model
        ]);
    }

    public function actionListfood(){
        $searchModel = new FoodSamplingCertificateSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('listfood', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

}
