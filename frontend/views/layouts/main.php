<?php

/* @var $this \yii\web\View */
/* @var $content string */

use frontend\assets\BackAsset;
use common\widgets\Alert;
use yii\bootstrap4\Breadcrumbs;
use yii\bootstrap4\Html;
use yii\bootstrap4\Nav;
use yii\bootstrap4\NavBar;

BackAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>"  class="h-100">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width,initial-scale=1, shrink-to-fit=no">
    <meta name="google-site-verification" content="I2QFiqr4CkG-cgQ-5_yYpIGmLOpv7TJzR0mh6tloLtU" />

    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="d-flex flex-column h-100">
<?php $this->beginBody() ?>

<style>
    body[data-sidebar-size=sm] .vertical-menu #sidebar-menu .badge{
        display: inline !important;
    }
</style>


<!-- <body data-layout="horizontal"> -->

<!-- Begin page -->
<div id="layout-wrapper">



    <?= $this->render('_header')?>

    <?= $this->render('_menu')?>


    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="main-content">

        <div class="page-content">

            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0 font-size-18"><?= $this->title?></h4>

                            <div class="page-title-right">
                                <?= Breadcrumbs::widget([
                                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                                ]) ?>
                            </div>



                        </div>
                    </div>
                </div>
                <!-- end page title -->


                <?= $content?>



            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->


        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script> ?? SAYYOR.
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-end d-none d-sm-block">
                            Design & Develop by <a class="text-decoration-underline" href="http://umdsoft.uz">UMDSOFT</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <!-- end main content-->

</div>
<!-- END layout-wrapper -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>


<?php
if(Yii::$app->session->hasFlash('error')){
    $txt = Yii::$app->session->getFlash('error');
    $xato = Yii::t('reg','Xatolik');
    $this->registerJs("
        $(document).ready(function(){
            Swal.fire({
              icon: 'error',
              title: \"{$xato}\",
              text: \"{$txt}\"
            })
        })
    ");

}
if(Yii::$app->session->hasFlash('success')){
    $txt = Yii::$app->session->getFlash('success');
    $xato = Yii::t('reg','Muvvofaqiyatli');
    $this->registerJs("
        $(document).ready(function(){
            Swal.fire({
              icon: 'success',
              title: \"{$xato}\",
              text: \"{$txt}\"
            })
        })
    ");

}

if(Yii::$app->session->hasFlash('url')){
    $txt = Yii::$app->session->getFlash('url');
   /* $this->registerJs("
       $.ajax({
          url: '{$txt}',
          context: document.body
        }).done(function() {
          var a = true;
        });
    ");*/
    $this->registerJs("
        $(document).ready(function(){
            window.location = '{$txt}';
        })
    ");
}
?>


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
