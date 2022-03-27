<?php

namespace frontend\controllers;


use common\models\Employees;
use common\models\ResultAnimal;
use common\models\ResultAnimalTests;
use common\models\RouteSert;
use common\models\TamplateAnimal;
use frontend\models\search\laboratory\RouteSertSearch;
use yii\base\Model;
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

        $result = ResultAnimal::findOne(['sample_id'=>$sample->id]);

        $test = ResultAnimalTests::find()->indexBy('id')->where(['result_id'=>$result->id])->all();

        if(Model::loadMultiple($test,Yii::$app->request->post()) and $result->load(Yii::$app->request->post())){
           $result->created = date('Y-m-d h:i:s');
           $result->save();
           foreach ($test as $item){
               $item->save();
           }
           Yii::$app->session->setFlash('success',Yii::t('lab','Natijalar muvoffaqiyatli saqlandi'));

           return $this->redirect(['viewanimal','id'=>$id]);
        }

        return $this->render('viewanimal',[
            'model'=>$model,
            'sample'=>$sample,
            'result'=>$result,
            'test'=>$test
        ]);
    }

    public function actionSendanimal($id){
        $model = RouteSert::findOne($id);
        $model->state_id = 4;
        $model->save();
        Yii::$app->session->setFlash('success',Yii::t('lab','Natijalar muvoffaqiyatli yuborildi'));
        return $this->redirect(['viewanimal','id'=>$id]);
    }

}
