<?php

namespace frontend\controllers;


use app\models\search\director\DestructionSampleAnimalSearch;
use app\models\search\director\DestructionSampleFoodSearch;
use app\models\search\director\FoodRouteSearch;
use common\models\CompositeSamples;
use common\models\DestructionSampleAnimal;
use common\models\DestructionSampleFood;
use common\models\Employees;

use common\models\FoodCompose;
use common\models\FoodRegistration;
use common\models\FoodRoute;
use common\models\FoodSamples;
use common\models\FoodSamplingCertificate;
use common\models\Individuals;
use common\models\Organizations;
use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\ResultFood;
use common\models\ResultFoodTests;
use common\models\RouteSert;
use common\models\SampleRegistration;
use common\models\Samples;
use common\models\Sertificates;
use common\models\Soato;
use common\models\Vet4;
use Exception;
use frontend\models\search\director\RouteSertSearch;
use kartik\mpdf\Pdf;
use Mpdf\MpdfException;
use PhpOffice\PhpSpreadsheet\Cell\DataType;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use setasign\Fpdi\PdfParser\CrossReference\CrossReferenceException;
use setasign\Fpdi\PdfParser\PdfParserException;
use setasign\Fpdi\PdfParser\Type\PdfTypeException;
use yii\base\BaseObject;
use yii\base\InvalidConfigException;
use yii\helpers\FileHelper;
use yii\helpers\VarDumper;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use Yii;

/**
 * Site controller
 */
class DirectorController extends Controller
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

    public function actionIndexanimal($status = -1, int $export = null)
    {
        $searchModel = new RouteSertSearch();
        if ($status != -1) {
            $searchModel->status_id = $status;
        }
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfindexanimal', ['dataProvider' => $dataProvider]),
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

        return $this->render('indexanimal', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionViewanimal($id)
    {
        $model = RouteSert::findOne($id);
        $sample = $model->sample;
        $emp = Employees::find()->select(['employees.*'])
            ->innerJoin('emp_posts', 'emp_posts.emp_id = employees.id')
            ->where(['emp_posts.post_id' => 2])
            ->andWhere(['emp_posts.org_id' => Yii::$app->user->identity->empPosts->org_id])
            ->andWhere(['emp_posts.gov_id' => Yii::$app->user->identity->empPosts->gov_id])->all();
        $model->scenario = 'exec';
        $result = ResultAnimal::findOne(['sample_id' => $sample->id]);
        $test = ResultAnimalTests::find()->indexBy('id')->where(['result_id' => $result->id])->andWhere(['checked'=>1])->all();
        $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations', 'template_animal_regulations.regulation_id = regulations.id')
            ->innerJoin('tamplate_animal', 'tamplate_animal.id=template_animal_regulations.template_id')
            ->where('tamplate_animal.id in (select result_animal_tests.template_id from result_animal_tests where result_id=' . $result->id . ')')
            ->groupBy('regulations.id')->all();

        return $this->render('viewanimal', [
            'model' => $model,
            'sample' => $sample,
            'result' => $result,
            'emp' => $emp,
            'test' => $test,
            'docs' => $docs
        ]);
    }

    public function actionVerifyanimal($id)
    {
        $model = RouteSert::findOne(['id' => $id]);
        $model->status_id = 3;
        if ($model->save()) {
            $dest = new DestructionSampleAnimal();
            $dest->state_id = 3;
            $sample = Samples::findOne($model->sample_id);
            $sample->status_id = 5;
            $sample->save();
            $dal = Sertificates::findOne($sample->sert_id);
            $dal->status_id = 5;
            $dal->save();
            $cs = CompositeSamples::findOne(['sample_id' => $sample->id]);
            $reg = SampleRegistration::findOne(['id' => $cs->registration_id]);
            $reg->status_id = 5;
            $reg->save();
            $cs->status_id = 5;
            $cs->save();

            $dest->creator_id = $model->executor_id;
            $dest->consent_id = $model->director_id;
            $dest->sample_id = $model->sample_id;
            $num = DestructionSampleAnimal::find()->where(['org_id' => Yii::$app->user->identity->empPosts->org_id])->max('code_id');
            $num = intval($num) + 1;
            $dest->code_id = $num;
            $dest->code = get3num(Yii::$app->user->identity->empPosts->org_id) . '-' . $num;
            $dest->org_id = Yii::$app->user->identity->empPosts->org_id;
            $dest->save();

            Yii::$app->session->setFlash('success', Yii::t('leader', 'Namuna tekshiruv natijasi imzolandi. Namunani yo\'q qilish uchun topshiriq yuborildi.'));

            $result = ResultAnimal::findOne(['sample_id' => $dest->sample_id]);
            $result->consent_id = $model->director_id;
            $result->creator_id = $model->executor_id;
            $result->save();
            $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations', 'template_animal_regulations.regulation_id = regulations.id')
                ->innerJoin('tamplate_animal', 'tamplate_animal.id=template_animal_regulations.template_id')
                ->where('tamplate_animal.id in (select result_animal_tests.template_id from result_animal_tests where result_animal_tests.checked = 1 and result_id=' . $result->id . ')')
                ->groupBy('regulations.id')->all();//->innerJoin('result_food_tests','template_food.id = result_food_tests.template_id and result_food_tests.checked=1')
            ;
            if($model->sample->is_group==0){
                $pdf = new Pdf([
                    'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                    'destination' => Pdf::DEST_BROWSER,
                    'content' => $this->renderPartial('pdf-verify', ['model' => $sample, 'regmodel' => $reg, 'docs' => $docs]),
                    'options' => [
                    ],
                    'methods' => [
                        'SetTitle' => "Ariza",
                        'SetHeader' => [' ' . '|| ' . date("r")],
                        'SetFooter' => ['| {PAGENO} |'],
                        'SetAuthor' => '@QalandarDev',
                        'SetCreator' => '@QalandarDev',
                    ]
                ]);

                try {

                    $upload_dir = Yii::getAlias('@uploads');
                    $content = $pdf->render();
                    $fileName = $upload_dir . "/../pdf/" . $sample::tableName() . "_" . $sample->id . ".pdf";
                    if (file_exists($fileName)) {
                        unlink($fileName);
                    }
                    $file = fopen($fileName, 'wb+');

                    fwrite($file, $content);

                    fclose($file);

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
                Yii::$app->session->setFlash('url', Yii::$app->urlManager->createUrl(['/director/pdf-animal', 'id' => $model->sample_id]));
            }else{
                $cnt = \common\models\Samples::find()->where(['sert_id'=>$model->sample->sert_id])->andWhere(['<>','status_id',6])->andWhere(['is_group'=>1])->count('id');
                $cnt_acc = \common\models\Samples::find()->where(['sert_id'=>$model->sample->sert_id])->andWhere(['is_group'=>1])->andWhere(['<>','status_id',6])->andWhere(['status_id'=>5])->count('id');
                // mutipleni yozish garak

                $regis = SampleRegistration::findOne($model->registration_id);
                $nm = SampleRegistration::find()->where(['organization_id'=>$regis->organization_id])->max('res_id');
                $nm = intval($nm)+1;
                $regis->res = "M/".get3num($regis->organization_id).'-'.$nm;
                $regis->res_id = $nm;
                $regis->save(false);

                if($cnt==$cnt_acc){

                    $pdf = new Pdf([
                        'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                        'destination' => Pdf::DEST_BROWSER,
                        'content' => $this->renderPartial('pdf-verify_multi', ['model' => $sample, 'regmodel' => $reg]),
                        'options' => [
                        ],
                        'methods' => [
                            'SetTitle' => "Ariza",
                            'SetHeader' => [' ' . '|| ' . date("r")],
                            'SetFooter' => ['| {PAGENO} |'],
                            'SetAuthor' => '@QalandarDev',
                            'SetCreator' => '@QalandarDev',
                        ]
                    ]);

                    try {

                        $upload_dir = Yii::getAlias('@uploads');
                        $content = $pdf->render();
                        $fileName = $upload_dir . "/../pdf/" . SampleRegistration::tableName() . "_" . $model->registration_id . ".pdf";
                        if (file_exists($fileName)) {
                            unlink($fileName);
                        }
                        $file = fopen($fileName, 'wb+');

                        fwrite($file, $content);

                        fclose($file);

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
                    Yii::$app->session->setFlash('url', Yii::$app->urlManager->createUrl(['/director/pdf-animal-multi', 'id' => CompositeSamples::findOne($sample->id)->registration_id]));
                }
            }

        }

        return $this->redirect(['viewanimal', 'id' => $id]);

    }

    public function actionDeclineanimal($id)
    {
        $model = RouteSert::findOne(['id' => $id]);
        $model->status_id = 6;
        if ($model->save()) {
            Yii::$app->session->setFlash('success', Yii::t('leader', 'Namuna tekshiruv natijasi rad etildi'));
        }
        return $this->redirect(['indexanimal']);

    }


    public function actionRenderPdf($id)
    {
        $model = RouteSert::findOne(['id' => $id]);
        $sample = Samples::findOne($model->sample_id);
        $cs = CompositeSamples::findOne(['sample_id' => $sample->id]);
        $reg = SampleRegistration::findOne(['id' => $cs->registration_id]);
        $result = ResultAnimal::findOne(['sample_id' => $model->sample_id]);
        $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations', 'template_animal_regulations.regulation_id = regulations.id')
            ->innerJoin('tamplate_animal', 'tamplate_animal.id=template_animal_regulations.template_id')
            ->where('tamplate_animal.id in (select result_animal_tests.template_id from result_animal_tests where result_animal_tests.checked = 1 and result_id=' . $result->id . ')')
            ->groupBy('regulations.id')->all();
        return $this->render('pdf-verify', ['model' => $sample, 'regmodel' => $reg, 'docs' => $docs]);
        $model->status_id = 5;
        if ($model->save()) {
            $dest = new DestructionSampleAnimal();
            $dest->state_id = 3;
            $sample = Samples::findOne($model->sample_id);
            $sample->status_id = 5;
            $sample->save();
            $dal = Sertificates::findOne($sample->sert_id);
            $dal->status_id = 5;
            $dal->save();
            $cs = CompositeSamples::findOne(['sample_id' => $sample->id]);
            $reg = SampleRegistration::findOne(['id' => $cs->registration_id]);
            $reg->status_id = 5;
            $reg->save();
            $cs->status_id = 5;
            $cs->save();
            $reg = SampleRegistration::findOne(['id' => $cs->registration_id]);
            if (CompositeSamples::find()->where(['sample_id' => $sample->id])->count('sample_id') == CompositeSamples::find()->where(['sample_id' => $sample->id])->andWhere(['status_id' => 4])->count('sample_id')) {

                $reg->status_id = 5;
                $reg->save();
            }


            $dest->creator_id = $model->executor_id;
            $dest->consent_id = $model->director_id;
            $dest->sample_id = $model->sample_id;
            $num = DestructionSampleAnimal::find()->where(['org_id' => Yii::$app->user->identity->empPosts->org_id])->max('code_id');
            $num = intval($num) + 1;
            $dest->code_id = $num;
            $dest->code = get3num(Yii::$app->user->identity->empPosts->org_id) . '-' . $num;
            $dest->org_id = Yii::$app->user->identity->empPosts->org_id;
            $dest->save();
            Yii::$app->session->setFlash('success', Yii::t('leader', 'Namuna tekshiruv natijasi imzolandi. Namunani yo\'q qilish uchun topshiriq yuborildi.'));
            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('pdf-verify', ['model' => $sample, 'regmodel' => $reg, 'docs' => $docs]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => "Ariza",
                    'SetHeader' => [' ' . '|| ' . date("r")],
                    'SetFooter' => ['| {PAGENO} |'],
                    'SetAuthor' => '@QalandarDev',
                    'SetCreator' => '@QalandarDev',
                ]
            ]);
            try {
                $upload_dir = Yii::getAlias('@uploads');
                $content = $pdf->render();
                $fileName = $upload_dir . "/../pdf/" . $sample::tableName() . "_" . $sample->id . ".pdf";
                $file = fopen($fileName, 'wb+');
                fwrite($file, $content);
                fclose($file);
                return $pdf->render();
            } catch (MpdfException|CrossReferenceException|PdfTypeException|PdfParserException|InvalidConfigException $e) {
                return $e;
            }
        }
    }

    public function actionDest(int $export = null)
    {
        $searchModel = new DestructionSampleAnimalSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;

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
            } catch (MpdfException|CrossReferenceException|PdfTypeException|PdfParserException|InvalidConfigException $e) {
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

    public function actionDestok($id)
    {
        $model = DestructionSampleAnimal::findOne($id);
        $model->state_id = 1;
        $model->approved_date = date('Y-m-d h:i:s');
        if ($model->save()) {
            $pdf = new Pdf([
                'filename' => 'filename.pdf',
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
//            'destination' => Pdf::DEST_FILE,
                'content' => $this->renderPartial('pdf-dest', ['model' => $model]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => "Ariza",
                    'SetHeader' => [' ' . '|| ' . date("r")],
                    'SetFooter' => ['| {PAGENO} |'],
                    'SetAuthor' => '@QalandarDev',
                    'SetCreator' => '@QalandarDev',
                ]
            ]);
            try {
                $upload_dir = Yii::getAlias('@uploads');
                $content = $pdf->render();
                $fileName = $upload_dir . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
                if (file_exists($fileName)) {
                    unlink($fileName);
                }
                $file = fopen($fileName, 'wb+');
                fwrite($file, $content);
                fclose($file);
            } catch (Exception $e) {
                return $e;
            }
            Yii::$app->session->setFlash('success', '{code} raqamli namunani yo\'q qilish dalolatnomasi tasdiqlandi', ['code' => $model->code]);
        } else {
            Yii::$app->session->setFlash('error', 'Tasdiqlashda xatolik');
        }
        Yii::$app->session->setFlash('url', Yii::$app->urlManager->createUrl(['/director/dest-pdf', 'id' => $id]));
        return $this->redirect(['dest']);
    }

    public function actionDestno($id)
    {
        $model = DestructionSampleAnimal::findOne($id);
        $model->state_id = 3;
        $model->approved_date = date('Y-m-d h:i:s');
        if ($model->save()) {
            Yii::$app->session->setFlash('success', '{code} raqamli namunani yo\'q qilish dalolatnomasi rad etildi', ['code' => $model->code]);
        } else {
            Yii::$app->session->setFlash('error', 'Tasdiqlashda xatolik');
        }
        return $this->redirect(['dest']);
    }

    public function actionIndexfood($status = -1, $export = null)
    {

        $searchModel = new FoodRouteSearch();
        if ($status != -1) {
            $searchModel->status_id = $status;
        }
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfindexfood', ['dataProvider' => $dataProvider]),
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

        return $this->render('indexfood', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);

    }


    public function actionViewfood($id)
    {
        $model = FoodRoute::findOne($id);
        $sample = $model->sample;
        $emp = Employees::find()->select(['employees.*'])
            ->innerJoin('emp_posts', 'emp_posts.emp_id = employees.id')
            ->where(['emp_posts.post_id' => 2])
            ->andWhere(['emp_posts.org_id' => Yii::$app->user->identity->empPosts->org_id])
            ->andWhere(['emp_posts.gov_id' => Yii::$app->user->identity->empPosts->gov_id])->all();

        if ($model->load(Yii::$app->request->post())) {
            $model->status_id = 2;
            $sam = FoodSamples::findOne($model->sample_id);
            $sam->status_id = 4;
            $sam->save();
            $cs = FoodCompose::findOne(['sample_id' => $sam->id]);

            $reg = FoodRegistration::findOne(['id' => $cs->registration_id]);
            $reg->status_id = 4;
            $reg->save();
            if ($model->save()) {
                Yii::$app->session->setFlash('success', Yii::t('leader', 'Topshiriq muvoffaqiyatli yuborildi'));
                return $this->redirect(['viewfood', 'id' => $id]);
            }
        }
        $result = ResultFood::findOne(['sample_id' => $sample->id]);
        $test = ResultFoodTests::find()->indexBy('id')->where(['result_id' => $result->id])->andWhere(['checked' => 1])->all();

        $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_food_regulations', 'template_food_regulations.regulation_id = regulations.id')
            ->innerJoin('template_food', 'template_food_regulations.template_id = template_food.id')
            ->orderBy('template_food_regulations.regulation_id')
            ->where('template_food.id IN (SELECT result_food_tests.id from result_food_tests inner join template_food on result_food_tests.template_id=template_food.id where result_food_tests.result_id=' . $result->id . ')')->all();;

        return $this->render('viewfood', [
            'model' => $model,
            'sample' => $sample,
            'result' => $result,
            'emp' => $emp,
            'test' => $test,
            'docs' => $docs
        ]);
    }

    public function actionAcceptfood($id)
    {
        $model = FoodRoute::findOne($id);
        $model->status_id = 3;

        if ($model->save()) {

            $dest = new DestructionSampleFood();
            $dest->state_id = 3;
            $sample = FoodSamples::findOne($model->sample_id);
            $sample->status_id = 5;
            $sample->save();
            $dal = FoodSamplingCertificate::findOne($sample->sert_id);
            $dal->status_id = 5;
            $dal->save();
            $cs = FoodCompose::findOne(['sample_id' => $sample->id]);
            $reg = FoodRegistration::findOne(['id' => $cs->registration_id]);
            $reg->status_id = 5;
            $reg->save();


            $dest->creator_id = $model->executor_id;
            $dest->consent_id = $model->director_id;
            $dest->sample_id = $model->sample_id;

            $num = DestructionSampleFood::find()->where(['org_id' => Yii::$app->user->identity->empPosts->org_id])->max('code_id');
            $num = intval($num) + 1;

            $dest->code_id = $num;
            $dest->code = get3num(Yii::$app->user->identity->empPosts->org_id) . '-' . $num;
            $dest->org_id = Yii::$app->user->identity->empPosts->org_id;
            $dest->save();

            Yii::$app->session->setFlash('success', Yii::t('lab', 'Topshiriq imzolandi. Namunani yo\'q qilish uchun {code} raqamli dalolatnoma labarantga yuborildi', ['code' => $dest->code]));

            $result = ResultFood::findOne(['sample_id' => $dest->sample_id]);
            $result->creator_id = $model->executor_id;
            $result->consept_id = $model->director_id;
            $result->save();
            $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_food_regulations', 'template_food_regulations.regulation_id = regulations.id')
                ->innerJoin('template_food', 'template_food.id=template_food_regulations.template_id')
                ->where('template_food.id in (select result_food_tests.template_id from result_food_tests where result_food_tests.checked = 1 and result_id=' . $result->id . ')')
                ->groupBy('regulations.id')->all();;
            //return $this->render('pdf-verify2', ['model' => $sample, 'regmodel' => $reg,'docs'=>$docs,'result'=>$result]);
            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('pdf-verify2', ['model' => $sample, 'regmodel' => $reg, 'docs' => $docs, 'result' => $result]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => "Tekshiruv dalolatnomasi",
                    'SetHeader' => [' ' . '|| ' . date("r")],
                    'SetFooter' => ['| {PAGENO} |'],
                    'SetAuthor' => '@QalandarDev',
                    'SetCreator' => '@QalandarDev',
                ]
            ]);
            try {
                $upload_dir = Yii::getAlias('@uploads');
                $content = $pdf->render();
                $fileName = $upload_dir . "/../pdf/" . $sample::tableName() . "_" . $sample->id . ".pdf";
                if (file_exists($fileName)) {
                    unlink($fileName);
                }
                $file = fopen($fileName, 'wb+');
                fwrite($file, $content);
                fclose($file);
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
        Yii::$app->session->setFlash('url', Yii::$app->urlManager->createUrl(['/director/pdf-food', 'id' => $model->sample_id]));
        return $this->redirect(['viewfood', 'id' => $id]);
    }

    public function actionDeclinefood($id)
    {
        $model = FoodRoute::findOne($id);
        $model->status_id = 6;
        if ($model->save()) {
            Yii::$app->session->setFlash('success', Yii::t('lab', 'Namuna tekshiruv natijasi rad qilindi.'));
        }
        return $this->redirect(['viewfood', 'id' => $id]);
    }


    public function actionDestfood($export = null)
    {
        $searchModel = new DestructionSampleFoodSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            $searchModel->exportToExcel($dataProvider->query);
        } elseif ($export == 2) {
            Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('_pdfdestfood', ['dataProvider' => $dataProvider]),
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

    public function actionDestfoodok($id)
    {
        $model = DestructionSampleFood::findOne($id);
        $model->state_id = 1;
        $model->approved_date = date('Y-m-d h:i:s');
        if ($model->save()) {
            $pdf = new Pdf([
                'filename' => 'filename.pdf',
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
//            'destination' => Pdf::DEST_FILE,
                'content' => $this->renderPartial('pdf-dest2', ['model' => $model]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => "Ariza",
                    'SetHeader' => [' ' . '|| ' . date("r")],
                    'SetFooter' => ['| {PAGENO} |'],
                    'SetAuthor' => '@QalandarDev',
                    'SetCreator' => '@QalandarDev',
                ]
            ]);
            try {
                $upload_dir = Yii::getAlias('@uploads');
                $content = $pdf->render();
                $fileName = $upload_dir . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
                if (file_exists($fileName)) {
                    unlink($fileName);
                }
                $file = fopen($fileName, 'wb+');
                fwrite($file, $content);
                fclose($file);
            } catch (Exception $e) {
                return $e;
            }
            Yii::$app->session->setFlash('success', '{code} raqamli namunani yo\'q qilish dalolatnomasi tasdiqlandi', ['code' => $model->code]);
        } else {
            Yii::$app->session->setFlash('error', 'Tasdiqlashda xatolik');
        }
        Yii::$app->session->setFlash('url', Yii::$app->urlManager->createUrl(['/director/dest-pdffood', 'id' => $id]));
        return $this->redirect(['destfoodview', 'id' => $id]);
    }

    public function actionDestfoodno($id)
    {
        $model = DestructionSampleFood::findOne($id);
        $model->state_id = 3;
        $model->approved_date = date('Y-m-d h:i:s');
        if ($model->save()) {
            Yii::$app->session->setFlash('success', '{code} raqamli namunani yo\'q qilish dalolatnomasi rad qilindi', ['code' => $model->code]);
        } else {
            Yii::$app->session->setFlash('error', 'Tasdiqlashda xatolik');
        }
        return $this->redirect(['destfood']);
    }

    public function actionPdfAnimal($id)
    {
        $model = Samples::findOne(['id' => $id]);
        if($model->is_group == 1){

            $regid = CompositeSamples::findOne(['sample_id'=>$model->id]);

            $fileName = Yii::getAlias('@uploads') . "/../pdf/" . SampleRegistration::tableName() . "_" . $regid->registration_id . ".pdf";
            header('Content-Disposition: attachment; name=' . $fileName);
            $file = fopen($fileName, 'r+');
            Yii::$app->response->sendFile($fileName, SampleRegistration::tableName() . "_" . $regid->registration_id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
        }else{
            $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
            header('Content-Disposition: attachment; name=' . $fileName);
            $file = fopen($fileName, 'r+');
            Yii::$app->response->sendFile($fileName, $model::tableName() . "_" . $model->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();

        }

    }

    public function actionPdfAnimalMulti($id)
    {
        $model = SampleRegistration::findOne(['id' => $id]);
        $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
        header('Content-Disposition: attachment; name=' . $fileName);
        $file = fopen($fileName, 'r+');
        Yii::$app->response->sendFile($fileName, $model::tableName() . "_" . $model->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();

    }

    public function actionPdfFood($id)
    {
        $model = FoodSamples::findOne(['id' => $id]);
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

    public function actionDestPdf($id)
    {
        $model = DestructionSampleAnimal::findOne(['id' => $id]);
        $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
        header('Content-Disposition: attachment; name=' . $fileName);
        $file = fopen($fileName, 'r+');
        Yii::$app->response->sendFile($fileName, $model::tableName() . "_" . $model->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
    }

    public function actionReportvet4(){
        $model = new Vet4();
        if($model->load(Yii::$app->request->post())){

            $res = ResultAnimal::find()
                ->where('end_date is not null')
                ->andWhere(['>=','end_date',$model->date_to])
                ->andWhere(['<=','end_date',$model->date_do])
                ->andWhere(['org_id'=>Yii::$app->user->identity->empPosts->org_id])

            ->all();

            $speadsheet = new Spreadsheet();

            $sheet = $speadsheet->getActiveSheet();
            $speadsheet->getActiveSheet()->getColumnDimension('A')->setWidth(10);
            $speadsheet->getActiveSheet()->getColumnDimension('B')->setWidth(30);
            $speadsheet->getActiveSheet()->getColumnDimension('C')->setWidth(30);
            $speadsheet->getActiveSheet()->getColumnDimension('D')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('E')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('F')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('G')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('H')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('I')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('J')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('K')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('L')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('M')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('N')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('O')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('P')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('Q')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('R')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('S')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('T')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('U')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('V')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('W')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('X')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('Y')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('Z')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('AA')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('AB')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('AC')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('AD')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('AE')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('AF')->setWidth(12);
            $speadsheet->getActiveSheet()->getColumnDimension('AG')->setWidth(12);
            $title = date('Y-m-d h:i:s');
//            $sheet->setTitle(substr($title, 0, 31));
            $row = 1;
            $col = 1;
            /*col = 33*/
            $sheet->mergeCells("A1:L1");
            $sheet->setCellValue('A1','Hayvon kasalliklari tashxisi bo`yicha o`tkazilgan tekshiruvlar');
            $sheet->mergeCells("A2:D2");
            $sheet->mergeCells("C2:D2");
            $sheet->mergeCells("E2:L2");
            $sheet->setCellValue("E2",date('d.m.Y',strtotime($model->date_to)).' - '.date('d.m.Y',strtotime($model->date_do)));
            $sheet->setCellValue('A2',Organizations::findOne(Yii::$app->user->identity->empPosts->org_id)->NAME_FULL);

            $sheet->mergeCells("M1:O1");
            $sheet->setCellValue('M1','4vet hisoboti');
            $sheet->mergeCells("M2:O2");
            $sheet->setCellValue('M2',date('Y-m-d h:i:s'));

            $sheet->mergeCells("A3:A5");
            $sheet->setCellValue('A3','Kasallik, hayvon nomi');

            $sheet->mergeCells("B3:B5");
            $sheet->setCellValue('B3','Kod');
            $sheet->mergeCells("C3:C5");
            $sheet->setCellValue('C3','Materiallar soni');
            $sheet->mergeCells("D3:D5");
            $sheet->setCellValue('A3','');
            $sheet->mergeCells("E3:AE3");
            $sheet->setCellValue('E3','4vet hisoboti uchun');

            $sheet->mergeCells("AF3:AF5");
            $sheet->setCellValue('AF3','Musbat natijalar');

            $sheet->mergeCells("AG3:AG5");
            $sheet->setCellValue('AG3','Tekshiruvlar soni');

            $sheet->mergeCells("E4:E5");
            $sheet->setCellValue('E4','Patonomiya');

            $sheet->mergeCells("F4:F5");
            $sheet->setCellValue('F4','Orgonalepika');

            $sheet->mergeCells("G4:H4");
            $sheet->setCellValue('G4','Mikroskopiya');
            $sheet->setCellValue('G5','Nur');
            $sheet->setCellValue('H5','Lyuminesent');

            $sheet->mergeCells("I4:I5");
            $sheet->setCellValue('I4','Bakteriologik');

            $sheet->mergeCells("J4:K5");
            $sheet->setCellValue('J4','Virusologik');
            $sheet->setCellValue('J5','TE KE');
            $sheet->setCellValue('K5','XM KK');

            $sheet->mergeCells("L4:L5");
            $sheet->setCellValue('L4','Biologik');

            $sheet->mergeCells("M4:Z4");
            $sheet->setCellValue('M4','Serologik');
            $sheet->setCellValue('M5','RA KR');
            $sheet->setCellValue('N5','RSK');
            $sheet->setCellValue('O5','RDSK');
            $sheet->setCellValue('P5','RBP');
            $sheet->setCellValue('Q5','RMA');
            $sheet->setCellValue('R5','RP,RDP');
            $sheet->setCellValue('S5','RN');
            $sheet->setCellValue('T5','RNGA');
            $sheet->setCellValue('U5','RKGA');
            $sheet->setCellValue('V5','RGA');
            $sheet->setCellValue('X5','IFA');
            $sheet->setCellValue('Y5','IXLA');
            $sheet->setCellValue('Z5','Boshqa');

            $sheet->mergeCells("AA4:AA5");
            $sheet->mergeCells("AB4:AB5");
            $sheet->mergeCells("AC4:AC5");
            $sheet->mergeCells("AD4:AD5");
            $sheet->mergeCells("AE4:AE5");
            $sheet->mergeCells("AF4:AF5");
            $sheet->setCellValue('AA4','PSR');
            $sheet->setCellValue('AB4','Gistologiya');
            $sheet->setCellValue('AC4','Gemotologiya');
            $sheet->setCellValue('AD4','Koprologik');
            $sheet->setCellValue('AE4','Kimyoviy');
            $sheet->setCellValue('AF4','Biokimyoviy');

            $sheet->setCellValue('A6','');
            $sheet->setCellValue('B6','A');
            $sheet->setCellValue('C6','B');
            $sheet->setCellValue('D6','1');
            $sheet->setCellValue('E6','2');
            $sheet->setCellValue('F6','3');
            $sheet->setCellValue('G6','4');
            $sheet->setCellValue('H6','5');
            $sheet->setCellValue('I6','6');
            $sheet->setCellValue('J6','7');
            $sheet->setCellValue('K6','8');
            $sheet->setCellValue('L6','9');
            $sheet->setCellValue('M6','10');
            $sheet->setCellValue('N6','11');
            $sheet->setCellValue('O6','12');
            $sheet->setCellValue('P6','13');
            $sheet->setCellValue('Q6','14');
            $sheet->setCellValue('R6','15');
            $sheet->setCellValue('S6','16');
            $sheet->setCellValue('T6','17');
            $sheet->setCellValue('U6','18');
            $sheet->setCellValue('V6','19');
            $sheet->setCellValue('W6','20');
            $sheet->setCellValue('X6','21');
            $sheet->setCellValue('Y6','22');
            $sheet->setCellValue('Z6','23');
            $sheet->setCellValue('AA6','24');
            $sheet->setCellValue('AB6','25');
            $sheet->setCellValue('AC6','26');
            $sheet->setCellValue('AD6','27');
            $sheet->setCellValue('AE6','28');
            $sheet->setCellValue('AF6','29');
            $sheet->setCellValue('AG6','30');

            $lg = 'uz';
            $key = 0;
            $models = $res;
            $row = 6;
            foreach ($models as $result) {
                $sample = $result->sample;
                $row++;
                $col = 1;
                $key++;
                $soat=function($model){
                    return Soato::Full($model->soato_id);
                };
                $ml = RouteSert::findOne(['sample_id'=>$sample->id]);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $key, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $sample->suspectedDisease->vet4 . $sample->animal->type->vet4.'-'.$sample->suspectedDisease->{'name_uz'}.', '.$sample->animal->type->{'name_uz'}, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $ml->vet4.', '.\common\models\SampleTypes::findOne(['vet4'=>substr($ml->vet4,5,3)])->{'name_'.$lg}, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, '1', DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->patonomiya, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->organoleptika, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->mikroskopiya_nurli, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->mikroskopiya_lyuminesent, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->bakterilogik, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->virusologik_TE_KE, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->virusologik_XM_KK, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->biologik, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RA_KR, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RSK, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RDSK, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RBP, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RMA, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RP_RDP, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RH, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RNGA, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RGKA, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->RGA, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->IFA, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->IXLA, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->boshqa_serologiya, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->PSR, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->gistologiya, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->gemotologiya, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->koprologiya, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->kimyoviy, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->biokimyoviy, DataType::TYPE_STRING);

                $cnt = 0;
                $sum = 0;
                $n=0;
                foreach ($result->getAttributes() as $keys=>$item){
                    $n++;
                    if($n>17){
                        if($item != 0){
                            $cnt++;
                            $sum += $item;
                        }
                    }
                }
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $result->ads, DataType::TYPE_STRING);
                $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $cnt, DataType::TYPE_STRING);

            }
            $name = 'ExcelReport-' . Yii::$app->formatter->asDatetime(time(), 'php:d_m_Y_h_i_s') . '.xlsx';
            $writer = new Xlsx($speadsheet);
            $dir = Yii::getAlias('@tmp/excel');
            if (!is_dir($dir)) {
                FileHelper::createDirectory($dir, 0777);
            }
            $fileName = $dir . DIRECTORY_SEPARATOR . $name;
            $writer->save($fileName);
            return Yii::$app->response->sendFile($fileName);
        }
        return $this->render('vet4',['model'=>$model]);
    }


}
