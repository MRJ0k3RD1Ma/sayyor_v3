<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "food_sampling_certificate".
 *
 * @property int $id
 * @property string|null $kod
 * @property string|null $pnfl
 * @property string|null $inn
 * @property int|null $organization_id
 * @property int|null $sampling_site
 * @property string|null $sampling_adress
 * @property int|null $sampler_organization_code
 * @property int|null $sampler_person_pnfl
 * @property int|null $unit_id
 * @property float|null $count
 * @property int|null $food_id
 * @property int|null $verification_sample
 * @property string|null $producer
 * @property string|null $serial_num
 * @property string|null $manufacture_date
 * @property string|null $sell_by
 * @property string|null $coments
 * @property int|null $verification_pupose_id
 * @property int|null $sample_box_id
 * @property int|null $sample_condition_id
 * @property string|null $sampling_date
 * @property string|null $send_sample_date
 * @property string|null $explanations
 * @property int|null $based_public_information
 * @property int|null $message_number
 * @property int|null $laboratory_test_type_id
 * @property int|null $ownertype
 * @property string|null $created
 *
 * @property LaboratoryTestType $laboratoryTestType
 * @property Organizations $organization
 * @property Individuals $pnfl0
 * @property SampleBoxes $sampleBox
 * @property SampleConditions $sampleCondition
 * @property Units $unit
 * @property VerificationPurposes $verificationPupose
 */
class FoodSamplingCertificate extends \yii\db\ActiveRecord
{
    public $region,$district,$soato,$ownertype;
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
            [['organization_id','ownertype', 'food_id','sampling_site', 'sampler_organization_code', 'sampler_person_pnfl', 'unit_id', 'verification_sample', 'verification_pupose_id', 'sample_box_id', 'sample_condition_id', 'based_public_information', 'message_number', 'laboratory_test_type_id'], 'integer'],
            [['count'], 'number'],
            [['manufacture_date', 'sell_by', 'sampling_date', 'send_sample_date'], 'safe'],
            [['kod', 'pnfl', 'sampling_adress', 'producer', 'serial_num','inn', 'coments', 'explanations'], 'string', 'max' => 255],
            [['laboratory_test_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => LaboratoryTestType::className(), 'targetAttribute' => ['laboratory_test_type_id' => 'id']],
            [['verification_pupose_id'], 'exist', 'skipOnError' => true, 'targetClass' => VerificationPurposes::className(), 'targetAttribute' => ['verification_pupose_id' => 'id']],
            [['organization_id'], 'exist', 'skipOnError' => true, 'targetClass' => Organizations::className(), 'targetAttribute' => ['organization_id' => 'id']],
            [['sample_box_id'], 'exist', 'skipOnError' => true, 'targetClass' => SampleBoxes::className(), 'targetAttribute' => ['sample_box_id' => 'id']],
            [['unit_id'], 'exist', 'skipOnError' => true, 'targetClass' => Units::className(), 'targetAttribute' => ['unit_id' => 'id']],
            [['sample_condition_id'], 'exist', 'skipOnError' => true, 'targetClass' => SampleConditions::className(), 'targetAttribute' => ['sample_condition_id' => 'id']],
            ['created','safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('model.food_sampling_certificate', 'ID'),
            'kod' => Yii::t('model.food_sampling_certificate', 'Kod'),
            'inn' => Yii::t('model.food_sampling_certificate', 'STIR(INN)'),
            'pnfl' => Yii::t('model.food_sampling_certificate', 'JSHSHIR(PNFL)'),
            'organization_id' => Yii::t('model.food_sampling_certificate', 'Tashkilot'),
            'sampling_site' => Yii::t('model.food_sampling_certificate', 'Namuna olish joyi'),
            'sampling_adress' => Yii::t('model.food_sampling_certificate', 'Namuna olish joyi manzili'),
            'sampler_organization_code' => Yii::t('model.food_sampling_certificate', 'Namuna oluvchi tashkilot kodi'),
            'sampler_person_pnfl' => Yii::t('model.food_sampling_certificate', 'Namuna oluvchining PNFL raqami'),
            'unit_id' => Yii::t('model.food_sampling_certificate', 'Birlik'),
            'count' => Yii::t('model.food_sampling_certificate', 'Soni'),
            'verification_sample' => Yii::t('model.food_sampling_certificate', 'Tasdiqlash namunasi'),
            'producer' => Yii::t('model.food_sampling_certificate', 'Ishlab chiqaruvchi'),
            'serial_num' => Yii::t('model.food_sampling_certificate', 'Mahsulot seriya raqami'),
            'manufacture_date' => Yii::t('model.food_sampling_certificate', 'Ishlab chiqarilgan sana'),
            'sell_by' => Yii::t('model.food_sampling_certificate', 'Yaroqlilik muddati'),
            'coments' => Yii::t('model.food_sampling_certificate', 'Qo\'shimcha ma\'lumot'),
            'verification_pupose_id' => Yii::t('model.food_sampling_certificate', 'Tekshirishdan maqsad'),
            'sample_box_id' => Yii::t('model.food_sampling_certificate', 'Namuna o\'rami'),
            'sample_condition_id' => Yii::t('model.food_sampling_certificate', 'Namuna holati'),
            'sampling_date' => Yii::t('model.food_sampling_certificate', 'Namuna olish kuni'),
            'send_sample_date' => Yii::t('model.food_sampling_certificate', 'Namuna yuborilgan sana'),
            'explanations' => Yii::t('model.food_sampling_certificate', 'Mahsulotni saqlash va yuborish shartoiti'),
            'based_public_information' => Yii::t('model.food_sampling_certificate', 'Dalolatnoma aholi xabari asosida tuzilganligi'),
            'message_number' => Yii::t('model.food_sampling_certificate', 'Xabar raqami'),
            'laboratory_test_type_id' => Yii::t('model.food_sampling_certificate', 'Laboratoriya test turi'),
            'ownertype' => Yii::t('model.food_sampling_certificate', 'Kontragent turi'),
            'region' => Yii::t('model.food_sampling_certificate', 'Viloyat'),
            'district' => Yii::t('model.food_sampling_certificate', 'Tuman'),
            'soato' => Yii::t('model.food_sampling_certificate', 'QFY'),
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
     * Gets query for [[Organization]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrganization()
    {
        return $this->hasOne(Organizations::className(), ['id' => 'organization_id']);
    }

    /**
     * Gets query for [[Pnfl0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPnfl0()
    {
        return $this->hasOne(Individuals::className(), ['pnfl' => 'pnfl']);
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
     * Gets query for [[Unit]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUnit()
    {
        return $this->hasOne(Units::className(), ['id' => 'unit_id']);
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

    public function getSamplingSite(){
        return $this->hasOne(VetSites::className(),['id'=>'sampling_site']);
    }
}
