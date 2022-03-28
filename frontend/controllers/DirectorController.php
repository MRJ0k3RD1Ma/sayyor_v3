<?php

namespace frontend\controllers;


use app\models\search\director\DestructionSampleAnimalSearch;
use common\models\DestructionSampleAnimal;
use common\models\Employees;

use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\RouteSert;
use frontend\models\search\director\RouteSertSearch;
use kartik\mpdf\Pdf;
use Mpdf\MpdfException;
use setasign\Fpdi\PdfParser\CrossReference\CrossReferenceException;
use setasign\Fpdi\PdfParser\PdfParserException;
use setasign\Fpdi\PdfParser\Type\PdfTypeException;
use yii\base\BaseObject;
use yii\base\InvalidConfigException;
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
            ->where(['emp_posts.post_id' => 4])
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
            $dest->creator_id = $model->executor_id;
            $dest->consent_id = $model->director_id;
            $dest->sample_id = $model->sample_id;
            $num = DestructionSampleAnimal::find()->where(['org_id' => Yii::$app->user->identity->empPosts->org_id])->max('code_id');
            $num = intval($num) + 1;
            $dest->code_id = $num;
            $dest->code = get3num(Yii::$app->user->identity->empPosts->org_id) . '-' . $num;
            $dest->org_id = Yii::$app->user->identity->empPosts->org_id;
            $dest->save();
            Yii::$app->session->setFlash('success', Yii::t('leader', 'Topshiriq imzolandi'));
        }
        return $this->redirect(['indexanimal']);

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
            Yii::$app->session->setFlash('success', 'Namunani yo\'q qilish dalolatnomasi tasdiqlandi');
        } else {
            Yii::$app->session->setFlash('error', 'Tasdiqlashda xatolik');
        }
        return $this->redirect(['dest']);
    }
}
