<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "food_compose".
 *
 * @property int $id
 * @property int $sample_id
 * @property int $registration_id
 * @property int|null $status_id
 * @property string|null $ads
 *
 * @property FoodRegistration $registration
 * @property FoodSamples $sample
 */
class FoodCompose extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'food_compose';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sample_id', 'registration_id'], 'required'],
            [['sample_id', 'registration_id', 'status_id'], 'integer'],
            [['ads'], 'string', 'max' => 255],
            [['registration_id'], 'exist', 'skipOnError' => true, 'targetClass' => FoodRegistration::className(), 'targetAttribute' => ['registration_id' => 'id']],
            [['sample_id'], 'exist', 'skipOnError' => true, 'targetClass' => FoodSamples::className(), 'targetAttribute' => ['sample_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('food', 'ID'),
            'sample_id' => Yii::t('food', 'Sample ID'),
            'registration_id' => Yii::t('food', 'Registration ID'),
            'status_id' => Yii::t('food', 'Status ID'),
            'ads' => Yii::t('food', 'Ads'),
        ];
    }

    /**
     * Gets query for [[Registration]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegistration()
    {
        return $this->hasOne(FoodRegistration::className(), ['id' => 'registration_id']);
    }

    /**
     * Gets query for [[Sample]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSample()
    {
        return $this->hasOne(FoodSamples::className(), ['id' => 'sample_id']);
    }
}
