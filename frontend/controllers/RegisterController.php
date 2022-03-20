<?php

namespace frontend\controllers;

use app\models\RouteSert;
use common\models\Animals;
use common\models\CompositeSamples;
use common\models\DistrictView;
use common\models\Emlash;
use common\models\FoodSamplingCertificate;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\QfiView;
use common\models\SampleRegistration;
use common\models\Samples;
use frontend\models\search\lab\FoodSamplingCertificateSearch;
use common\models\Sertificates;
use common\models\Vaccination;
use common\models\VetSites;
use frontend\models\search\lab\SertificatesRegSearch;
use frontend\models\search\lab\SertificatesSearch;
use frontend\models\search\SampleRegistrationSearch;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
use yii\base\BaseObject;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use Yii;
use yii\web\NotFoundHttpException;

/**
 * Site controller
 */
class RegisterController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
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

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {

        return $this->render('index');
    }

    public function actionCreatetest(){
        $user = Yii::$app->user->identity;
        $org = $user->empPosts->org_id;
        $user_id = Yii::$app->user->getId();
        $code = substr(date('Y'),2,2).'-1-'.get3num($org).'-';
        $num = Sertificates::find()->where(['organization_id'=>$org])->andFilterWhere(['like','created',date('Y')])->max('sert_num');
        $num++;
        $code .= $num;
        $model = new Sertificates();
        $model->sert_id = $num;
        $model->sert_full = $code;
        $legal = new LegalEntities();
        $ind = new Individuals();
        $model->ownertype = 1;
        $model->organization_id = $org;
        $model->operator = $user_id;
        if($model->load(Yii::$app->request->post())){
            if($model->ownertype == 1){

                if($ind->load(Yii::$app->request->post())){

                    if($ind->pnfl and $ind->name and $ind->surname and $ind->middlename and $ind->soato_id){
                        if($withpnfl = Individuals::findOne(['pnfl'=>$ind->pnfl])){
                            $ind = $withpnfl;
                        }else{
                            $ind->save();
                        }

                        $model->pnfl = $ind->pnfl;
                        $model->save();
                        Yii::$app->session->setFlash('success','Ma\'lumotlar bazaga muvoffaqiyatli yozildi');
                        return $this->redirect(['viewtest','id'=>$model->id]);
                    }else{
                        Yii::$app->session->setFlash('error', Yii::t('reg', 'Maydonlar to\'ldirilmagan'));
                    }
                }
            }elseif($model->ownertype == 2){
                if($legal->load(Yii::$app->request->post())) {

                    if ($legal->inn and $legal->name and $legal->soato_id and $legal->soogu) {
                        if ($l = LegalEntities::findOne(['inn' => $model->inn])) {
                            $legal = $l;
                        }else{
                            $legal->save();
                        }

                        $model->inn = $legal->inn;
                        if($model->save()){
                            Yii::$app->session->setFlash('success', 'Ma\'lumotlar bazaga muvoffaqiyatli yozildi');
                            return $this->redirect(['viewtest', 'id' => $model->id]);
                        }else{
                            Yii::$app->session->setFlash('error', Yii::t('reg', 'Maydonlar to\'ldirilmagan model'));
                        }

                    } else {

                        Yii::$app->session->setFlash('error', Yii::t('reg', 'Maydonlar to\'ldirilmagan'));
                    }
                }
            }
        }
        $model->sert_id = $code;
        return $this->render('createtest',[
            'model'=>$model,
            'legal'=>$legal,
            'ind'=>$ind
        ]);
    }
    public function actionViewtest($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    public function actionIncometest($id){
        $model = $this->findModel($id);
        $model->operator = Yii::$app->user->id;
        $model->status_id = 2;
        $model->save();
        return $this->redirect(['viewtest','id'=>$model->id]);
    }

    public function actionAdd($id){
        $model = $this->findModel($id);

        $animal = new Animals();
        $reg = new SampleRegistration();
        $sample = new Samples();

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


    public function actionIndextest(){
        $searchModel = new SertificatesSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('indextest', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionGetInd($pnfl,$doc){
        if($model = Individuals::find()->where(['pnfl'=>$pnfl])->andWhere(['passport'=>$doc])->one()){
            $res = "{
                \"code\":200,
                \"value\":{\"pnfl\":\"{$pnfl}\",
                    \"name\":\"{$model->name}\",
                    \"surname\":\"{$model->surname}\",
                    \"middlename\":\"{$model->middlename}\",
                    \"region_id\":\"{$model->soato->region_id}\",
                    \"district_id\":\"{$model->soato->district_id}\",
                    \"soato_id\":\"{$model->soato_id}\",
                    \"passport\":\"{$model->passport}\",
                    \"adress\":\"{$model->adress}\"
                }
            }";
        }else{
            $res = get_web_page(Yii::$app->params['hamsa']['url']['getfizinfo'].'?pinfl='.$pnfl.'&document='.$doc,'hamsa');
            $model = new Individuals();
            $res = json_decode($res,true);
            if($res['code']['result']!=2200 or (isset($res['data']['result']) and $res['data']['result']==0)){
                return -1;
            }

            $model->passport = $res['data']['inf']['document'];
            $model->surname = $res['data']['inf']['surname_latin'];
            $model->name = $res['data']['inf']['name_latin'];
            $model->middlename = $res['data']['inf']['patronym_latin'];
            $model->pnfl = $pnfl;
            $res = "{
                \"code\":200,
                \"value\":{\"pnfl\":\"{$pnfl}\",
                    \"name\":\"{$model->name}\",
                    \"surname\":\"{$model->surname}\",
                    \"middlename\":\"{$model->middlename}\",
                    \"region_id\":\"-1\",
                    \"district_id\":\"-1\",
                    \"soato_id\":\"-1\",
                    \"passport\":\"{$model->passport}\",
                    \"adress\":\"{$model->adress}\"
                }
            }";
        }
        echo $res;
        exit;
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

    public function actionGetinn($inn){
        if($model = LegalEntities::findOne(['inn'=>$inn])){
            $res = "{
                \"code\":200,
                \"value\":{\"inn\":\"{$inn}\",
                    \"name\":\"{$model->name}\",
                    \"region\":\"{$model->soato->region_id}\",
                    \"district\":\"{$model->soato->district_id}\",
                    \"soato_id\":\"{$model->soato_id}\",
                    \"tshx_id\":\"{$model->tshx_id}\",
                    \"soogu\":\"{$model->soogu}\"
                }
            }";
            return $res;
        }else{
            return -1;
        }
    }

    public function actionGetvetsites($id){
        $model = VetSites::find()->where(['soato' => $id])->all();
        $text = Yii::t('cp.vetsites', '- Vet uchstkani tanlang -');
        $res = "<option value=''>{$text}</option>";
        foreach ($model as $item) {

            $res .= "<option value='{$item->id}'>{$item->name}</option>";
        }
        echo $res;
        exit;
    }


    public function actionCreateproduct(){
        $model = new FoodSamplingCertificate();
        $ind = new Individuals();
        $legal = new LegalEntities();
        $model->ownertype = 1;

        $user = Yii::$app->user->identity;
        $org = $user->empPosts->org_id;
        $user_id = Yii::$app->user->getId();
        $code = substr(date('Y'),2,2).'-2-'.get3num($org).'-';
        $num = FoodSamplingCertificate::find()->where(['organization_id'=>$org])->andFilterWhere(['like','created',date('Y')])->max('food_id');

        $num ++;

        $code .= $num;
        $model->kod = $code;
        $model->food_id = $num;
        $model->organization_id = $org;
        if ($this->request->isPost) {
            if ($model->load($this->request->post())) {
                if($model->ownertype == 1){
                    if($ind->load(Yii::$app->request->post())){
                        if($in = Individuals::findOne(['pnfl'=>$ind->pnfl])){
                            $ind = $in;
                        }else{
                            $ind->save();
                        }
                        $model->pnfl = $ind->pnfl;
                    }else{
                        Yii::$app->session->setFlash('error',Yii::t('test','Ma\'lumotlarni to\'ldirishda xatolik'));
                    }
                }else{
                    if($legal->load(Yii::$app->request->post())){
                        if($l = LegalEntities::findOne(['inn'=>$legal->inn])){
                            $legal = $l;
                        }else{
                            $legal->save();
                        }
                        $model->inn = $legal->inn;
                    }else{
                        Yii::$app->session->setFlash('error',Yii::t('test','Ma\'lumotlarni to\'ldirishda xatolik'));
                    }
                }

                if($model->save()){
                    return $this->redirect(['viewproduct', 'id' => $model->id]);
                }else{
                    Yii::$app->session->setFlash('error',Yii::t('test','Ma\'lumotlarni to\'ldirishda xatolik'));
                }
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('createproduct', [
            'model' => $model,
            'ind'=>$ind,
            'legal'=>$legal
        ]);
    }

    public function actionViewproduct($id){
        $model = FoodSamplingCertificate::findOne($id);

        return $this->render('viewproduct',[
            'model'=>$model
        ]);
    }

    public function actionIndexproduct(){

        $searchModel = new FoodSamplingCertificateSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('indexproduct', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);

    }


    public function actionRegtest(){
        $searchModel = new SampleRegistrationSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        return $this->render('regtest', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionIncome($id){
        $model = SampleRegistration::findOne($id);
        $model->emp_id = Yii::$app->user->id;
        $cs = CompositeSamples::find()->where(['registration_id'=>$id])->all();
        foreach ($cs as $item){
            $samp = Samples::findOne($item->sample_id);
            $samp->status_id = 2;
            $samp->save();
            $samp = null;
        }
        $samp = Samples::findOne($cs[0]->sample_id);
        $sert = Sertificates::findOne($samp->sert_id);
        $sert->status_id = 2;
        $model->status_id = 2;
        $sert->save();
        $model->save();
        return $this->redirect(['regview','id'=>$id]);
    }

    public function actionIncomesamples($id){
        $model = SampleRegistration::findOne($id);
        $model->emp_id = Yii::$app->user->id;

        $cs = CompositeSamples::find()->where(['registration_id'=>$id])->all();

        return $this->render('incomesamples',['model'=>$model,'cs'=>$cs]);
    }

    public function actionRegview($id){
        $model = SampleRegistration::findOne($id);
        $samples = Samples::find()->select(['samples.*'])
            ->innerJoin('composite_samples','composite_samples.sample_id = samples.id')
            ->where(['composite_samples.registration_id'=>$id])->all();

        return $this->render('regview',[
            'model'=>$model,
            'samples'=>$samples
        ]);
    }

    public function actionTestsend($id){
        $model = new RouteSert();
    }

    public function actionSend($id){
        $model = Samples::findOne($id);
        return $this->renderAjax('send',[
            'model'=>$model
        ]);
    }


    public function actionViewtestreg($id){
        $model = Sertificates::findOne($id);



        return $this->render('viewtestreg',[
            'model'=>$model
        ]);
    }
}
