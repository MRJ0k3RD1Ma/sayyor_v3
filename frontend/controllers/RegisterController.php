<?php

namespace frontend\controllers;

use app\models\search\director\DestructionSampleAnimalSearch;
use app\models\search\registr\DestructionSampleFoodSearch;
use common\models\Animals;
use common\models\CompositeSamples;
use common\models\DestructionSampleAnimal;
use common\models\DestructionSampleFood;
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
use DateTime;
use frontend\models\search\registr\FoodRegistrationSearch;
use common\models\Sertificates;
use common\models\Vaccination;
use common\models\VetSites;
use frontend\models\search\lab\SertificatesRegSearch;
use frontend\models\search\lab\SertificatesSearch;
use frontend\models\search\registr\SampleRegistrationSearch;
use kartik\mpdf\Pdf;
use Mpdf\MpdfException;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
use setasign\Fpdi\PdfParser\CrossReference\CrossReferenceException;
use setasign\Fpdi\PdfParser\PdfParserException;
use setasign\Fpdi\PdfParser\Type\PdfTypeException;
use yii\base\BaseObject;
use yii\base\InvalidConfigException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use Yii;
use yii\web\NotFoundHttpException;
use yii\web\Response;

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


    public function actionIncometest($id)
    {
        $model = $this->findModel($id);
        $model->operator = Yii::$app->user->id;
        $model->status_id = 2;

        $model->save();
        return $this->redirect(['viewtest', 'id' => $model->id]);
    }

    protected function findModel($id)
    {
        if (($model = Sertificates::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('cp.sertificates', 'The requested page does not exist.'));
    }


    public function actionGetInd($pnfl, $doc)
    {
        if ($model = Individuals::find()->where(['pnfl' => $pnfl])->andWhere(['passport' => $doc])->one()) {
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
        } else {
            $res = get_web_page(Yii::$app->params['hamsa']['url']['getfizinfo'] . '?pinfl=' . $pnfl . '&document=' . $doc, 'hamsa');
            $model = new Individuals();
            $res = json_decode($res, true);
            if ($res['code']['result'] != 2200 or (isset($res['data']['result']) and $res['data']['result'] == 0)) {
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


    public function actionGetDistrict($id)
    {
        $model = DistrictView::find()->where(['region_id' => $id])->all();
        $text = Yii::t('cp.vetsites', '- Tumanni tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item) {
            if ($lang == 'ru') {
                $name = $item->name_ru;
            } elseif ($lang == 'oz') {
                $name = $item->name_cyr;
            } else {
                $name = $item->name_lot;
            }
            $res .= "<option value='{$item->district_id}'>{$name}</option>";
        }
        echo $res;
        exit;
    }

    public function actionGetQfi($id, $regid)
    {
        $model = QfiView::find()->where(['district_id' => $id])->andWhere(['region_id' => $regid])->all();
        $text = Yii::t('cp.vetsites', '- QFYni tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item) {
            if ($lang == 'ru') {
                $name = $item->name_ru;
            } elseif ($lang == 'oz') {
                $name = $item->name_cyr;
            } else {
                $name = $item->name_lot;
            }
            $res .= "<option value='{$item->MHOBT_cod}'>{$name}</option>";
        }
        echo $res;
        exit;
    }

    public function actionGetinn($inn)
    {
        if ($model = LegalEntities::findOne(['inn' => $inn])) {
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
        } else {
            return -1;
        }
    }

    public function actionGetvetsites($id)
    {
        $model = VetSites::find()->where(['soato' => $id])->all();
        $text = Yii::t('cp.vetsites', '- Vet uchstkani tanlang -');
        $res = "<option value=''>{$text}</option>";
        foreach ($model as $item) {

            $res .= "<option value='{$item->id}'>{$item->name}</option>";
        }
        echo $res;
        exit;
    }


    public function actionRegtest(int $export = null)
    {
        $searchModel = new SampleRegistrationSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = Response::FORMAT_RAW;

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
            } catch (MpdfException $e) {
                return $e;
            } catch (CrossReferenceException $e) {
                return $e;
            } catch (PdfTypeException $e) {
                return $e;
            } catch (PdfParserException $e) {
                return $e;
            } catch (InvalidConfigException $e) {
                return $e;
            }
        }
        return $this->render('regtest', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionIncome($id)
    {
        $model = SampleRegistration::findOne($id);
        $model->emp_id = Yii::$app->user->id;
        $cs = CompositeSamples::find()->where(['registration_id' => $id])->all();
        foreach ($cs as $item) {
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
        return $this->redirect(['regview', 'id' => $id]);
    }


    public function actionRegview($id)
    {
        $model = SampleRegistration::findOne($id);
        $samples = Samples::find()->select(['samples.*'])
            ->innerJoin('composite_samples', 'composite_samples.sample_id = samples.id')
            ->where(['composite_samples.registration_id' => $id])->all();

        return $this->render('regview', [
            'model' => $model,
            'samples' => $samples
        ]);
    }


    public function actionSend($id)
    {
        $model = Samples::findOne($id);
        return $this->renderAjax('send', [
            'model' => $model
        ]);
    }

    public function actionViewtestreg($id)
    {
        $model = Sertificates::findOne($id);

        return $this->render('viewtestreg', [
            'model' => $model
        ]);
    }

    public function actionRegproduct(int $export = null)
    {
        $searchModel = new FoodRegistrationSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            return $searchModel->exportToExcel($dataProvider->query);
        } else if ($export == 2) {
            Yii::$app->response->format = Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfregproduct', ['dataProvider' => $dataProvider]),
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
            } catch (MpdfException $e) {
                return $e;
            } catch (CrossReferenceException $e) {
                return $e;
            } catch (PdfTypeException $e) {
                return $e;
            } catch (PdfParserException $e) {
                return $e;
            } catch (InvalidConfigException $e) {
                return $e;
            }
        }
        return $this->render('regproduct', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionRegproductview($id)
    {
        $model = FoodRegistration::findOne($id);
        $samples = FoodSamples::find()->select(['food_samples.*'])
            ->innerJoin('food_compose', 'food_compose.sample_id = food_samples.id')
            ->where(['food_compose.registration_id' => $id])->all();
        return $this->render('regproductview', [
            'model' => $model,
            'samp' => $samples
        ]);
    }


    public function actionIncomesamples($id, $regid)
    {
        $reg = SampleRegistration::findOne($regid);
        $model = Samples::findOne($id);
        $route = new RouteSert();
        $route->vet4 = $model->suspectedDisease->vet4 . $model->animal->type->vet4;

        if ($reg->status_id < 2) {
            $reg->emp_id = Yii::$app->user->id;
            $cs = CompositeSamples::find()->where(['registration_id' => $regid])->all();
            foreach ($cs as $item) {
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

        $cs = CompositeSamples::findOne(['registration_id' => $regid, 'sample_id' => $id]);

        if (Yii::$app->request->isPost) {
            if ($cs->load(Yii::$app->request->post()) and $route->load(Yii::$app->request->post())) {
                if ($cs->sample_status_id == 2) {
                    $model->status_id = 6;
                    $model->is_group = $cs->is_group;

                    $dal = Sertificates::findOne($model->sert_id);
                    $dal->status_id = 6;
                    $dal->save();
                    $des = new DestructionSampleAnimal();
                    $des->sample_id = $cs->sample_id;
                    $des->creator_id = Yii::$app->user->id;
                    $num = DestructionSampleAnimal::find()->where(['org_id' => Yii::$app->user->identity->empPosts->org_id])->max('code_id');
                    $num = (int)$num + 1;
                    $des->code = get3num(Yii::$app->user->identity->empPosts->org_id) . '-' . $num;
                    $des->destruction_date = date('Y-m-d h:i:s');
                    $des->state_id = 2;
                    $des->ads = $cs->ads;
                    $des->consent_id = $route->director_id;
                    $des->org_id = Yii::$app->user->identity->empPosts->org_id;
                    $des->save();
                    $model->save();
                    $cs->save();
                    if(CompositeSamples::find()->where(['sample_status_id'=>2])->andWhere(['registration_id '=>$reg->id])->count('registration_id') ==
                        CompositeSamples::find()->where(['registration_id'=>$reg->id])->count('registration_id')){
                        $reg->status_id = 6;
                    }
                    $reg->save();
                    return $this->redirect(['/register/regview', 'id' => $regid]);
                }

                $route->status_id = 1;
                $model->status_id = 3;
                $model->is_group = $cs->is_group;
                $route->sample_id = $id;
                $dal = Sertificates::findOne($model->sert_id);
                $dal->status_id = 3;
                $dal->save();
                $reg->status_id = 3;
                $reg->save();
                $model->emp_id = Yii::$app->user->id;
                $route->vet4 = $model->suspectedDisease->vet4 . $model->animal->type->vet4 . $route->sampleType->vet4;
                $route->registration_id = $regid;
                $model->save();
                $cs->save();
                $route->save();

                $d1 = new DateTime($cs->sample->animal->birthday);
                $d2 = new DateTime(date('Y-m-d'));
                $interval = $d1->diff($d2);
                $diff = $interval->m + ($interval->y * 12);

                /*$template = TamplateAnimal::find()
                    ->where(['type_id'=>$cs->sample->animal->type_id])
                    ->andWhere(['<=','age',$diff])
                    ->andWhere(['diseases_id'=>$cs->sample->suspected_disease_id])
                    ->andWhere(['test_method_id'=>$cs->sample->test_mehod_id])->all();*/

                $template = TamplateAnimal::find()->where(['vet4' => $route->vet4])->all();
                $result = new ResultAnimal();
                $result->org_id = Yii::$app->user->identity->empPosts->org_id;
                $num = ResultAnimal::find()->where(['org_id' => Yii::$app->user->identity->empPosts->org_id])->max('code_id');
                $num = intval($num) + 1;
                $result->code = get3num(Yii::$app->user->identity->empPosts->org_id) . '-' . $num;
                $result->code_id = $num;

                $result->sample_id = $cs->sample_id;
                $result->state_id = 1;
                $result->creator_id = $route->executor_id;
                $result->save();
                foreach ($template as $item) {

                    $test = new ResultAnimalTests();
                    $test->result_id = $result->id;
                    $test->template_id = $item->id;
                    $test->type_id = $item->type_id;
                    $test->result = '';
                    $test->result_2 = '';
                    $test->save();
                    $test = null;
                }

                Yii::$app->session->setFlash('success', Yii::t('test', 'Namuna muvoffaqiyatli yuborildi'));
                return $this->redirect(['/register/regview', 'id' => $regid]);
            }
        }

        $org_id = Yii::$app->user->identity->empPosts->org_id;

        $directos = Employees::find()->select(['employees.*'])->innerJoin('emp_posts', 'emp_posts.emp_id = employees.id')->where(['emp_posts.post_id' => 4])->andWhere(['emp_posts.org_id' => $org_id])->all();
        $lider = Employees::find()->select(['employees.*'])->innerJoin('emp_posts', 'emp_posts.emp_id = employees.id')->where(['emp_posts.post_id' => 3])->andWhere(['emp_posts.org_id' => $org_id])->all();

        return $this->render('incomesamples', [
            'model' => $model,
            'reg' => $reg,
            'cs' => $cs,
            'route' => $route,
            'director' => $directos,
            'lider' => $lider
        ]);
    }

    public function actionIncomeproduct($id)
    {
        // income qilish yoziladi food_samplesni

        $model = FoodRegistration::findOne($id);
        $model->emp_id = Yii::$app->user->id;
        $cs = FoodCompose::find()->where(['registration_id' => $id])->all();
        foreach ($cs as $item) {
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
        return $this->redirect(['regproductview', 'id' => $id]);

    }


    public function actionIncomefood($id, $regid)
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

                if ($cs->status_id == 2) {
                    $model->status_id = 6;
                    $model->is_group = $cs->is_group;

                    $dal = FoodSamplingCertificate::findOne($model->sert_id);
                    $dal->status_id = 6;
                    $dal->save();
                    $des = new DestructionSampleFood();
                    $des->sample_id = $cs->sample_id;
                    $des->creator_id = Yii::$app->user->id;
                    $num = DestructionSampleFood::find()->where(['org_id' => Yii::$app->user->identity->empPosts->org_id])->max('code_id');
                    $num = intval($num) + 1;
                    $des->code = get3num(Yii::$app->user->identity->empPosts->org_id) . '-' . $num;
                    $des->code_id = $num;
                    $des->destruction_date = date('Y-m-d h:i:s');
                    $des->state_id = 2;
                    $des->ads = $cs->ads;

                    $des->org_id = Yii::$app->user->identity->empPosts->org_id;

                    $des->consent_id = $route->director_id;
                    $des->save();
                    $model->save();
                    $cs->save();
                    if(FoodCompose::find()->where(['status_id'=>2])->andWhere(['registration_id'=>$reg->id])->count('registration_id') ==
                        FoodCompose::find()->where(['registration_id'=>$reg->id])->count('registration_id')){
                        $reg->status_id = 6;
                    }
                    $reg->save();
                    return $this->redirect(['/register/regproductview', 'id' => $regid]);
                }

                $route->status_id = 1;
                $model->status_id = 3;
                $model->is_group = $cs->is_group;
                $route->sample_id = $id;
                $reg->status_id = 3;
                $dal = FoodSamplingCertificate::findOne($model->sert_id);
                $dal->status_id = 3;
                $dal->save();
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

                $num = ResultFood::find()->where(['org_id' => Yii::$app->user->identity->empPosts->org_id])->max('code_id');
                $num = intval($num) + 1;
                $result->code = get3num(Yii::$app->user->identity->empPosts->org_id) . '-' . $num;
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
                    $test->result = '';
                    $test->result_2 = '';
                    $test->type_id = $item->type_id;
                    $test->save();
                    $test = null;
                }

                Yii::$app->session->setFlash('success', Yii::t('test', 'Namuna {number} raqami bilan saqlandi', ['number' => $result->code]));
                return $this->redirect(['/register/regproductview', 'id' => $regid]);
            }
        }

        $org_id = Yii::$app->user->identity->empPosts->org_id;

        $directos = Employees::find()->select(['employees.*'])->innerJoin('emp_posts', 'emp_posts.emp_id = employees.id')->where(['emp_posts.post_id' => 4])->andWhere(['emp_posts.org_id' => $org_id])->all();
        $lider = Employees::find()->select(['employees.*'])->innerJoin('emp_posts', 'emp_posts.emp_id = employees.id')->where(['emp_posts.post_id' => 3])->andWhere(['emp_posts.org_id' => $org_id])->all();

        return $this->render('incomefood', [
            'model' => $model,
            'reg' => $reg,
            'cs' => $cs,
            'route' => $route,
            'director' => $directos,
            'lider' => $lider
        ]);


    }

    public function actionDest(int $export = null)
    {
        $searchModel = new DestructionSampleAnimalSearch();
        $dataProvider = $searchModel->searchRegister($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfdest', ['dataProvider' => $dataProvider]),
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
            } catch (MpdfException $e) {
                return $e;
            } catch (CrossReferenceException $e) {
                return $e;
            } catch (PdfTypeException $e) {
                return $e;
            } catch (PdfParserException $e) {
                return $e;
            } catch (InvalidConfigException $e) {
                return $e;
            }
        }

        return $this->render('dest', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionDestview($id)
    {
        $model = DestructionSampleAnimal::findOne($id);

        return $this->render('destview', [
            'model' => $model
        ]);
    }

    public function actionDestfood($export = null)
    {
        $searchModel = new DestructionSampleFoodSearch();
        $dataProvider = $searchModel->searchRegister($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfdest', ['dataProvider' => $dataProvider]),
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
            } catch (MpdfException $e) {
                return $e;
            } catch (CrossReferenceException $e) {
                return $e;
            } catch (PdfTypeException $e) {
                return $e;
            } catch (PdfParserException $e) {
                return $e;
            } catch (InvalidConfigException $e) {
                return $e;
            }
        }
        return $this->render('destfood', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionDestfoodview($id)
    {
        $model = DestructionSampleFood::findOne($id);

        return $this->render('destfoodview', [
            'model' => $model
        ]);
    }

    public function actionDestPdf($id)
    {
        $model = DestructionSampleAnimal::findOne(['id' => $id]);
        $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
        header('Content-Disposition: attachment; name=' . $fileName);
        $file = fopen($fileName, 'r+');
        Yii::$app->response->sendFile($fileName, $model::tableName() . "_" . $model->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
    }

    public function actionDestPdffood($id)
    {
        $model = DestructionSampleFood::findOne(['id' => $id]);
        $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
        header('Content-Disposition: attachment; name=' . $fileName);
        $file = fopen($fileName, 'r+');
        Yii::$app->response->sendFile($fileName, $model::tableName() . "_" . $model->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
    }


}
