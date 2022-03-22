<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "report_food".
 *
 * @property int $id
 * @property string|null $code
 * @property int|null $rep_id
 * @property int|null $type_id
 * @property int|null $cat_id
 * @property string|null $lat
 * @property string|null $long
 * @property int|null $soato_id
 * @property string|null $phone
 * @property string|null $detail
 * @property string|null $created
 * @property string|null $updated
 * @property int|null $is_true
 * @property int|null $status_id
 *
 * @property ReportFoodCategory $cat
 * @property Soato $soato
 * @property ReportStatus $status
 * @property FoodType $type
 */
class ReportFood extends \yii\db\ActiveRecord
{
    public $image;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'report_food';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['rep_id', 'type_id', 'cat_id', 'soato_id', 'is_true', 'status_id'], 'integer'],
            [['detail'], 'string'],
            ['image','each','rule'=>['string']],
            [['created', 'updated'], 'safe'],
            [['code', 'lat', 'long', 'phone'], 'string', 'max' => 255],
            [['cat_id'], 'exist', 'skipOnError' => true, 'targetClass' => ReportFoodCategory::className(), 'targetAttribute' => ['cat_id' => 'id']],
            [['soato_id'], 'exist', 'skipOnError' => true, 'targetClass' => Soato::className(), 'targetAttribute' => ['soato_id' => 'MHOBT_cod']],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => ReportStatus::className(), 'targetAttribute' => ['status_id' => 'id']],
            [['type_id'], 'exist', 'skipOnError' => true, 'targetClass' => FoodType::className(), 'targetAttribute' => ['type_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('food', 'ID'),
            'code' => Yii::t('food', 'Code'),
            'rep_id' => Yii::t('food', 'Rep ID'),
            'type_id' => Yii::t('food', 'Type ID'),
            'cat_id' => Yii::t('food', 'Cat ID'),
            'lat' => Yii::t('food', 'Lat'),
            'long' => Yii::t('food', 'Long'),
            'soato_id' => Yii::t('food', 'Soato ID'),
            'phone' => Yii::t('food', 'Phone'),
            'detail' => Yii::t('food', 'Detail'),
            'created' => Yii::t('food', 'Created'),
            'updated' => Yii::t('food', 'Updated'),
            'is_true' => Yii::t('food', 'Is True'),
            'status_id' => Yii::t('food', 'Status ID'),
        ];
    }

    /**
     * Gets query for [[Cat]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCat()
    {
        return $this->hasOne(ReportFoodCategory::className(), ['id' => 'cat_id']);
    }

    /**
     * Gets query for [[Soato]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSoato()
    {
        return $this->hasOne(Soato::className(), ['MHOBT_cod' => 'soato_id']);
    }

    /**
     * Gets query for [[Status]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(ReportStatus::className(), ['id' => 'status_id']);
    }

    /**
     * Gets query for [[Type]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getType()
    {
        return $this->hasOne(FoodType::className(), ['id' => 'type_id']);
    }
}