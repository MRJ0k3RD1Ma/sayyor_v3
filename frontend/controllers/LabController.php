<?php

namespace frontend\controllers;


use common\models\Employees;
use common\models\RouteSert;
use common\models\TamplateAnimal;
use frontend\models\search\laboratory\RouteSertSearch;
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
        return $this->render('index');
    }

    public function actionIndexanimal($status = -1){
        $searchModel = new RouteSertSearch();
        if($status != -1){
            $searchModel->status_id = $status;
        }
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('indexanimal', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionViewanimal($id){
        $model = RouteSert::findOne($id);
        $sample = $model->sample;
        $emp = Employees::find()->select(['employees.*'])
            ->innerJoin('emp_posts','emp_posts.emp_id = employees.id')
            ->where(['emp_posts.post_id'=>2])
            ->andWhere(['emp_posts.org_id'=>Yii::$app->user->identity->empPosts->org_id])
            ->andWhere(['emp_posts.gov_id'=>Yii::$app->user->identity->empPosts->gov_id])->all();
        $d1 = new \DateTime($sample->animal->birthday);
        $d2 = new \DateTime(date('Y-m-d'));
        $interval = $d1->diff($d2);
        $diff = $interval->m+($interval->y*12);
        $template = TamplateAnimal::find()
        ->where(['type_id'=>$sample->animal->type_id])
        ->andWhere(['<=','age',$diff])
        ->andWhere(['diseases_id'=>$sample->suspected_disease_id])
        ->andWhere(['test_method_id'=>$sample->test_mehod_id])->all();



        return $this->render('viewanimal',[
            'model'=>$model,
            'sample'=>$sample,
            'emp'=>$emp,
            'template'=>$template
        ]);
    }
}
