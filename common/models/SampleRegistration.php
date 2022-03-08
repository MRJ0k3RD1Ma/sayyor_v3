<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sample_registration".
 *
 * @property int $id
 * @property string|null $pnfl
 * @property string|null $inn
 * @property int|null $is_research Текшириладими, йўқми?
 * @property string|null $code
 * @property int|null $research_category_id Пуллк, текин
 * @property int|null $results_conformity_id НД соответствия результатов требованиям
 * @property int|null $organization_id
 * @property int|null $emp_id
 * @property string|null $reg_date
 * @property int|null $disease_id
 * @property int|null $composite_sample_id
 * @property int|null $reg_id
 *
 * @property CompositeSamples $compositeSample
 * @property Organizations $organization
 * @property ResearchCategory $researchCategory
 */
class SampleRegistration extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'sample_registration';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['is_research','reg_id', 'research_category_id', 'results_conformity_id', 'organization_id', 'emp_id', 'disease_id', 'composite_sample_id'], 'integer'],
            [['reg_date'], 'safe'],
            [['pnfl', 'inn', 'code'], 'string', 'max' => 255],
            [['composite_sample_id'], 'exist', 'skipOnError' => true, 'targetClass' => CompositeSamples::className(), 'targetAttribute' => ['composite_sample_id' => 'id']],
            [['organization_id'], 'exist', 'skipOnError' => true, 'targetClass' => Organizations::className(), 'targetAttribute' => ['organization_id' => 'id']],
            [['research_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => ResearchCategory::className(), 'targetAttribute' => ['research_category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('model', 'ID'),
            'pnfl' => Yii::t('model', 'JSHSHIR(PNFL)'),
            'inn' => Yii::t('model', 'STIR(INN)'),
            'is_research' => Yii::t('model', 'Tekshiradimi?'),
            'code' => Yii::t('model', 'Kod'),
            'research_category_id' => Yii::t('model', 'Tekshiruv turi'),
            'results_conformity_id' => Yii::t('model', 'Talablarning natijaga muvofiqligi'),
            'organization_id' => Yii::t('model', 'Tekshiruvchi tashkilot'),
            'emp_id' => Yii::t('model', 'Registrator'),
            'reg_date' => Yii::t('model', 'Ro\'yhatga olingan sana'),
            'disease_id' => Yii::t('model', 'Kasallik turi'),
            'composite_sample_id' => Yii::t('model', 'Composite Sample ID'),
        ];
    }

    /**
     * Gets query for [[CompositeSample]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCompositeSample()
    {
        return $this->hasOne(CompositeSamples::className(), ['id' => 'composite_sample_id']);
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
     * Gets query for [[ResearchCategory]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getResearchCategory()
    {
        return $this->hasOne(ResearchCategory::className(), ['id' => 'research_category_id']);
    }
}
