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
 * @property int|null $sampling_soato
 * @property string|null $created
 * @property string|null $updated
 * @property string|null $explanations
 *
 * @property FoodSamples[] $foodSamples
 * @property ProductExpertise[] $productExpertises
 * @property VerificationPurposes $verificationPupose
 */
class FoodSamplingCertificate extends \yii\db\ActiveRecord
{
    public $region,$ownertype;
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
            [['food_id','ownertype', 'sampling_site','sampling_soato', 'verification_pupose_id', 'based_public_information', 'message_number'], 'integer'],
            [['sampling_date', 'send_sample_date', 'created', 'updated'], 'safe'],
            [['code', 'inn', 'pnfl', 'sampling_adress', 'sampler_person_pnfl', 'sampler_person_inn','explanations'], 'string', 'max' => 255],
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
            'code' => Yii::t('model.food_sampling_certificate', 'Raqami'),
            'food_id' => Yii::t('model.food_sampling_certificate', 'Food ID'),
            'inn' => Yii::t('model.food_sampling_certificate', 'STIR(INN)'),
            'pnfl' => Yii::t('model.food_sampling_certificate', 'JSHSHIR(PNFL)'),
            'sampling_site' => Yii::t('model.food_sampling_certificate', 'Namuna beruvchi vet uchaska'),
            'sampling_soato' => Yii::t('model.food_sampling_certificate', 'Tuman'),
            'sampling_adress' => Yii::t('model.food_sampling_certificate', 'Namuna olish manzil'),
            'sampler_person_pnfl' => Yii::t('model.food_sampling_certificate', 'JSHSHIR(PNFL)'),
            'sampler_person_inn' => Yii::t('model.food_sampling_certificate', 'STIR(PNFL)'),
            'verification_pupose_id' => Yii::t('model.food_sampling_certificate', 'Namuna holati'),
            'sampling_date' => Yii::t('model.food_sampling_certificate', 'Namuna olish sanasi'),
            'send_sample_date' => Yii::t('model.food_sampling_certificate', 'Namuna yuborilgan sana'),
            'based_public_information' => Yii::t('model.food_sampling_certificate', 'Xabar asosida tuzilgan'),
            'explanations' => Yii::t('model.food_sampling_certificate', 'Namunani yuborish sharoiti'),
            'message_number' => Yii::t('model.food_sampling_certificate', 'Xabar raqami'),
            'created' => Yii::t('model.food_sampling_certificate', 'Yaratildi'),
            'updated' => Yii::t('model.food_sampling_certificate', 'O\'zgartirildi'),
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

    public function getInn0(){
        return $this->hasOne(LegalEntities::className(),['inn'=>'inn']);
    }
    public function getPnfl0(){
        return $this->hasOne(Individuals::className(),['pnfl'=>'pnfl']);
    }
}
