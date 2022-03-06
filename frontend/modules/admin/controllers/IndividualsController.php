<?php

namespace app\modules\admin\controllers;

use common\models\Individuals;
use common\models\search\IndividualsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use Yii;
/**
 * IndividualsController implements the CRUD actions for Individuals model.
 */
class IndividualsController extends Controller
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
     * Lists all Individuals models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new IndividualsSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Individuals model.
     * @param string $pnfl Pnfl
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Individuals model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Individuals();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', '$id' => $model->pnfl]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Individuals model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $pnfl Pnfl
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', '$id' => $model->pnfl]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Individuals model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $pnfl Pnfl
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Individuals model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $pnfl Pnfl
     * @return Individuals the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Individuals::findOne(['pnfl'=>$id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('cp.individuals', 'The requested page does not exist.'));
    }
}
