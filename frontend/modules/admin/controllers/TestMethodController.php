<?php

namespace app\modules\admin\controllers;

use common\models\TestMethod;
use common\models\search\TestMethodSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use Yii;
/**
 * TestMethodController implements the CRUD actions for TestMethod model.
 */
class TestMethodController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all TestMethod models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TestMethodSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single TestMethod model.
     * @param int $id ID
     * @param string $name_uz Nomi
     * @param string $name_ru Nomi
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id, $name_uz, $name_ru)
    {
        return $this->render('view', [
            'model' => $this->findModel($id, $name_uz, $name_ru),
        ]);
    }

    /**
     * Creates a new TestMethod model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new TestMethod();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id, 'name_uz' => $model->name_uz, 'name_ru' => $model->name_ru]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing TestMethod model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @param string $name_uz Nomi
     * @param string $name_ru Nomi
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id, $name_uz, $name_ru)
    {
        $model = $this->findModel($id, $name_uz, $name_ru);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id, 'name_uz' => $model->name_uz, 'name_ru' => $model->name_ru]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing TestMethod model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id ID
     * @param string $name_uz Nomi
     * @param string $name_ru Nomi
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id, $name_uz, $name_ru)
    {
        $this->findModel($id, $name_uz, $name_ru)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the TestMethod model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @param string $name_uz Nomi
     * @param string $name_ru Nomi
     * @return TestMethod the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $name_uz, $name_ru)
    {
        if (($model = TestMethod::findOne(['id' => $id, 'name_uz' => $name_uz, 'name_ru' => $name_ru])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('cp.test_method', 'The requested page does not exist.'));
    }
}
