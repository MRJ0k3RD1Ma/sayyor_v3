<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "food_samples".
 *
 * @property int $id
 * @property string|null $samp_code Namunaning raqami toliq
 * @property int|null $samp_id namunaning raqami faqat son
 * @property int|null $sert_id namunaning food_sample_sertification idsi
 * @property string|null $tasnif_code tasnif.soliq.uz dan olinadi
 * @property int|null $unit_id birligi
 * @property int|null $count soni
 * @property int|null $sample_box_id
 * @property int|null $sample_condition_id
 * @property string|null $total_amount
 * @property int|null $verification_sample
 * @property string|null $producer
 * @property string|null $serial_num
 * @property string|null $manufacture_date
 * @property string|null $sell_by yaroqlilik muddati
 * @property string|null $coments
 * @property string|null $explanations
 * @property int|null $laboratory_test_type_id
 * @property string|null $created
 * @property string|null $updated
 *
 * @property LaboratoryTestType $laboratoryTestType
 * @property SampleBoxes $sampleBox
 * @property SampleConditions $sampleCondition
 * @property FoodSamplingCertificate $sert
 * @property Units $unit
 */
class FoodSamples extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'food_samples';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['samp_id', 'sert_id', 'unit_id', 'count', 'sample_box_id', 'sample_condition_id', 'verification_sample', 'laboratory_test_type_id'], 'integer'],
            [['manufacture_date', 'sell_by',  'created', 'updated'], 'safe'],
            [['samp_code', 'tasnif_code', 'total_amount', 'producer', 'serial_num', 'coments', 'explanations'], 'string', 'max' => 255],
            [['laboratory_test_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => LaboratoryTestType::className(), 'targetAttribute' => ['laboratory_test_type_id' => 'id']],
            [['sample_box_id'], 'exist', 'skipOnError' => true, 'targetClass' => SampleBoxes::className(), 'targetAttribute' => ['sample_box_id' => 'id']],
            [['sample_condition_id'], 'exist', 'skipOnError' => true, 'targetClass' => SampleConditions::className(), 'targetAttribute' => ['sample_condition_id' => 'id']],
            [['sert_id'], 'exist', 'skipOnError' => true, 'targetClass' => FoodSamplingCertificate::className(), 'targetAttribute' => ['sert_id' => 'id']],
            [['unit_id'], 'exist', 'skipOnError' => true, 'targetClass' => Units::className(), 'targetAttribute' => ['unit_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('food', 'ID'),
            'samp_code' => Yii::t('food', 'Raqami'),
            'samp_id' => Yii::t('food', 'raqami'),
            'sert_id' => Yii::t('food', 'Dalolatnoma'),
            'tasnif_code' => Yii::t('food', 'Namuna nomi'),
            'unit_id' => Yii::t('food', 'Birlik'),
            'count' => Yii::t('food', 'Soni'),
            'sample_box_id' => Yii::t('food', 'Namuna o\'rami'),
            'sample_condition_id' => Yii::t('food', 'Namuna holati'),
            'total_amount' => Yii::t('food', 'Toplam(partiya) miqdori'),
            'verification_sample' => Yii::t('food', 'Nazorat namunasi'),
            'producer' => Yii::t('food', 'Ishlab chiqaruvchi'),
            'serial_num' => Yii::t('food', 'Seriya raqami'),
            'manufacture_date' => Yii::t('food', 'Ishlab chiqarilgan sana'),
            'sell_by' => Yii::t('food', 'Muddati'),
            'coments' => Yii::t('food', 'Qo\'shimcha ma\'lumot'),
            'explanations' => Yii::t('food', 'Explanations'),
            'laboratory_test_type_id' => Yii::t('food', 'Laboratory Test Type ID'),
            'created' => Yii::t('food', 'Created'),
            'updated' => Yii::t('food', 'Updated'),
        ];
    }

    /**
     * Gets query for [[LaboratoryTestType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLaboratoryTestType()
    {
        return $this->hasOne(LaboratoryTestType::className(), ['id' => 'laboratory_test_type_id']);
    }

    /**
     * Gets query for [[SampleBox]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSampleBox()
    {
        return $this->hasOne(SampleBoxes::className(), ['id' => 'sample_box_id']);
    }

    /**
     * Gets query for [[SampleCondition]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSampleCondition()
    {
        return $this->hasOne(SampleConditions::className(), ['id' => 'sample_condition_id']);
    }

    /**
     * Gets query for [[Sert]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSert()
    {
        return $this->hasOne(FoodSamplingCertificate::className(), ['id' => 'sert_id']);
    }

    /**
     * Gets query for [[Unit]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUnit()
    {
        return $this->hasOne(Units::className(), ['id' => 'unit_id']);
    }
}
