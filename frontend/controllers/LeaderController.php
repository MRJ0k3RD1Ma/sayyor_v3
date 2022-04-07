<?php

namespace frontend\controllers;


use app\models\search\leader\FoodRouteSearch;
use common\models\CompositeSamples;
use common\models\DestructionSampleAnimal;
use common\models\Employees;

use common\models\FoodCompose;
use common\models\FoodRegistration;
use common\models\FoodRoute;
use common\models\FoodSamples;
use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\ResultFood;
use common\models\ResultFoodTests;
use common\models\RouteSert;
use common\models\SampleRegistration;
use common\models\Samples;
use common\models\TemplateAnimalRegulations;
use frontend\models\search\leader\RouteSertSearch;
use kartik\mpdf\Pdf;
use Mpdf\MpdfException;
use setasign\Fpdi\PdfParser\CrossReference\CrossReferenceException;
use setasign\Fpdi\PdfParser\PdfParserException;
use setasign\Fpdi\PdfParser\Type\PdfTypeException;
use yii\base\InvalidConfigException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use Yii;
use yii\web\Response;

/**
 * Site controller
 */
class LeaderController extends Controller
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
            return $searchModel->exportToExcel($dataProvider->query);
        } else if ($export == 2) {
            Yii::$app->response->format = Response::FORMAT_RAW;

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
        if ($model->load(Yii::$app->request->post())) {
            $model->status_id = 2;
            $sam = Samples::findOne($model->sample_id);
            $sam->status_id = 4;
            $sam->save();
            $cs = CompositeSamples::findOne(['sample_id' => $sam->id]);
            $reg = SampleRegistration::findOne(['id' => $cs->registration_id]);
            $reg->status_id = 4;
            $reg->save();

            if ($model->save()) {
                Yii::$app->session->setFlash('success', Yii::t('leader', 'Topshiriq muvoffaqiyatli yuborildi'));
                return $this->redirect(['viewanimal', 'id' => $id]);
            }
        }
        $result = ResultAnimal::findOne(['sample_id' => $sample->id]);
        $test = ResultAnimalTests::find()->indexBy('id')->where(['result_id' => $result->id])->andWhere(['checked' => 1])->all();

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

    public function actionDeclineanimal($id)
    {
        $model = RouteSert::findOne(['id' => $id]);
        $model->status_id = 6;
        if ($model->save()) {
            Yii::$app->session->setFlash('success', Yii::t('leader', 'Topshiriq rad etildi'));
        }
        return $this->redirect(['indexanimal']);

    }

    public function actionAcceptanimal($id)
    {
        $model = RouteSert::findOne(['id' => $id]);
        $model->status_id = 5;
        if ($model->save()) {

            Yii::$app->session->setFlash('success', Yii::t('leader', 'Topshiriq tasdiqlandi'));
        }
        return $this->redirect(['indexanimal']);

    }


    public function actionIndexfood($status = -1, int $export = null)
    {

        $searchModel = new FoodRouteSearch();
        if ($status != -1) {
            $searchModel->status_id = $status;
        }
        $dataProvider = $searchModel->search($this->request->queryParams);
        if ($export == 1) {
            return $searchModel->exportToExcel($dataProvider->query);
        } else if ($export == 2) {
            Yii::$app->response->format = Response::FORMAT_RAW;

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
        $model->status_id = 5;
        if ($model->save()) {
            Yii::$app->session->setFlash('success', Yii::t('lab', 'Natija muvoffaqiyatli tasdiqlandi. Natija rahbar tasdiqlashi uchun yuborildi.'));

        }
        return $this->redirect(['viewfood', 'id' => $id]);
    }

    public function actionDeclinefood($id)
    {
        $model = FoodRoute::findOne($id);
        $model->status_id = 6;
        if ($model->save()) {
            Yii::$app->session->setFlash('success', Yii::t('lab', 'Natija muvoffaqiyatli rad qilindi.'));
        }
        return $this->redirect(['viewfood', 'id' => $id]);
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
