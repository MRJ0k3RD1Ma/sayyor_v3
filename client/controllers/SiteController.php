<?php

namespace client\controllers;

use client\models\InnForm;
use common\models\Animals;
use common\models\DistrictView;
use common\models\Food;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\QfiView;
use common\models\Sertificates;
use common\models\VetSites;
use frontend\models\ContactForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResendVerificationEmailForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\VerifyEmailForm;
use Yii;
use yii\base\InvalidArgumentException;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\BadRequestHttpException;
use yii\web\Controller;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
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

    public function beforeAction($action)
    {
        if($action->id != 'login' and
            $action->id != 'legal' and
            $action->id != 'getind' and
            $action->id != 'get-district' and
            $action->id != 'getfood' and
            $action->id != 'get-qfi'
        ){

            if(Yii::$app->session->has('doc_type')){
                if(!Yii::$app->session->has('doc_'.Yii::$app->session->get('doc_type'))){
                    header('Location: /client/site/login');
                    exit;
                }
            }else{
                header('Location: /client/site/login');
                exit;
            }
        }
        return parent::beforeAction($action); // TODO: Change the autogenerated stub
    }

    public function actionGetfood($id){
        $model = Food::find()->where(['category_id'=>$id])->all();
        $res = "<option>-Mahsulot guruhini tanlang-</option>";
        $lg = Yii::$app->language=='ru'?'ru':'uz';
        foreach ($model as $item){
            $name = $item->{'name_'.$lg};
            $res .= "<option value='{$item->id}'>{$name}</option>";
        }
        return $res;
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

    public function actionCreate($type = null){
        if($type){
            return $this->redirect(['/site/'.$type]);
        }
        return $this->render('create');
    }

    public function actionAnimal(){
        $model = new Sertificates();
        $ind = new Individuals();




        return $this->render('animal',['model'=>$model,'ind'=>$ind]);
    }

    public function actionLegal($inn,$name){
        $this->layout = 'update';
        if($model = LegalEntities::findOne(['inn'=>$inn])){
            Yii::$app->session->set('doc_type','inn');
            Yii::$app->session->set('doc_inn',$model->inn);
            Yii::$app->session->set('doc_name',$model->name);
            return $this->redirect(['index']);
        }else{
            $model = new LegalEntities();
            $model->name = $name;
            $model->inn = $inn;
            if($model->load(Yii::$app->request->post()) ){

                if($model->save()){
                    Yii::$app->session->set('doc_type','inn');
                    Yii::$app->session->set('doc_inn',$model->inn);
                    Yii::$app->session->set('doc_name',$model->name);
                    return $this->redirect(['index']);
                }
            }
            return $this->render('legal',['model'=>$model]);
        }
    }

    public function actionIndividual(){
        $res = get_web_page(Yii::$app->params['hamsa']['url']['getfizinfo'].'?pinfl='.Yii::$app->session->get('doc_pnfl').'&document='.Yii::$app->session->get('doc_document'),'hamsa');
        $model = new Individuals();
        $res = json_decode($res,true);
        if($res['code']['result']!=2200 or (isset($res['data']['result']) and $res['data']['result']==0)){
            return $this->render('individual',[
                'model'=>$model,
            ]);
        }

        $model->passport = $res['data']['inf']['document'];
        $model->surname = $res['data']['inf']['surname_latin'];
        $model->name = $res['data']['inf']['name_latin'];
        $model->middlename = $res['data']['inf']['patronym_latin'];
        $model->pnfl = Yii::$app->session->get('doc_pnfl');

        if($model->load(Yii::$app->request->post()) ){
            if($model->save()){
                Yii::$app->session->set('doc_type','pnfl');
                Yii::$app->session->set('doc_pnfl',$model->pnfl);
                Yii::$app->session->set('doc_document',$model->passport);
                Yii::$app->session->set('doc_name',$model->name.' '.$model->surname);
                Yii::$app->session->setFlash('success',Yii::t('client','Ma\'lumotlaringiz muvoffaqiyatli saqlandi'));
                return $this->goHome();
            }else{
                Yii::$app->session->setFlash('error',Yii::t('client','Ma\'lumotlarni saqlashda xatolik'));
            }
        }

        return $this->render('individual',[
            'ind'=>$model
        ]);
    }

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        $model = new InnForm();
        $this->layout = "login";
        Yii::$app->session->remove('doc_name');
        Yii::$app->session->remove('doc_type');
        Yii::$app->session->remove('doc_inn');
        Yii::$app->session->remove('doc_pnfl');
        Yii::$app->session->remove('doc_document');
        if($model->load(Yii::$app->request->post())){
            if($model->type == 'pnfl'){
                if($in = Individuals::find()->where(['pnfl'=>$model->pnfl])->andWhere(['passport'=>$model->passport])->one()){
                    Yii::$app->session->set('doc_type','pnfl');
                    Yii::$app->session->set('doc_pnfl',$in->pnfl);
                    Yii::$app->session->set('doc_document',$in->passport);
                    Yii::$app->session->set('doc_name',$in->name.' '.$in->surname);
                }else{
                    $res = get_web_page(Yii::$app->params['hamsa']['url']['getfizinfo'].'?pinfl='.$model->pnfl.'&document='.$model->passport,'hamsa');

                    $res = json_decode($res,true);
                    if($res){
                        if($res['code']['result']!=2200 or (isset($res['data']['result']) and $res['data']['result']==0)){

                            Yii::$app->session->setFlash('error',Yii::t('client','Pasport ma\'lumotlari topilmadi'));
                            return $this->render('login',[
                                'model'=>$model,
                            ]);
                        }else{
                            Yii::$app->session->set('doc_type','pnfl');
                            Yii::$app->session->set('doc_pnfl',$model->pnfl);
                            Yii::$app->session->set('doc_document',$model->passport);
                            return $this->redirect(['individual']);
                        }
                    }else{
                        Yii::$app->session->setFlash('error',Yii::t('client','Pasport ma\'lumotlarini topishda xatolik. Qayta urinib ko`ring'));
                        return $this->render('login',[
                            'model'=>$model,
                        ]);
                    }

                }
            }

            return $this->goHome();
        }

        return $this->render('login',[
            'model'=>$model,
        ]);
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
       Yii::$app->session->remove('doc_name');
       Yii::$app->session->remove('doc_type');
       Yii::$app->session->remove('doc_inn');
       Yii::$app->session->remove('doc_pnfl');
       Yii::$app->session->remove('doc_document');
        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending your message.');
            }

            return $this->refresh();
        }

        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post()) && $model->signup()) {
            Yii::$app->session->setFlash('success', 'Thank you for registration. Please check your inbox for verification email.');
            return $this->goHome();
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            }

            Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for the provided email address.');
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidArgumentException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }

    /**
     * Verify email address
     *
     * @param string $token
     * @throws BadRequestHttpException
     * @return yii\web\Response
     */
    public function actionVerifyEmail($token)
    {
        try {
            $model = new VerifyEmailForm($token);
        } catch (InvalidArgumentException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }
        if (($user = $model->verifyEmail()) && Yii::$app->user->login($user)) {
            Yii::$app->session->setFlash('success', 'Your email has been confirmed!');
            return $this->goHome();
        }

        Yii::$app->session->setFlash('error', 'Sorry, we are unable to verify your account with provided token.');
        return $this->goHome();
    }

    /**
     * Resend verification email
     *
     * @return mixed
     */
    public function actionResendVerificationEmail()
    {
        $model = new ResendVerificationEmailForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');
                return $this->goHome();
            }
            Yii::$app->session->setFlash('error', 'Sorry, we are unable to resend verification email for the provided email address.');
        }

        return $this->render('resendVerificationEmail', [
            'model' => $model
        ]);
    }


    public function actionGetDistrict($id){
        $model = DistrictView::find()->where(['region_id'=>$id])->all();
        $text = Yii::t('cp.vetsites','- Tumanni tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item){
            if($lang == 'ru'){
                $name = $item->name_ru;
            }elseif($lang == 'oz'){
                $name = $item->name_cyr;
            }else{
                $name = $item->name_lot;
            }
            $res .= "<option value='{$item->district_id}'>{$name}</option>";
        }
        echo $res;
        exit;
    }
    public function actionGetQfi($id,$regid){
        if($regid<10){
            $regid = "0".$regid;
        }
        $model = QfiView::find()->where(['district_id'=>$id])->andWhere(['region_id'=>$regid])->all();
        $text = Yii::t('cp.vetsites','- QFYni tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item){
            if($lang == 'ru'){
                $name = $item->name_ru;
            }elseif($lang == 'oz'){
                $name = $item->name_cyr;
            }else{
                $name = $item->name_lot;
            }
            $res .= "<option value='{$item->MHOBT_cod}'>{$name}</option>";
        }
        echo $res;
        exit;
    }

    public function actionGetVet($id,$regid){
        if($regid<10){
            $regid = "0".$regid;
        }
        $model = VetSites::find()->filterWhere(['like','soato','17'.$regid.$id])->all();
//        $model = VetSites::find()->filterWhere(['like','soato',$id])->all();
        $text = Yii::t('cp.vetsites','- Vet uchastkani tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item){
            $res .= "<option value='{$item->id}'>{$item->name}</option>";
        }
        echo $res;
        exit;
    }

    public function actionGetbirka($id){
        if($model = Animals::findOne(['bsual_tag'=>$id])){
            return json_encode([
                'code'=>['result'=>'2200'],
                'data'=>[
                    'id'=>$model->id,
                    'birth'=>$model->birthday,
                    'tin'=>$model->inn,
                    'type'=>$model->type_id,
                    'sex'=>$model->gender,
                    'address'=>$model->adress,
                    'owner'=>$model->name,
                ]
            ]);
        }else{
            $data = json_decode( get_web_page(Yii::$app->params['hamsa']['url']['getanimalinfo'].'?birka='.$id,'hamsa'),true);
            $name = $data['data']['owner'];
            $inn = $data['data']['tin'];
            $res = $this->actionGetInn($inn);
            if($res != -1){
                $res = json_decode($res,true);
                $name = $res['value']['name'];
            }
            $data['data']['owner'] = $name;
            return json_encode($data);
        }
    }

    public function actionGetInd($pnfl,$doc){
        if($model = Individuals::find()->where(['pnfl'=>$pnfl])->andWhere(['passport'=>$doc])->one()){
            $res = "{
                \"code\":200,
                \"value\":{\"pnfl\":\"{$pnfl}\",
                    \"name\":\"{$model->name}\",
                    \"surname\":\"{$model->surname}\",
                    \"middlename\":\"{$model->middlename}\",
                    \"region_id\":\"{$model->soato->region_id}\",
                    \"district_id\":\"{$model->soato->district_id}\",
                    \"soato_id\":\"{$model->soato_id}\",
                    \"passport\":\"{$model->passport}\",
                    \"adress\":\"{$model->adress}\"
                }
            }";
        }else{
            $res = get_web_page(Yii::$app->params['hamsa']['url']['getfizinfo'].'?pinfl='.$pnfl.'&document='.$doc,'hamsa');
            $model = new Individuals();
            $res = json_decode($res,true);
            if($res['code']['result']!=2200 or (isset($res['data']['result']) and $res['data']['result']==0)){
                return -1;
            }

            $model->passport = $res['data']['inf']['document'];
            $model->surname = $res['data']['inf']['surname_latin'];
            $model->name = $res['data']['inf']['name_latin'];
            $model->middlename = $res['data']['inf']['patronym_latin'];
            $model->pnfl = $pnfl;
            $res = "{
                \"code\":200,
                \"value\":{\"pnfl\":\"{$pnfl}\",
                    \"name\":\"{$model->name}\",
                    \"surname\":\"{$model->surname}\",
                    \"middlename\":\"{$model->middlename}\",
                    \"region_id\":\"-1\",
                    \"district_id\":\"-1\",
                    \"soato_id\":\"-1\",
                    \"passport\":\"{$model->passport}\",
                    \"adress\":\"{$model->adress}\"
                }
            }";
        }
        echo $res;
        exit;
    }

    public function actionGetInn($inn){
        if($model = LegalEntities::findOne(['inn'=>$inn])){
            $res = "{
                \"code\":200,
                \"value\":{\"inn\":\"{$inn}\",
                    \"name\":\"{$model->name}\",
                    \"region\":\"{$model->soato->region_id}\",
                    \"district\":\"{$model->soato->district_id}\",
                    \"soato_id\":\"{$model->soato_id}\",
                    \"tshx_id\":\"{$model->tshx_id}\",
                    \"soogu\":\"{$model->soogu}\"
                }
            }";
            return $res;
        }else{
            return -1;
        }
    }
    }
