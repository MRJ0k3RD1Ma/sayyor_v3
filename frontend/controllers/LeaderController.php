<?php

namespace frontend\controllers;


use common\models\Employees;

use common\models\RouteSert;
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
        $model->scenario = 'exec';
        if($model->load(Yii::$app->request->post())){
            $model->status_id = 2;
            if($model->save()){
                Yii::$app->session->setFlash('success',Yii::t('leader','Topshiriq muvoffaqiyatli yuborildi'));
                return $this->redirect(['viewanimal','id'=>$id]);
            }
        }
        return $this->render('viewanimal',[
            'model'=>$model,
            'sample'=>$sample,
            'emp'=>$emp
        ]);
    }
}
