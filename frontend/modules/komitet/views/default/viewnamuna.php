<?php

/* @var array $model */

/* @var \app\models\forms\AddCourseForm $modelCourse */

use yii\bootstrap4\ActiveForm;
use yii\bootstrap4\Html;

?>
<table class="table-bordered table">
    <thead>
    <tr>
        <th>#</th>
        <th>Fan</th>
        <th>Semestr</th>
        <th title='Yakuniy bahosi'>Baho</th>
        <th title='Maksimal baho'>Max</th>
        <th title='Oxirgi bajargan amali vaqti'>Oxirgi vaqt</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach ($model as $key => $item): ?>
        <tr>
            <td><?= $key + 1 ?></td>
            <td><?= $item['fullname'] ?></td>
            <td><?= MdlCourseCategories::find()->select('name')->where(['id' => $item['category']])->one()->name ?></td>
            <td><?= round($item['finalgrade'], 2) ?></td>
            <td><?= round($item['maxgrade'], 2) ?></td>
            <td><?= date('Y-m-d H:i:s', $item['timeaccess']) ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
<?php $form = ActiveForm::begin([
//    'layout' => ActiveForm::LAYOUT_HORIZONTAL,
]); ?>
<!--<div class="row">-->
<!--    <div class="col-md-8">-->
<?= $form->field($modelCourse, 'course')->label('Kurs Id')?>
<div class="form-group">
    <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
</div>
<!--    </div>-->
<!--    <div class="col-md-4">-->
<!---->
<!-- -->
<!--    </div>-->



<?php ActiveForm::end(); ?>

