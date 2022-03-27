<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "result_animal".
 *
 * @property int $id
 * @property string|null $code
 * @property int|null $code_id
 * @property int|null $temprature
 * @property int|null $humidity
 * @property string|null $reagent_name
 * @property string|null $reagent_series
 * @property string|null $conditions
 * @property string|null $end_date
 * @property string|null $ads
 * @property int|null $creator_id
 * @property int|null $consent_id
 * @property string|null $created
 * @property string|null $updated
 * @property int|null $state_id
 * @property int|null sample_id
 */
class ResultAnimal extends \yii\db\ActiveRecord
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'result_animal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code_id', 'temprature','sample_id','humidity', 'creator_id', 'consent_id', 'state_id'], 'integer'],
            [['conditions'], 'string'],
            [['created', 'updated', 'end_date', ], 'safe'],
            [['code', 'reagent_name', 'reagent_series','ads'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('model', 'ID'),
            'code' => Yii::t('model', 'Raqami'),
            'code_id' => Yii::t('model', 'Code ID'),
            'temprature' => Yii::t('model', 'Xona tempraturasi'),
            'humidity' => Yii::t('model', 'Xona namligi'),
            'reagent_name' => Yii::t('model', 'Reaktiv nomi'),
            'reagent_series' => Yii::t('model', 'Reaktiv seriyasi'),
            'conditions' => Yii::t('model', 'Boshqa sharoitlar'),
            'end_date' => Yii::t('model', 'Test tugash vaqti'),
            'ads' => Yii::t('model', 'Izoh'),
            'creator_id' => Yii::t('model', 'Labarant'),
            'consent_id' => Yii::t('model', 'Tasdiqladi'),
            'created' => Yii::t('model', 'Yaratildi'),
            'updated' => Yii::t('model', 'O\'zgartirildi'),
            'state_id' => Yii::t('model', 'Holati'),
        ];
    }
}
