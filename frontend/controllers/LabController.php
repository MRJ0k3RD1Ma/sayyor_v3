<?php

namespace frontend\controllers;


use common\models\Employees;
use common\models\Regulations;
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
        $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations','template_animal_regulations.regulation_id = regulations.id')
            ->innerJoin('tamplate_animal','template_animal_regulations.template_id = tamplate_animal.id')
            ->orderBy('template_animal_regulations.regulation_id')
            ->where('tamplate_animal.id IN (SELECT result_animal_tests.id from result_animal_tests inner join tamplate_animal on result_animal_tests.template_id=tamplate_animal.id where result_animal_tests.result_id='.$result->id.')')->all();
        ;

        return $this->render('viewanimal',[
            'model'=>$model,
            'sample'=>$sample,
            'result'=>$result,
            'test'=>$test,
            'docs'=>$docs
        ]);
    }

    public function actionSendanimal($id){
        $model = RouteSert::findOne($id);
        $model->status_id = 4;
        $model->save();
        Yii::$app->session->setFlash('success',Yii::t('lab','Natijalar muvoffaqiyatli yuborildi'));
        return $this->redirect(['viewanimal','id'=>$id]);
    }

}
