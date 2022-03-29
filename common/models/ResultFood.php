<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "result_food".
 *
 * @property int $id
 * @property string|null $code
 * @property int|null $code_id
 * @property string|null $ads
 * @property int|null $sample_id
 * @property int|null $require_id
 * @property int|null $creator_id
 * @property int|null $consept_id
 * @property string|null $created
 * @property string|null $updated
 * @property int|null $state_id
 * @property int|null $org_id
 *
 * @property Organizations $org
 * @property Requirements $require
 * @property ResultFoodTests[] $resultFoodTests
 * @property FoodSamples $sample
 * @property StateList $state
 */
class ResultFood extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'result_food';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code_id', 'sample_id', 'require_id', 'creator_id', 'consept_id', 'state_id', 'org_id'], 'integer'],
            [['created', 'updated'], 'safe'],
            [['code', 'ads'], 'string', 'max' => 255],
            [['org_id'], 'exist', 'skipOnError' => true, 'targetClass' => Organizations::className(), 'targetAttribute' => ['org_id' => 'id']],
            [['require_id'], 'exist', 'skipOnError' => true, 'targetClass' => Requirements::className(), 'targetAttribute' => ['require_id' => 'id']],
            [['sample_id'], 'exist', 'skipOnError' => true, 'targetClass' => FoodSamples::className(), 'targetAttribute' => ['sample_id' => 'id']],
            [['state_id'], 'exist', 'skipOnError' => true, 'targetClass' => StateList::className(), 'targetAttribute' => ['state_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('model', 'ID'),
            'code' => Yii::t('model', 'Raqami'),
            'code_id' => Yii::t('model', 'Raqami'),
            'ads' => Yii::t('model', 'Izoh'),
            'sample_id' => Yii::t('model', 'Namuna'),
            'require_id' => Yii::t('model', 'Talabga muvofiqligi'),
            'creator_id' => Yii::t('model', 'Kirituvchi'),
            'consept_id' => Yii::t('model', 'Tasdiqlovchi'),
            'created' => Yii::t('model', 'Yaratilgan'),
            'updated' => Yii::t('model', 'O\'zgartirilgan'),
            'state_id' => Yii::t('model', 'Holat'),
            'org_id' => Yii::t('model', 'Tashkilot'),
        ];
    }

    /**
     * Gets query for [[Org]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrg()
    {
        return $this->hasOne(Organizations::className(), ['id' => 'org_id']);
    }

    /**
     * Gets query for [[Require]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequire()
    {
        return $this->hasOne(Requirements::className(), ['id' => 'require_id']);
    }

    /**
     * Gets query for [[ResultFoodTests]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getResultFoodTests()
    {
        return $this->hasMany(ResultFoodTests::className(), ['result_id' => 'id']);
    }

    /**
     * Gets query for [[Sample]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSample()
    {
        return $this->hasOne(FoodSamples::className(), ['id' => 'sample_id']);
    }

    /**
     * Gets query for [[State]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getState()
    {
        return $this->hasOne(StateList::className(), ['id' => 'state_id']);
    }
}
