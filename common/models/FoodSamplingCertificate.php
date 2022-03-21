<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "food_sampling_certificate".
 *
 * @property int $id
 * @property string|null $code
 * @property int|null $food_id
 * @property string|null $inn
 * @property string|null $pnfl
 * @property int|null $sampling_site
 * @property string|null $sampling_adress
 * @property string|null $sampler_person_pnfl
 * @property string|null $sampler_person_inn
 * @property int|null $verification_pupose_id
 * @property string|null $sampling_date
 * @property string|null $send_sample_date
 * @property int|null $based_public_information
 * @property int|null $message_number
 * @property string|null $created
 * @property string|null $updated
 *
 * @property FoodSamples[] $foodSamples
 * @property ProductExpertise[] $productExpertises
 * @property VerificationPurposes $verificationPupose
 */
class FoodSamplingCertificate extends \yii\db\ActiveRecord
{
    public $district,$region,$soato;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'food_sampling_certificate';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['food_id', 'sampling_site', 'verification_pupose_id', 'based_public_information', 'message_number'], 'integer'],
            [['sampling_date', 'send_sample_date', 'created', 'updated'], 'safe'],
            [['code', 'inn', 'pnfl', 'sampling_adress', 'sampler_person_pnfl', 'sampler_person_inn'], 'string', 'max' => 255],
            [['verification_pupose_id'], 'exist', 'skipOnError' => true, 'targetClass' => VerificationPurposes::className(), 'targetAttribute' => ['verification_pupose_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('model.food_sampling_certificate', 'ID'),
            'code' => Yii::t('model.food_sampling_certificate', 'Code'),
            'food_id' => Yii::t('model.food_sampling_certificate', 'Food ID'),
            'inn' => Yii::t('model.food_sampling_certificate', 'Inn'),
            'pnfl' => Yii::t('model.food_sampling_certificate', 'Pnfl'),
            'sampling_site' => Yii::t('model.food_sampling_certificate', 'Sampling Site'),
            'sampling_adress' => Yii::t('model.food_sampling_certificate', 'Sampling Adress'),
            'sampler_person_pnfl' => Yii::t('model.food_sampling_certificate', 'Sampler Person Pnfl'),
            'sampler_person_inn' => Yii::t('model.food_sampling_certificate', 'Sampler Person Inn'),
            'verification_pupose_id' => Yii::t('model.food_sampling_certificate', 'Verification Pupose ID'),
            'sampling_date' => Yii::t('model.food_sampling_certificate', 'Sampling Date'),
            'send_sample_date' => Yii::t('model.food_sampling_certificate', 'Send Sample Date'),
            'based_public_information' => Yii::t('model.food_sampling_certificate', 'Based Public Information'),
            'message_number' => Yii::t('model.food_sampling_certificate', 'Message Number'),
            'created' => Yii::t('model.food_sampling_certificate', 'Created'),
            'updated' => Yii::t('model.food_sampling_certificate', 'Updated'),
        ];
    }

    /**
     * Gets query for [[FoodSamples]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFoodSamples()
    {
        return $this->hasMany(FoodSamples::className(), ['sert_id' => 'id']);
    }

    /**
     * Gets query for [[ProductExpertises]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProductExpertises()
    {
        return $this->hasMany(ProductExpertise::className(), ['food_sampling_certificate' => 'id']);
    }

    /**
     * Gets query for [[VerificationPupose]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVerificationPupose()
    {
        return $this->hasOne(VerificationPurposes::className(), ['id' => 'verification_pupose_id']);
    }
}
