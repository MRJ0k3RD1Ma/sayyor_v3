<?php

namespace client\controllers;

use client\models\InnForm;
use client\models\search\SampleRegistrationSearch;
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
use common\models\VetSites;
use frontend\models\ResendVerificationEmailForm;
use frontend\models\VerifyEmailForm;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
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
        $model->ownertype = 1;
        $owner_leg = new LegalEntities();
        $owner_ind = new Individuals();
        $model->status_id = 0;
        if($model->load(Yii::$app->request->post())){

            $num = Sertificates::find()->filterWhere(['like','sert_date',date('Y')])->max('sert_id');
            $vet = VetSites::findOne($model->vet_site_id);
            $code = $vet->soato0->region_id.$vet->soato0->district_id.'-'.   substr(date('Y'),2,2).'-';

            $num = $num+1;
            $code .= $num;
            $model->sert_id = "$num";
            $model->inn = $legal->inn;
            $model->sert_full = $code;
            $model->sert_num = "{$model->sert_num}";

            if($model->ownertype == 1){
                if($owner_ind->load(Yii::$app->request->post())){
                    if($own = Individuals::findOne(['pnfl'=>$owner_ind->pnfl])){
                        $owner_ind = $own;
                    }else{
                        $owner_ind->save();
                    }
                    $model->owner_pnfl = $owner_ind->pnfl;
                }else{
                    Yii::$app->session->setFlash('error',Yii::t('client','Ma\'lumotlarni to\'ldirishda xatolik'));
                }
            }elseif($model->ownertype == 2){
                if($owner_leg->load(Yii::$app->request->post())){
                    if($own = LegalEntities::findOne(['inn'=>$owner_leg->inn])){
                        $owner_leg = $own;
                    }else{
                        $owner_leg->save();
                    }
                    $model->owner_inn = $owner_leg->inn;
                }else{
                    Yii::$app->session->setFlash('error',Yii::t('client','Ma\'lumotlarni to\'ldirishda xatolik'));
                }
            }else{
                Yii::$app->session->setFlash('error',Yii::t('client','Ma\'lumotlarni to\'ldirishda xatolik'));
                return $this->render('animal',[
                    'model'=>$model,
                    'legal'=>$owner_leg,
                    'ind'=>$owner_ind
                ]);
            }


            if($model->save()){
                Yii::$app->session->setFlash('success','Proba tekshiruvchi tashkilotga muvoffaqtiyatli yuborildi');
                return $this->redirect(['view','id'=>$model->id]);
            }else{
                Yii::$app->session->setFlash('error','Ma\'lumotlarni to\'ldirishda xatolik yuzaga keldi');
            }
        }

        return $this->render('animal',[
            'model'=>$model,
            'legal'=>$owner_leg,
            'ind'=>$owner_ind
        ]);
    }

    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }



    public function actionSend($id){
        $model = Sertificates::findOne($id);
        $sample = Samples::find()->where(['samples.sert_id'=>$id])->andWhere(['not in','samples.id','select cs.sample_id from composite_samples cs where samples.id=cs.sample_id'])->all();
        $reg = new SampleRegistration();
        $reg->inn = Yii::$app->session->get('doc_inn');
        if($reg->load(Yii::$app->request->post())){

            $num = SampleRegistration::find()->filterWhere(['like','reg_date',date('Y')])->max('code_id');

            $code = substr(date('Y'),2,2).'-1-'.get3num($reg->organization_id).'-';
            $reg->status_id = 1;
            $num = $num+1;
            $code .= $num;
            $reg->code = $code;
            $reg->code_id = $num;

            if(is_array($reg->composite) and count($reg->composite)>0){
                if($reg->save()){
                    foreach ($reg->composite as $item){
                        $com = new CompositeSamples();
                        $com->status_id = 1;
                        $com->sample_id  = $item;
                        $com->registration_id  = $reg->id;
                        $com->save();
                        $sam = Samples::findOne($com->sample_id);
                        $sam->status_id = 1;
                        $sam->save();
                        $sam = null;
                        $com = null;

                    }
                }
                $model->status_id = 1;
                $model->save();
                return $this->redirect(['view','id'=>$model->id]);
            }else{
                Yii::$app->session->setFlash('error',Yii::t('client','Namuna tanlanmagan'));
            }

        }
        return $this->render('send',[
            'sample'=>$sample,
            'model'=>$model,
            'reg'=>$reg
        ]);
    }

    public function actionAdd($id){

        $model = $this->findModel($id);

        $animal = new Animals();
        $sample = new Samples();

        $animal->inn = Yii::$app->session->get('doc_inn');
        $sample->animal_id = -1;

        $sample->sert_id = intval($id);

        if(Yii::$app->request->isPost){

            if($animal->load(Yii::$app->request->post())){
                $num = Samples::find()->filterWhere(['like','kod',$model->sert_full])->max('samp_id');

                $code = $model->sert_full;

                $num = $num+1;
                $code .= $num;
                $sample->kod = $code.'/'.$num;
                $sample->samp_id = $num;
                $animal->inn = "{$animal->inn}";

                if($animal->save() and $sample->load(Yii::$app->request->post())){
                    $sample->animal_id = $animal->id;
                    $sample->sert_id = intval($id);
                    if($sample->save(false)){
                        Yii::$app->session->setFlash('success',Yii::t('client','Namuna muvoffaqiyatli saqlandi'));
                        return $this->redirect(['view','id'=>$id]);
                    }else{
                        Yii::$app->session->setFlash('error','Maydonlar to\'ldirimlagan');
                    }
                }
            }

        }

        return $this->render('add',[
            'model'=>$model,
            'animal'=>$animal,
            'sample'=>$sample,
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
    public function actionSertapp(){
        $searchModel = new SampleRegistrationSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        return $this->render('regtest', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    public function actionSertappview($id){
        $model = SampleRegistration::findOne($id);
        $samples = Samples::find()->select(['samples.*'])
            ->innerJoin('composite_samples','composite_samples.sample_id = samples.id')
            ->where(['composite_samples.registration_id'=>$id])->all();

        return $this->render('sertappview',[
            'model'=>$model,
            'samples'=>$samples
        ]);
    }
}
