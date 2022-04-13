<?php

namespace frontend\controllers;


use app\models\search\lab\DestructionSampleAnimalSearch;
use app\models\search\lab\DestructionSampleFoodSearch;
use app\models\search\laboratory\FoodRouteSearch;
use common\models\DestructionSampleAnimal;
use common\models\DestructionSampleFood;
use common\models\Employees;
<<<<<<< HEAD
use common\models\FoodRecomendation;
=======
>>>>>>> 571ae740fd137186a9761cc76793de45536d0f25
use common\models\FoodRoute;
use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\ResultFood;
use common\models\ResultFoodTests;
use common\models\RouteSert;
use common\models\SampleRecomendation;
use common\models\TamplateAnimal;
use frontend\models\search\laboratory\RouteSertSearch;
use kartik\mpdf\Pdf;
use Mpdf\MpdfException;
use setasign\Fpdi\PdfParser\CrossReference\CrossReferenceException;
use setasign\Fpdi\PdfParser\PdfParserException;
use setasign\Fpdi\PdfParser\Type\PdfTypeException;
use yii\base\BaseObject;
use yii\base\InvalidConfigException;
use yii\base\Model;
use yii\helpers\VarDumper;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use Yii;

/**
 * Site controller
 */
class LabController extends Controller
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
        return $this->redirect(['/']);
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


        return $this->render('indexanimal', ['searchModel' => $searchModel,
            'dataProvider' => $dataProvider,]);
    }

    public
    function actionViewanimal($id)
    {
        $model = RouteSert::findOne($id);
        $sample = $model->sample;

        $result = ResultAnimal::findOne(['sample_id' => $sample->id]);
        $recom = new SampleRecomendation();
        $test = ResultAnimalTests::find()->indexBy('id')->where(['result_id' => $result->id])->all();
        if($recom->load(Yii::$app->request->post())){
            $recom->sample_id = $sample->id;
            $recom->save();
            return $this->refresh();
        }
        if($result->load(Yii::$app->request->post())){
            $result->save();
        }
        if (Model::loadMultiple($test, Yii::$app->request->post())) {

            foreach ($test as $item) {
                $item->save();
            }
            Yii::$app->session->setFlash('success', Yii::t('lab', 'Natijalar muvoffaqiyatli saqlandi'));

            return $this->redirect(['viewanimal', 'id' => $id]);
        }

        $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations', 'template_animal_regulations.regulation_id = regulations.id')
            ->innerJoin('tamplate_animal', 'tamplate_animal.id=template_animal_regulations.template_id')
            ->where('tamplate_animal.id in (select result_animal_tests.template_id from result_animal_tests where result_id=' . $result->id . ')')
            ->groupBy('regulations.id')->all();

        return $this->render('viewanimal', [
            'model' => $model,
            'sample' => $sample,
            'result' => $result,
            'test' => $test,
            'docs' => $docs,
            'recom'=>$recom
        ]);
    }

    public
    function actionSendanimal($id)
    {
        $model = RouteSert::findOne($id);
        $model->status_id = 4;
        $model->save();
        Yii::$app->session->setFlash('success', Yii::t('lab', 'Natijalar muvoffaqiyatli yuborildi'));
        return $this->redirect(['viewanimal', 'id' => $id]);
    }

    public
    function actionDest(int $export = null)
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

    public
    function actionDestview($id)
    {
        $model = DestructionSampleAnimal::findOne($id);
        if ($model->load(Yii::$app->request->post())) {
            $model->state_id = 2;

            $model->destruction_date = date('Y-m-d h:i:s');
            $model->save();
            Yii::$app->session->setFlash('success', Yii::t('lab', 'Namuna yo\'q qilish dalolatnomasi tasdiqlash uchun rahbarga yuborildi'));
            return $this->redirect(['dest']);
        }
        return $this->render('destview', [
            'model' => $model
        ]);
    }

    public
    function actionIndexfood($status = -1,$export=null)
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

    public
    function actionViewfood($id)
    {
        $model = FoodRoute::findOne($id);
        $sample = $model->sample;
<<<<<<< HEAD
        $recom = new FoodRecomendation();
        if($recom->load(Yii::$app->request->post())){
            $recom->sample_id = $sample->id;
            $recom->save();
            return $this->refresh();
        }
=======

>>>>>>> 571ae740fd137186a9761cc76793de45536d0f25
        $result = ResultFood::findOne(['sample_id' => $sample->id]);

        $test = ResultFoodTests::find()->indexBy('id')->where(['result_id' => $result->id])->all();
        $result->creator_id = Yii::$app->user->id;
<<<<<<< HEAD
        if($result->load(Yii::$app->request->post())){
            $result->created = date('Y-m-d h:i:s');
            $result->save();
        }
        if (Model::loadMultiple($test, Yii::$app->request->post())) {
=======
        if (Model::loadMultiple($test, Yii::$app->request->post()) and $result->load(Yii::$app->request->post())) {
            $result->created = date('Y-m-d h:i:s');
            $result->save();
>>>>>>> 571ae740fd137186a9761cc76793de45536d0f25
            foreach ($test as $item) {
                $item->save();
            }
            Yii::$app->session->setFlash('success', Yii::t('lab', 'Natijalar muvoffaqiyatli saqlandi'));

            return $this->redirect(['viewfood', 'id' => $id]);
        }
        $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_food_regulations', 'template_food_regulations.regulation_id = regulations.id')
            ->innerJoin('template_food', 'template_food_regulations.template_id = template_food.id')
            ->orderBy('template_food_regulations.regulation_id')
            ->where('template_food.id IN (SELECT result_food_tests.id from result_food_tests inner join template_food on result_food_tests.template_id=template_food.id where result_food_tests.result_id=' . $result->id . ')')->all();;
        return $this->render('viewfood', [
            'model' => $model,
            'sample' => $sample,
            'result' => $result,
            'test' => $test,
<<<<<<< HEAD
            'docs' => $docs,
            'recom'=>$recom
=======
            'docs' => $docs
>>>>>>> 571ae740fd137186a9761cc76793de45536d0f25
        ]);
    }

    public
    function actionSendfood($id)
    {
        $model = FoodRoute::findOne($id);
        $model->status_id = 4;
        $model->save();
        Yii::$app->session->setFlash('success', Yii::t('lab', 'Natijalar muvoffaqiyatli yuborildi'));
        return $this->redirect(['viewfood', 'id' => $id]);
    }


    public
    function actionDestfood($export = null)
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

    public
    function actionDestfoodview($id)
    {
        $model = DestructionSampleFood::findOne($id);
        if ($model->load(Yii::$app->request->post())) {
            $model->state_id = 2;
            $model->destruction_date = date('Y-m-d h:i:s');
            $model->save();
            Yii::$app->session->setFlash('success', Yii::t('lab', 'Namuna yo\'q qilish dalolatnomasi tasdiqlash uchun rahbarga yuborildi'));
            return $this->redirect(['destfood']);
        }
        return $this->render('destfoodview', [
            'model' => $model
        ]);
    }

    public
    function actionDestPdf($id)
    {
        $model = DestructionSampleAnimal::findOne(['id' => $id]);
        $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
        header('Content-Disposition: attachment; name=' . $fileName);
        $file = fopen($fileName, 'r+');
        Yii::$app->response->sendFile($fileName, $model::tableName() . "_" . $model->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
    }

    public
    function actionDestPdffood($id)
    {
        $model = DestructionSampleFood::findOne(['id' => $id]);
        $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $model::tableName() . "_" . $model->id . ".pdf";
        header('Content-Disposition: attachment; name=' . $fileName);
        $file = fopen($fileName, 'r+');
        Yii::$app->response->sendFile($fileName, $model::tableName() . "_" . $model->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
    }
}
