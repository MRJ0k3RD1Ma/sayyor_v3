<?php

namespace frontend\controllers;


use common\models\CompositeSamples;
use common\models\DestructionSampleAnimal;
use common\models\Employees;

use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\RouteSert;
use common\models\SampleRegistration;
use common\models\Samples;
use common\models\TemplateAnimalRegulations;
use frontend\models\search\leader\RouteSertSearch;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use Yii;

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
        if ($model->load(Yii::$app->request->post())) {
            $model->status_id = 2;
            $sam = Samples::findOne($model->sample_id);
            $sam->status_id = 4;
            $sam->save();
            $cs = CompositeSamples::findOne(['sample_id'=>$sam->id]);
            $cs->status_id = 4;
            $cs->save();
            if(CompositeSamples::find()->where(['sample_id'=>$sam->id])->count('sample_id') == CompositeSamples::find()->where(['sample_id'=>$sam->id])->andWhere(['status_id'=>4])->count('sample_id')){
                $reg = SampleRegistration::findOne(['id'=>$cs->registration_id]);
                $reg->status_id = 4;
                $reg->save();
            }
            if ($model->save()) {
                Yii::$app->session->setFlash('success', Yii::t('leader', 'Topshiriq muvoffaqiyatli yuborildi'));
                return $this->redirect(['viewanimal', 'id' => $id]);
            }
        }
        $result = ResultAnimal::findOne(['sample_id' => $sample->id]);
        $test = ResultAnimalTests::find()->indexBy('id')->where(['result_id' => $result->id])->andWhere(['checked'=>1])->all();

        $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations','template_animal_regulations.regulation_id = regulations.id')
        ->innerJoin('tamplate_animal','template_animal_regulations.template_id = tamplate_animal.id')
            ->orderBy('template_animal_regulations.regulation_id')
            ->where('tamplate_animal.id IN (SELECT result_animal_tests.id from result_animal_tests inner join tamplate_animal on result_animal_tests.template_id=tamplate_animal.id where result_animal_tests.result_id='.$result->id.')')->all();
        ;

        return $this->render('viewanimal', [
            'model' => $model,
            'sample' => $sample,
            'result' => $result,
            'emp' => $emp,
            'test' => $test,
            'docs'=>$docs
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
}
