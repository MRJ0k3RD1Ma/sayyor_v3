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
use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\ResultFood;
use common\models\ResultFoodTests;
use common\models\RouteSert;
use common\models\SampleRegistration;
use common\models\Samples;
use common\models\Sertificates;
use Exception;
use frontend\models\search\director\RouteSertSearch;
use kartik\mpdf\Pdf;
use Mpdf\MpdfException;
use setasign\Fpdi\PdfParser\CrossReference\CrossReferenceException;
use setasign\Fpdi\PdfParser\PdfParserException;
use setasign\Fpdi\PdfParser\Type\PdfTypeException;
use yii\base\BaseObject;
use yii\base\InvalidConfigException;
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

    public function actionIndexanimal($status = -1)
    {
        $searchModel = new RouteSertSearch();
        if ($status != -1) {
            $searchModel->status_id = $status;
        }
        $dataProvider = $searchModel->search($this->request->queryParams);

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
        $test = ResultAnimalTests::find()->indexBy('id')->where(['result_id' => $result->id])->all();
        return $this->render('viewanimal', [
            'model' => $model,
            'sample' => $sample,
            'result' => $result,
            'emp' => $emp,
            'test' => $test
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

            $result = ResultAnimal::findOne(['sample_id'=>$dest->sample_id]);
            $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations','template_animal_regulations.regulation_id = regulations.id')
                ->innerJoin('tamplate_animal','tamplate_animal.id=template_animal_regulations.template_id')
                ->where('tamplate_animal.id in (select result_animal_tests.template_id from result_animal_tests where result_animal_tests.checked = 1 and result_id='.$result->id.')')
                ->groupBy('regulations.id')->all();
            //->innerJoin('result_food_tests','template_food.id = result_food_tests.template_id and result_food_tests.checked=1')
            ;

            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('pdf-verify', ['model' => $sample, 'regmodel' => $reg,'docs'=>$docs]),
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
            } catch (MpdfException|CrossReferenceException|PdfTypeException|PdfParserException|InvalidConfigException $e) {
                return $e;
            }
        }
        return $this->redirect(['indexanimal']);

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

        return $this->redirect(['dest']);
    }

    public function actionDestno($id)
    {
        $model = DestructionSampleAnimal::findOne($id);
        $model->state_id = 3;
        $model->approved_date = date('Y-m-d h:i:s');
        if ($model->save()) {
            Yii::$app->session->setFlash('success', '{code} raqamli namunani yo\'q qilish dalolatnomasi rad etildi',['code'=>$model->code]);
        } else {
            Yii::$app->session->setFlash('error', 'Tasdiqlashda xatolik');
        }
        return $this->redirect(['dest']);
    }

    public function actionIndexfood($status = -1)
    {

        $searchModel = new FoodRouteSearch();
        if ($status != -1) {
            $searchModel->status_id = $status;
        }
        $dataProvider = $searchModel->search($this->request->queryParams);

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

            $result = ResultFood::findOne(['sample_id'=>$dest->sample_id]);
            $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_food_regulations','template_food_regulations.regulation_id = regulations.id')
            ->innerJoin('template_food','template_food.id=template_food_regulations.template_id')
            ->where('template_food.id in (select result_food_tests.template_id from result_food_tests where result_food_tests.checked = 1 and result_id='.$result->id.')')
                ->groupBy('regulations.id')->all();
                //->innerJoin('result_food_tests','template_food.id = result_food_tests.template_id and result_food_tests.checked=1')
            ;
            $pdf = new Pdf([
                'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                'destination' => Pdf::DEST_BROWSER,
                'content' => $this->renderPartial('pdf-verify2', ['model' => $sample, 'regmodel' => $reg,'docs'=>$docs,'result'=>$result]),
                'options' => [
                ],
                'methods' => [
                    'SetTitle' => "Tekshiruv dalolatnomas",
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
            } catch (MpdfException|CrossReferenceException|PdfTypeException|PdfParserException|InvalidConfigException $e) {
                return $e;
            }

        }

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
        return $this->redirect(['destfood']);
    }

    public function actionDestfoodno($id)
    {
        $model = DestructionSampleFood::findOne($id);
        $model->state_id = 3;
        $model->approved_date = date('Y-m-d h:i:s');
        if ($model->save()) {
            Yii::$app->session->setFlash('success', '{code} raqamli namunani yo\'q qilish dalolatnomasi rad qilindi',['code'=>$model->code]);
        } else {
            Yii::$app->session->setFlash('error', 'Tasdiqlashda xatolik');
        }
        return $this->redirect(['destfood']);
    }

    public function actionPdfAnimal($id)
    {
        $model = Samples::findOne(['id' => $id]);
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
}
