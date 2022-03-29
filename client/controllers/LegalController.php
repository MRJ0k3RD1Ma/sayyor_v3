<?php

namespace client\controllers;

use client\models\search\FoodRegistrationSearch;
use client\models\search\SampleRegistrationSearch;
use client\models\search\SertificatesSearch;
use common\models\Animals;
use common\models\CompositeSamples;
use common\models\Emlash;
use common\models\FoodCompose;
use common\models\FoodRegistration;
use common\models\FoodSamples;
use common\models\FoodSamplingCertificate;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\SampleRegistration;
use common\models\Samples;
use common\models\search\FoodSamplingCertificateSearch;
use common\models\Sertificates;
use common\models\Vaccination;
use common\models\VetSites;
use kartik\mpdf\Pdf;
use Mpdf\MpdfException;
use setasign\Fpdi\PdfParser\CrossReference\CrossReferenceException;
use setasign\Fpdi\PdfParser\PdfParserException;
use setasign\Fpdi\PdfParser\Type\PdfTypeException;
use Yii;
use yii\base\BaseObject;
use yii\base\InvalidConfigException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
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
            if(!Yii::$app->session->has('doc_inn')){
                header('Location: /client/site/login');
                exit;
            }
        }else{
            header('Location: /client/site/login');
            exit;
        }

        return parent::beforeAction($action); // TODO: Change the autogenerated stub
    }


    public function actionListanimal($export = null){

        $searchModel = new SertificatesSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfindextest', ['dataProvider' => $dataProvider]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => $searchModel::tableName(),
                    'SetHeader' => [$searchModel::tableName() . '|| ' . date("r")],
                    'SetFooter' => ['| {PAGENO} |'],
                    'SetAuthor' => '@QalandarDev',
                    'SetCreator' => '@QalandarDev',
                ]
            ]);
            try {
                return $pdf->render();
            } catch (MpdfException|CrossReferenceException|PdfTypeException|PdfParserException|InvalidConfigException $e) {
                return $e;
            }
        }
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
                Yii::$app->session->setFlash('success','Dalolatnoma muvoffaqiyatli saqlandi');
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
        $sample = Samples::find()->where(['samples.sert_id'=>$id])->all();
        if(count($sample) == 0){
            Yii::$app->session->setFlash('error',Yii::t('client','Dalolatnomaga namuna biriktirilmagan'));
            return $this->redirect(['viewfood','id'=>$id]);
        }
        $reg = new SampleRegistration();
        $reg->inn = Yii::$app->session->get('doc_inn');
        if($reg->load(Yii::$app->request->post())){

            $num = SampleRegistration::find()->filterWhere(['like','created',date('Y')])->max('code_id');

            $code = substr(date('Y'),2,2).'-1-'.get3num($reg->organization_id).'-';
            $reg->status_id = 1;
            $num = $num+1;
            $code .= $num;
            $reg->code = $code;
            $reg->code_id = $num;


            if($reg->save()){
                foreach ($sample as $item){
                    $com = new CompositeSamples();
                    $com->status_id = 1;
                    $com->sample_id  = $item->id;
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
            Yii::$app->session->setFlash('success','Ariza muvoffaqiyatli yuborildi');
            return $this->redirect(['view','id'=>$model->id]);


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

                $sample->kod = $code.'/'.$num;
                $sample->samp_id = $num;
                $animal->inn = "{$animal->inn}";

                if($animal->save() and $sample->load(Yii::$app->request->post())){
                    $sample->animal_id = $animal->id;
                    $sample->sert_id = intval($id);
                    if($sample->save(false)){
                        Yii::$app->session->setFlash('success',Yii::t('client','{kod} raqamli namuna muvoffaqiyatli saqlandi',['kod'=>$sample->kod]));
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


    public function actionListfood($export=null){
        $searchModel = new FoodSamplingCertificateSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdflistfood', ['dataProvider' => $dataProvider]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => $searchModel::tableName(),
                    'SetHeader' => [$searchModel::tableName() . '|| ' . date("r")],
                    'SetFooter' => ['| {PAGENO} |'],
                    'SetAuthor' => '@QalandarDev',
                    'SetCreator' => '@QalandarDev',
                ]
            ]);
            try {
                return $pdf->render();
            } catch (MpdfException|CrossReferenceException|PdfTypeException|PdfParserException|InvalidConfigException $e) {
                return $e;
            }
        }
        return $this->render('listfood', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionSertapp(int $export = null){
        $searchModel = new SampleRegistrationSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfregtest', ['dataProvider' => $dataProvider]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => $searchModel::tableName(),
                    'SetHeader' => [$searchModel::tableName() . '|| ' . date("r")],
                    'SetFooter' => ['| {PAGENO} |'],
                    'SetAuthor' => '@QalandarDev',
                    'SetCreator' => '@QalandarDev',
                ]
            ]);
            try {
                return $pdf->render();
            } catch (MpdfException|CrossReferenceException|PdfTypeException|PdfParserException|InvalidConfigException $e) {
                return $e;
            }
        }
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

    public function actionProduct(){
        $model = new FoodSamplingCertificate();
        $model->inn = Yii::$app->session->get('doc_inn');
        $ind = new Individuals();
        $legal = new LegalEntities();
        $model->ownertype = 1;
        $model->status_id = 0;
        $model->state_id = 1;
        if($model->load(Yii::$app->request->post())){
            $vet = VetSites::findOne($model->sampling_site);
            $soato = $vet->soato0->region_id.$vet->soato0->district_id;
            $soato_full = $vet->soato0->res_id.$soato;
            $model->sampling_soato = $soato_full;
            $num = FoodSamplingCertificate::find()->where(['sampling_soato'=>$model->sampling_soato])->andFilterWhere(['like','created',date('Y')])->max('food_id');
            $code = $soato.'-'.substr(date('Y'),2,2).'-';

            $num = $num+1;
            $code .= $num;
            $model->code = $code;
            $model->food_id = $num;
            if($model->ownertype == 1){
                if($ind->load(Yii::$app->request->post())){
                    if($own = Individuals::findOne(['pnfl'=>$ind->pnfl])){
                        $ind = $own;
                    }else{
                        $ind->save();
                    }
                    $model->sampler_person_pnfl = $ind->pnfl;
                }else{
                    Yii::$app->session->setFlash('error',Yii::t('client','Ma\'lumotlarni to\'ldirishda xatolik'));
                }
            }elseif($model->ownertype == 2){
                if($legal->load(Yii::$app->request->post())){
                    if($own = LegalEntities::findOne(['inn'=>$legal->inn])){
                        $legal = $own;
                    }else{
                        $legal->save();
                    }
                    $model->sampler_person_inn = $legal->inn;
                }else{
                    Yii::$app->session->setFlash('error',Yii::t('client','Ma\'lumotlarni to\'ldirishda xatolik'));
                }
            }else{
                Yii::$app->session->setFlash('error',Yii::t('client','Ma\'lumotlarni to\'ldirishda xatolik'));
                return $this->render('product',[
                    'model'=>$model,
                    'legal'=>$legal,
                    'ind'=>$ind
                ]);
            }

            if($model->save()){
                Yii::$app->session->setFlash('success','{code} raqamli dalolatnoma Muvoffaqiyatli yaratildi',['code'=>$model->code]);
                return $this->redirect(['viewfood','id'=>$model->id]);
            }
        }
        return $this->render('product',[
            'model'=>$model,
            'legal'=>$legal,
            'ind'=>$ind
            ]);
    }

    public function actionViewfood($id){
        $model = FoodSamplingCertificate::findOne($id);
        $samp = $model->foodSamples;
        return $this->render('viewfood',[
            'model'=>$model,
            'samp'=>$samp
        ]);
    }

    public function actionAddfood($id){
        $model = new FoodSamples();
        $food = FoodSamplingCertificate::findOne($id);
        $model->sert_id = $food->id;
        if($model->load(Yii::$app->request->post())){
            $num = FoodSamples::find()->where(['sert_id'=>$model->sert_id])->max('samp_id');
            $num = intval($num) + 1;
            $model->samp_code = $food->code.'/'.$num;
            $model->samp_id = $num;
            $model->status_id = 0;
            if($model->save()){
                Yii::$app->session->setFlash('success','Namuna muvoffaqiyatli saqlandi');
                return $this->redirect(['viewfood','id'=>$id]);
            }else{
                Yii::$app->session->setFlash('error','Maydonlar to\'ldirilmagan');
            }
        }

        return $this->render('addfood',[
            'model'=>$model,
            'food'=>$food
        ]);
    }




    public function actionSendfood($id){
        $model = FoodSamplingCertificate::findOne($id);
        $sample = FoodSamples::find()->where(['sert_id'=>$id])->all();
        if(count($sample) == 0){
            Yii::$app->session->setFlash('error',Yii::t('client','Dalolatnomaga namuna biriktirilmagan'));
            return $this->redirect(['viewfood','id'=>$id]);
        }
        $reg = new FoodRegistration();
        $reg->inn = Yii::$app->session->get('doc_inn');
        $reg->reg_date = date('Y-m-d');
        if($reg->load(Yii::$app->request->post())){

            $num = FoodRegistration::find()->filterWhere(['like','created',date('Y')])->max('code_id');

            $code = substr(date('Y'),2,2).'-2-'.get3num($reg->organization_id).'-';
            $reg->status_id = 1;
            $num = $num+1;
            $code .= $num;
            $reg->code = $code;
            $reg->code_id = $num;

            if($reg->save()){
                foreach ($sample as $item){
                    $com = new FoodCompose();
                    $com->status_id = 1;
                    $com->sample_id  = $item->id;
                    $com->registration_id  = $reg->id;
                    $com->save();
                    $sam = FoodSamples::findOne($com->sample_id);
                    $sam->status_id = 1;

                    $sam->save();
                    $sam = null;
                    $com = null;

                }
            }
            $model->status_id = 1;
            $model->send_sample_date = date('Y-m-d');
            if($model->save()){
                Yii::$app->session->setFlash('success',Yii::t('client','Ariza muvoffaqiyatli yuborildi'));
            }

            return $this->redirect(['viewfood','id'=>$model->id]);
        }
        return $this->render('sendfood',[
            'sample'=>$sample,
            'model'=>$model,
            'reg'=>$reg
        ]);
    }

    public function actionSertfood($export = null){
        $searchModel = new FoodRegistrationSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfsertfood', ['dataProvider' => $dataProvider]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => $searchModel::tableName(),
                    'SetHeader' => [$searchModel::tableName() . '|| ' . date("r")],
                    'SetFooter' => ['| {PAGENO} |'],
                    'SetAuthor' => '@QalandarDev',
                    'SetCreator' => '@QalandarDev',
                ]
            ]);
            try {
                return $pdf->render();
            } catch (MpdfException|CrossReferenceException|PdfTypeException|PdfParserException|InvalidConfigException $e) {
                return $e;
            }
        }
        return $this->render('sertfood', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionSertfoodview($id){
        $model = FoodRegistration::findOne($id);
        $samples = FoodSamples::find()->select(['food_samples.*'])
            ->innerJoin('food_compose','food_compose.sample_id = food_samples.id')
            ->where(['food_compose.registration_id'=>$id])->all();
        return $this->render('sertfoodview',[
            'model'=>$model,
            'samp'=>$samples
        ]);
    }
}
