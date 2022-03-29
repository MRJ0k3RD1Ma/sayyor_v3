<?php

namespace frontend\controllers;

use common\models\Animals;
use common\models\CompositeSamples;
use common\models\DistrictView;
use common\models\Emlash;
use common\models\Employees;
use common\models\FoodCompose;
use common\models\FoodRegistration;
use common\models\FoodRoute;
use common\models\FoodSamples;
use common\models\FoodSamplingCertificate;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\QfiView;
use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\ResultFood;
use common\models\ResultFoodTests;
use common\models\RouteSert;
use common\models\SampleRegistration;
use common\models\Samples;
use common\models\TamplateAnimal;
use common\models\TemplateFood;
use frontend\models\search\registr\FoodRegistrationSearch;
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


    public function actionIncometest($id){
        $model = $this->findModel($id);
        $model->operator = Yii::$app->user->id;
        $model->status_id = 2;
        $model->save();
        return $this->redirect(['viewtest','id'=>$model->id]);
    }

    protected function findModel($id)
    {
        if (($model = Sertificates::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('cp.sertificates', 'The requested page does not exist.'));
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

    public function actionRegproduct(){
        $searchModel = new FoodRegistrationSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('regproduct', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionRegproductview($id){
        $model = FoodRegistration::findOne($id);
        $samples = FoodSamples::find()->select(['food_samples.*'])
            ->innerJoin('food_compose','food_compose.sample_id = food_samples.id')
            ->where(['food_compose.registration_id'=>$id])->all();
        return $this->render('regproductview',[
            'model'=>$model,
            'samp'=>$samples
        ]);
    }


    public function actionIncomesamples($id,$regid){
        $reg = SampleRegistration::findOne($regid);
        $model = Samples::findOne($id);
        $route = new RouteSert();
        if($reg->status_id < 2){
            $reg->emp_id = Yii::$app->user->id;
            $cs = CompositeSamples::find()->where(['registration_id'=>$regid])->all();
            foreach ($cs as $item){
                $samp = Samples::findOne($item->sample_id);
                $samp->status_id = 2;
                $samp->save();
                $samp = null;
            }
            $samp = Samples::findOne($cs[0]->sample_id);
            $sert = Sertificates::findOne($samp->sert_id);
            $sert->status_id = 2;
            $reg->status_id = 2;
            $sert->save();
            $reg->save();
        }
        $cs = CompositeSamples::findOne(['registration_id'=>$regid,'sample_id'=>$id]);

        if(Yii::$app->request->isPost){
           if($cs->load(Yii::$app->request->post()) and $route->load(Yii::$app->request->post())){
               $cs->status_id = 3;
               $route->status_id = 1;
               $model->status_id = 3;
               $route->sample_id = $id;
               $reg->status_id = 3;
               $reg->save();
               $model->emp_id = Yii::$app->user->id;
               $route->registration_id = $regid;
               $model->save();
               $cs->save();
               $route->save();

               $d1 = new \DateTime($cs->sample->animal->birthday);
               $d2 = new \DateTime(date('Y-m-d'));
               $interval = $d1->diff($d2);
               $diff = $interval->m+($interval->y*12);
               $template = TamplateAnimal::find()
                   ->where(['type_id'=>$cs->sample->animal->type_id])
                   ->andWhere(['<=','age',$diff])
                   ->andWhere(['diseases_id'=>$cs->sample->suspected_disease_id])
                   ->andWhere(['test_method_id'=>$cs->sample->test_mehod_id])->all();
               $result = new ResultAnimal();

               $num = ResultAnimal::find()->where(['org_id'=>Yii::$app->user->identity->empPosts->org_id])->max('code_id');
               $num = intval($num);
               $result->code = get3num(Yii::$app->user->identity->empPosts->org_id).'-'.$num;
               $result->code_id = $num;

               $result->sample_id = $cs->sample_id;
               $result->state_id = 1;
               $result->creator_id = $route->executor_id;
               $result->save();
               foreach ($template as $item){
                    $test = new ResultAnimalTests();
                    $test->result_id = $result->id;
                    $test->template_id = $item->id;
                    $test->type_id = $item->type_id;
                    $test->save();
                    $test = null;
               }

               Yii::$app->session->setFlash('success',Yii::t('test','Namuna muvoffaqiyatli yuborildi'));
               return $this->redirect(['/register/regview','id'=>$regid]);
           }
       }

        $org_id = Yii::$app->user->identity->empPosts->org_id;

        $directos = Employees::find()->select(['employees.*'])->innerJoin('emp_posts','emp_posts.emp_id = employees.id')->where(['emp_posts.post_id'=>4])->andWhere(['emp_posts.org_id'=>$org_id])->all();
        $lider    = Employees::find()->select(['employees.*'])->innerJoin('emp_posts','emp_posts.emp_id = employees.id')->where(['emp_posts.post_id'=>3])->andWhere(['emp_posts.org_id'=>$org_id])->all();

        $cs = CompositeSamples::findOne(['registration_id'=>$regid,'sample_id'=>$id]);
        return $this->render('incomesamples',[
            'model'=>$model,
            'reg'=>$reg,
            'cs'=>$cs,
            'route'=>$route,
            'director'=>$directos,
            'lider'=>$lider
        ]);
    }

    public function actionIncomeproduct($id){
        // income qilish yoziladi food_samplesni

        $model = FoodRegistration::findOne($id);
        $model->emp_id = Yii::$app->user->id;
        $cs = FoodCompose::find()->where(['registration_id'=>$id])->all();
        foreach ($cs as $item){
            $samp = FoodSamples::findOne($item->sample_id);
            $samp->status_id = 2;
            $samp->save();
            $samp = null;
        }
        $samp = FoodSamples::findOne($cs[0]->sample_id);
        $sert = FoodSamplingCertificate::findOne($samp->sert_id);
        $sert->status_id = 2;
        $model->status_id = 2;
        $sert->save();
        $model->save();
        return $this->redirect(['regproductview','id'=>$id]);

    }


    public function actionIncomefood($id,$regid)
    {
        $reg = FoodRegistration::findOne($regid);
        $model = FoodSamples::findOne($id);
        $route = new FoodRoute();
        if ($reg->status_id < 2) {
            $reg->emp_id = Yii::$app->user->id;
            $cs = FoodCompose::find()->where(['registration_id' => $regid])->all();
            foreach ($cs as $item) {
                $samp = FoodSamples::findOne($item->sample_id);
                $samp->status_id = 2;
                $samp->save();
                $samp = null;
            }
            $samp = FoodSamples::findOne($cs[0]->sample_id);
            $sert = FoodSamplingCertificate::findOne($samp->sert_id);
            $sert->status_id = 2;
            $reg->status_id = 2;
            $sert->save();
            $reg->save();
        }
        $cs = FoodCompose::findOne(['registration_id' => $regid, 'sample_id' => $id]);

        if (Yii::$app->request->isPost) {
            if ($cs->load(Yii::$app->request->post()) and $route->load(Yii::$app->request->post())) {
                $cs->status_id = 3;
                $route->status_id = 1;
                $model->status_id = 3;
                $route->sample_id = $id;
                $reg->status_id = 3;
                $reg->save();
                $model->emp_id = Yii::$app->user->id;
                $route->registration_id = $regid;
                $model->save();
                $cs->save();
                $route->save();


                $template = TemplateFood::find()
                    ->where(['laboratory_test_type_id' => $cs->sample->laboratory_test_type_id])
                    ->andWhere(['tasnif_code' => $cs->sample->tasnif_code])->all();
                $result = new ResultFood();

                $num = ResultFood::find()->where(['org_id'=>Yii::$app->user->identity->empPosts->org_id])->max('code_id');
                $num = intval($num)+1;
                $result->code = get3num(Yii::$app->user->identity->empPosts->org_id).'-'.$num;
                $result->code_id = $num;
                $result->org_id = Yii::$app->user->identity->empPosts->org_id;

                $result->sample_id = $cs->sample_id;
                $result->state_id = 1;
                $result->creator_id = $route->executor_id;
                $result->save();
                foreach ($template as $item) {
                    $test = new ResultFoodTests();
                    $test->result_id = $result->id;
                    $test->template_id = $item->id;
                    $test->type_id = $item->type_id;
                    $test->save();
                    $test = null;
                }

                Yii::$app->session->setFlash('success', Yii::t('test', 'Namuna {number} raqami bilan saqlandi',['number'=>$result->code]));
                return $this->redirect(['/register/regproductview', 'id' => $regid]);
            }
        }

        $org_id = Yii::$app->user->identity->empPosts->org_id;

        $directos = Employees::find()->select(['employees.*'])->innerJoin('emp_posts','emp_posts.emp_id = employees.id')->where(['emp_posts.post_id'=>4])->andWhere(['emp_posts.org_id'=>$org_id])->all();
        $lider    = Employees::find()->select(['employees.*'])->innerJoin('emp_posts','emp_posts.emp_id = employees.id')->where(['emp_posts.post_id'=>3])->andWhere(['emp_posts.org_id'=>$org_id])->all();

        return $this->render('incomefood',[
            'model'=>$model,
            'reg'=>$reg,
            'cs'=>$cs,
            'route'=>$route,
            'director'=>$directos,
            'lider'=>$lider
        ]);


    }


}
