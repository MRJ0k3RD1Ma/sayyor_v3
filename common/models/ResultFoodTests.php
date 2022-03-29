<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "result_food_tests".
 *
 * @property int $id
 * @property string|null $result
 * @property string|null $result_2
 * @property int|null $type_id
 * @property int|null $template_id
 * @property int|null $result_id
 * @property int|null $checked
 *
 * @property ResultFood $result0
 * @property TemplateFood $template
 * @property TemplateUnitType $type
 */
class ResultFoodTests extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'result_food_tests';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['type_id', 'template_id', 'result_id', 'checked'], 'integer'],
            [['result', 'result_2'], 'string', 'max' => 255],
            [['result_id'], 'exist', 'skipOnError' => true, 'targetClass' => ResultFood::className(), 'targetAttribute' => ['result_id' => 'id']],
            [['template_id'], 'exist', 'skipOnError' => true, 'targetClass' => TemplateFood::className(), 'targetAttribute' => ['template_id' => 'id']],
            [['type_id'], 'exist', 'skipOnError' => true, 'targetClass' => TemplateUnitType::className(), 'targetAttribute' => ['type_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('model', 'ID'),
            'result' => Yii::t('model', 'Natija'),
            'result_2' => Yii::t('model', 'Natija(oraliq)'),
            'type_id' => Yii::t('model', 'Turi'),
            'template_id' => Yii::t('model', 'Shablon'),
            'result_id' => Yii::t('model', 'Natija'),
            'checked' => Yii::t('model', 'Tekshirilgan'),
        ];
    }

    /**
     * Gets query for [[Result0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getResult0()
    {
        return $this->hasOne(ResultFood::className(), ['id' => 'result_id']);
    }

    /**
     * Gets query for [[Template]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTemplate()
    {
        return $this->hasOne(TemplateFood::className(), ['id' => 'template_id']);
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
