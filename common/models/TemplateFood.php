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
 */
class TemplateFood extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'template_food';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['laboratory_test_type_id', 'type_id', 'creator_id', 'consept_id'], 'integer'],
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
            'tasnif_code' => Yii::t('app', 'Tasnif Code'),
            'laboratory_test_type_id' => Yii::t('app', 'Laboratory Test Type ID'),
            'name_uz' => Yii::t('app', 'Name Uz'),
            'name_ru' => Yii::t('app', 'Name Ru'),
            'unit_uz' => Yii::t('app', 'Unit Uz'),
            'unit_ru' => Yii::t('app', 'Unit Ru'),
            'type_id' => Yii::t('app', 'Type ID'),
            'min' => Yii::t('app', 'Min'),
            'min_1' => Yii::t('app', 'Min  1'),
            'max' => Yii::t('app', 'Max'),
            'max_1' => Yii::t('app', 'Max  1'),
            'ads' => Yii::t('app', 'Ads'),
            'creator_id' => Yii::t('app', 'Creator ID'),
            'consept_id' => Yii::t('app', 'Consept ID'),
            'created' => Yii::t('app', 'Created'),
            'updated' => Yii::t('app', 'Updated'),
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
}
