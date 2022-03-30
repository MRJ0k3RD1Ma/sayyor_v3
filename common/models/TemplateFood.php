<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "template_food".
 *
 * @property int $id
 * @property string|null $tasnif_code
 * @property int|null $laboratory_test_type_id
 * @property string|null $name_uz
 * @property string|null $name_ru
 * @property string|null $unit_uz
 * @property string|null $unit_ru
 * @property int|null $type_id
 * @property string|null $min
 * @property string|null $min_1
 * @property string|null $max
 * @property string|null $max_1
 * @property string|null $ads
 * @property int|null $creator_id
 * @property int|null $consept_id
 * @property string|null $created
 * @property string|null $updated
 *
 * @property LaboratoryTestType $laboratoryTestType
 * @property TemplateUnitType $type
 * @property TemplateFoodRegulations $TemplateFoodRegulations
 */
class TemplateFood extends \yii\db\ActiveRecord
{
    public $true,$true1;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'template_food';
    }

    public $regulations;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['laboratory_test_type_id', 'type_id', 'creator_id', 'consept_id','true','true1'], 'integer'],
            [['created', 'updated'], 'safe'],
            [['tasnif_code', 'name_uz', 'name_ru', 'unit_uz', 'unit_ru', 'min', 'min_1', 'max', 'max_1', 'ads'], 'string', 'max' => 255],
            [['laboratory_test_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => LaboratoryTestType::className(), 'targetAttribute' => ['laboratory_test_type_id' => 'id']],
            [['type_id'], 'exist', 'skipOnError' => true, 'targetClass' => TemplateUnitType::className(), 'targetAttribute' => ['type_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'tasnif_code' => Yii::t('app', 'Tasnif Kod'),
            'laboratory_test_type_id' => Yii::t('app', 'Laboratoriya test turi'),
            'name_uz' => Yii::t('app', 'Parametr(uz)'),
            'name_ru' => Yii::t('app', 'Paramentr(ru)'),
            'unit_uz' => Yii::t('app', 'Birlik(uz)'),
            'unit_ru' => Yii::t('app', 'Birlik(ru)'),
            'type_id' => Yii::t('app', 'Birlik turi'),
            'min' => Yii::t('app', 'Minimal'),
            'min_1' => Yii::t('app', 'Minimal 2(oraliq)'),
            'max' => Yii::t('app', 'Maksimal'),
            'max_1' => Yii::t('app', 'Maksimal 2(oraliq)'),
            'ads' => Yii::t('app', 'Izoh'),
            'creator_id' => Yii::t('app', 'Kirituvchi'),
            'consept_id' => Yii::t('app', 'Tasdiqlovchi'),
            'created' => Yii::t('app', 'Yaratildi'),
            'updated' => Yii::t('app', 'O\'zgartirildi'),
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
     * Gets query for [[Type]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getType()
    {
        return $this->hasOne(TemplateUnitType::className(), ['id' => 'type_id']);
    }

    public function getRegulations()
    {
        return $this->hasMany(Regulations::class, ['id' => 'regulation_id'])->viaTable('template_food_regulations', ['template_id' => 'id']);
    }

    public function getTemplateFoodRegulations()
    {
        return $this->hasMany(TemplateFoodRegulations::class, ['template_id' => 'id']);
    }
}
