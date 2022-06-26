<?php

namespace frontend\controllers;

use common\models\CompositeSamples;
use common\models\DistrictView;
use common\models\EmpPosts;
use common\models\FoodCompose;
use common\models\FoodRegistration;
use common\models\FoodSamples;
use common\models\Individuals;
use common\models\LegalEntities;
use common\models\QfiView;
use common\models\Regulations;
use common\models\ResultAnimal;
use common\models\ResultFood;
use common\models\SampleRegistration;
use common\models\Samples;
use common\models\VetSites;
use frontend\models\ResendVerificationEmailForm;
use frontend\models\VerifyEmailForm;
use kartik\mpdf\Pdf;
use Mpdf\MpdfException;
use PhpOffice\PhpSpreadsheet\Helper\Sample;
use setasign\Fpdi\PdfParser\CrossReference\CrossReferenceException;
use setasign\Fpdi\PdfParser\PdfParserException;
use setasign\Fpdi\PdfParser\Type\PdfTypeException;
use Yii;
use yii\base\BaseObject;
use yii\base\InvalidArgumentException;
use yii\base\InvalidConfigException;
use yii\helpers\VarDumper;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use yii\web\NotFoundHttpException;

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
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'allow' => true,
                        'actions' => ['login','viewsertfood'],
                        'roles' => ['?']
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



    public function actionViewsertfood($id)
    {

        $fileName = Yii::getAlias('@uploads') . "/../pdf/" . FoodSamples::tableName() . "_" . $id . ".pdf";
        if(!file_exists($fileName)){
            $model = FoodSamples::findOne(['id' => $id]);
            if($model->status_id == 5){
                $sample = $model;
                $regisid = FoodCompose::findOne(['sample_id'=>$id])->registration_id;
                $reg = FoodRegistration::findOne($regisid);
                $result = ResultFood::findOne(['sample_id'=>$id]);
                $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_food_regulations', 'template_food_regulations.regulation_id = regulations.id')
                    ->innerJoin('template_food', 'template_food.id=template_food_regulations.template_id')
                    ->where('template_food.id in (select result_food_tests.template_id from result_food_tests where result_food_tests.checked = 1 and result_id=' . $result->id . ')')
                    ->groupBy('regulations.id')->all();
                $pdf = new Pdf([
                    'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                    'destination' => Pdf::DEST_BROWSER,
                    'content' => $this->renderPartial('pdf-verify2', ['model' => $sample, 'regmodel' => $reg, 'docs' => $docs, 'result' => $result]),
                    'options' => [
                    ],
                    'methods' => [
                        'SetTitle' => "Tekshiruv dalolatnomasi",
                        'SetHeader' => [' ' . '|| ' . date("r")],
                        'SetFooter' => ['| {PAGENO} |'],
                        'SetAuthor' => '@QalandarDev',
                        'SetCreator' => '@QalandarDev',
                    ]
                ]);
                try {
                    $upload_dir = Yii::getAlias('@uploads');
                    $content = $pdf->render();
                    $fileName = $upload_dir . "/../pdf/" . $sample::tableName() . "_" . $sample->id . ".pdf";
                    if (file_exists($fileName)) {
                        unlink($fileName);
                    }
                    $file = fopen($fileName, 'wb+');
                    fwrite($file, $content);
                    fclose($file);
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
            header('Content-Disposition: attachment; name=' . $fileName);
            $file = fopen($fileName, 'r+');
            Yii::$app->response->sendFile($fileName, $model::tableName() . "_" . $model->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
        }else{
            header('Content-Disposition: attachment; name=' . $fileName);
            $file = fopen($fileName, 'r+');
            Yii::$app->response->sendFile($fileName, FoodSamples::tableName() . "_" . $id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
        }

    }


    public function actionViewsert($id,$type='single')
    {
        $tablename = $type=='single'?SampleRegistration::tableName() : Sample::tableName();

        $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $tablename . "_" . $id . ".pdf";
        if(file_exists($fileName)){
            header('Content-Disposition: attachment; name=' . $fileName);
            $file = fopen($fileName, 'r+');
            Yii::$app->response->sendFile($fileName, $tablename . "_" . $id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
        }else{
            $model = Samples::findOne(['id' => $id]);
            $sample = $model;
            $reg = SampleRegistration::findOne(CompositeSamples::findOne(['sample_id'=>$id])->registration_id);
            $result = ResultAnimal::findOne(['sample_id'=>$id]);
            $docs = Regulations::find()->select(['regulations.*'])->innerJoin('template_animal_regulations', 'template_animal_regulations.regulation_id = regulations.id')
                ->innerJoin('tamplate_animal', 'tamplate_animal.id=template_animal_regulations.template_id')
                ->where('tamplate_animal.id in (select result_animal_tests.template_id from result_animal_tests where result_animal_tests.checked = 1 and result_id=' . $result->id . ')')
                ->groupBy('regulations.id')->all();

            if($model->is_group == 0){

                $pdf = new Pdf([
                    'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                    'destination' => Pdf::DEST_BROWSER,
                    'content' => $this->renderPartial('pdf-verify', ['model' => $sample, 'regmodel' => $reg, 'docs' => $docs]),
                    'options' => [
                    ],
                    'methods' => [
                        'SetTitle' => "Ariza",
                        'SetHeader' => [' ' . '|| ' . date("r")],
                        'SetFooter' => ['| {PAGENO} |'],
                        'SetAuthor' => '@QalandarDev',
                        'SetCreator' => '@QalandarDev',
                    ]
                ]);

                try {

                    $upload_dir = Yii::getAlias('@uploads');
                    $content = $pdf->render();
                    $fileName = $upload_dir . "/../pdf/" . $sample::tableName() . "_" . $sample->id . ".pdf";
                    if (file_exists($fileName)) {
                        unlink($fileName);
                    }
                    $file = fopen($fileName, 'wb+');

                    fwrite($file, $content);

                    fclose($file);

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
                header('Content-Disposition: attachment; name=' . $fileName);
                $file = fopen($fileName, 'r+');
                Yii::$app->response->sendFile($fileName, $sample::tableName() . "_" . $id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();

            }
            else{


                $fileName = Yii::getAlias('@uploads') . "/../pdf/" . $reg::tableName() . "_" . $reg->id . ".pdf";
                if(!file_exists($fileName)){

                    $cnt = \common\models\Samples::find()->where(['sert_id'=>$model->sert_id])->andWhere(['<>','status_id',6])->andWhere(['is_group'=>1])->count('id');
                    $cnt_acc = \common\models\Samples::find()->where(['sert_id'=>$model->sert_id])->andWhere(['is_group'=>1])->andWhere(['<>','status_id',6])->andWhere(['status_id'=>5])->count('id');
                    // mutipleni yozish garak

                    $regis = $reg;


                    if($cnt==$cnt_acc){

                        $pdf = new Pdf([
                            'mode' => Pdf::MODE_UTF8, // leaner size using standard fonts
                            'destination' => Pdf::DEST_BROWSER,
                            'content' => $this->renderPartial('pdf-verify_multi', ['model' => $sample, 'regmodel' => $reg]),
                            'options' => [
                            ],
                            'methods' => [
                                'SetTitle' => "Ariza",
                                'SetHeader' => [' ' . '|| ' . date("r")],
                                'SetFooter' => ['| {PAGENO} |'],
                                'SetAuthor' => '@QalandarDev',
                                'SetCreator' => '@QalandarDev',
                            ]
                        ]);

                        try {

                            $upload_dir = Yii::getAlias('@uploads');
                            $content = $pdf->render();
                            $fileName = $upload_dir . "/../pdf/" . SampleRegistration::tableName() . "_" . $model->registration_id . ".pdf";
                            if (file_exists($fileName)) {
                                unlink($fileName);
                            }
                            $file = fopen($fileName, 'wb+');

                            fwrite($file, $content);

                            fclose($file);

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
                        $u = true;
                    }else{
                        $u = false;
                        Yii::$app->session->setFlash('success', Yii::t('leader', 'Namuna tekshiruv natijasi imzolandi. Namunani yo\'q qilish uchun topshiriq yuborildi. Namuna birlashgan bo`lganligi uchun tayyor emas.'));
                    }
                }
                if($u){
                    header('Content-Disposition: attachment; name=' . $fileName);
                    $file = fopen($fileName, 'r+');
                    Yii::$app->response->sendFile($fileName, SampleRegistration::tableName() . "_" . $reg->id . ".pdf", ['inline' => false, 'mimeType' => 'application/pdf'])->send();
                }else{
                    return $this->goBack();
                }
            }
        }



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

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }
        $this->layout = 'login';
        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goHome();
        }
        if ($model->errors) {
            Yii::$app->session->setFlash('error', Yii::t('client', 'Login yoki parol xato'));
            return $this->redirect(['/site/']);
        }
        $model->password = '';

        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

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
     * @return yii\web\Response
     * @throws BadRequestHttpException
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

    // send funksiya

    public function actionSend($phone, $text)
    {
        if ($phone[0] == '+') {
            $phone = substr($phone, 1, strlen($phone) - 1);
        }
        $token = json_decode($this->getToken(), true);
        $token = $token['data']['token'];
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'notify.eskiz.uz/api/message/sms/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => array('mobile_phone' => $phone, 'message' => $text, 'from' => '4546', 'callback_url' => Yii::$app->urlManager->createAbsoluteUrl(['/site/message'])),
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $token
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        echo $response;
        exit;
    }

    public function getToken()
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'notify.eskiz.uz/api/auth/login',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => array('email' => Yii::$app->params['eskiz']['email'], 'password' => Yii::$app->params['eskiz']['password']),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        return $response;
    }


    public function actionGetInd($pnfl, $doc)
    {
        if ($model = Individuals::find()->where(['pnfl' => $pnfl])->andWhere(['passport' => $doc])->one()) {
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
        } else {
            $res = get_web_page(Yii::$app->params['hamsa']['url']['getfizinfo'] . '?pinfl=' . $pnfl . '&document=' . $doc, 'hamsa');
            $model = new Individuals();
            $res = json_decode($res, true);
            if ($res['code']['result'] != 2200 or (isset($res['data']['result']) and $res['data']['result'] == 0)) {
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


    public function actionGetDistrict($id)
    {
        $model = DistrictView::find()->where(['region_id' => $id])->all();
        $text = Yii::t('cp.vetsites', '- Tumanni tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item) {
            if ($lang == 'ru') {
                $name = $item->name_ru;
            } elseif ($lang == 'oz') {
                $name = $item->name_cyr;
            } else {
                $name = $item->name_lot;
            }
            $res .= "<option value='{$item->district_id}'>{$name}</option>";
        }
        echo $res;
        exit;
    }

    public function actionGetQfi($id, $regid)
    {
        $model = QfiView::find()->where(['district_id' => $id])->andWhere(['region_id' => $regid])->all();
        $text = Yii::t('cp.vetsites', '- QFYni tanlang -');
        $res = "<option value=''>{$text}</option>";
        $lang = Yii::$app->language;
        foreach ($model as $item) {
            if ($lang == 'ru') {
                $name = $item->name_ru;
            } elseif ($lang == 'oz') {
                $name = $item->name_cyr;
            } else {
                $name = $item->name_lot;
            }
            $res .= "<option value='{$item->MHOBT_cod}'>{$name}</option>";
        }
        echo $res;
        exit;
    }

    public function actionGetinn($inn)
    {
        if ($model = LegalEntities::findOne(['inn' => $inn])) {
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
        } else {
            return -1;
        }
    }

    public function actionGetvetsites($id)
    {
        $model = VetSites::find()->where(['soato' => $id])->all();
        $text = Yii::t('cp.vetsites', '- Vet uchstkani tanlang -');
        $res = "<option value=''>{$text}</option>";
        foreach ($model as $item) {

            $res .= "<option value='{$item->id}'>{$item->name}</option>";
        }
        echo $res;
        exit;
    }
}
