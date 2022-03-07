<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "composite_samples".
 *
 * @property int $id
 * @property int|null $sample_id
 * @property int|null $status_id
 *
 * @property Samples $sample
 * @property SampleRegistration[] $sampleRegistrations
 */
class CompositeSamples extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'composite_samples';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sample_id', 'status_id'], 'integer'],
            [['sample_id'], 'exist', 'skipOnError' => true, 'targetClass' => Samples::className(), 'targetAttribute' => ['sample_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sample_id' => 'Sample ID',
            'status_id' => 'Status ID',
        ];
    }

    /**
     * Gets query for [[Sample]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSample()
    {
        return $this->hasOne(Samples::className(), ['id' => 'sample_id']);
    }

    /**
     * Gets query for [[SampleRegistrations]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSampleRegistrations()
    {
        return $this->hasMany(SampleRegistration::className(), ['composite_sample_id' => 'id']);
    }
}
