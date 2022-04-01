<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;

/**
 * This is the model class for table "tamplate_animal".
 *
 * @property int $id
 * @property int|null $type_id
 * @property int|null $gender
 * @property int|null $age Yoshi oyda ko'rsatiladi
 * @property int|null $diseases_id
 * @property int|null $test_method_id
 * @property string|null $name_uz
 * @property string|null $name_ru
 * @property int|null $unit_id
 * @property string|null $min
 * @property string|null $min_1
 * @property string|null $max
 * @property string|null $max_1
 * @property int|null $is_vaccination
 * @property int|null $dead_days
 * @property int|null $creator_id
 * @property int|null $consent_id
 * @property string|null $created
 * @property string|null $updated
 * @property int|null $state_id
 *
 * @property Diseases $diseases
 * @property Regulations[] $regulations
 * @property StateList $state
 * @property TemplateAnimalRegulations[] $templateAnimalRegulations
 * @property TestMethod $testMethod
 * @property Animaltype $type
 * @property TemplateUnit $unit
 */
class TamplateAnimal extends \yii\db\ActiveRecord
{
    public $true,$true1;
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::class,
                'createdAtAttribute' => 'created',
                'updatedAtAttribute' => 'updated',
                'value' => new Expression('NOW()'),
            ],
        ];
    }
    public $regulations;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tamplate_animal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['type_id', 'gender','true','true1', 'age', 'diseases_id', 'test_method_id', 'unit_id', 'is_vaccination', 'dead_days', 'creator_id', 'consent_id', 'state_id'], 'integer'],
            [['created', 'updated'], 'safe'],
            [['name_uz', 'name_ru', 'min', 'min_1', 'max', 'max_1'], 'string', 'max' => 255],
            [['vet4'],'string','max'=>8],
            [['vet4'],'required'],
            [['diseases_id'], 'exist', 'skipOnError' => true, 'targetClass' => Diseases::className(), 'targetAttribute' => ['diseases_id' => 'id']],
            [['state_id'], 'exist', 'skipOnError' => true, 'targetClass' => StateList::className(), 'targetAttribute' => ['state_id' => 'id']],
            [['test_method_id'], 'exist', 'skipOnError' => true, 'targetClass' => TestMethod::className(), 'targetAttribute' => ['test_method_id' => 'id']],
            [['type_id'], 'exist', 'skipOnError' => true, 'targetClass' => Animaltype::className(), 'targetAttribute' => ['type_id' => 'id']],
            [['unit_id'], 'exist', 'skipOnError' => true, 'targetClass' => TemplateUnit::className(), 'targetAttribute' => ['unit_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'type_id' => Yii::t('app', 'Hayvon turi'),
            'gender' => Yii::t('app', 'Jinsi'),
            'age' => Yii::t('app', 'Yoshi(oy)'),
            'diseases_id' => Yii::t('app', 'Kasallik turi'),
            'test_method_id' => Yii::t('app', 'Test turi'),
            'name_uz' => Yii::t('app', 'Parametr(UZ)'),
            'name_ru' => Yii::t('app', 'Parametr(RU)'),
            'unit_id' => Yii::t('app', 'Birlik'),
            'min' => Yii::t('app', 'Minimal'),
            'min_1' => Yii::t('app', 'Minimal (Oraliq uchun)'),
            'max' => Yii::t('app', 'Maksimal'),
            'max_1' => Yii::t('app', 'Maksimal(Oraliq uchun)'),
            'is_vaccination' => Yii::t('app', 'Emlanganlik'),
            'dead_days' => Yii::t('app', 'Vaksina tasiri(KUN, -1 cheklanmagan) '),
            'creator_id' => Yii::t('app', 'Kiritdi'),
            'consent_id' => Yii::t('app', 'Tasdiqladi'),
            'created' => Yii::t('app', 'Yaratildi'),
            'updated' => Yii::t('app', 'O\'zgartirildi'),
            'state_id' => Yii::t('app', 'Holati'),
            'true' => Yii::t('app', 'Minimal'),
            'true1' => Yii::t('app', 'Maksimal'),
        ];
    }

    /**
     * Gets query for [[Diseases]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDiseases()
    {
        return $this->hasOne(Diseases::className(), ['id' => 'diseases_id']);
    }

    /**
     * Gets query for [[Regulations]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegulations()
    {
        return $this->hasMany(Regulations::className(), ['id' => 'regulation_id'])->viaTable('template_animal_regulations', ['template_id' => 'id']);
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

    /**
     * Gets query for [[TemplateAnimalRegulations]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTemplateAnimalRegulations()
    {
        return $this->hasMany(TemplateAnimalRegulations::className(), ['template_id' => 'id']);
    }

    /**
     * Gets query for [[TestMethod]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTestMethod()
    {
        return $this->hasOne(TestMethod::className(), ['id' => 'test_method_id']);
    }

    /**
     * Gets query for [[Type]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getType()
    {
        return $this->hasOne(Animaltype::className(), ['id' => 'type_id']);
    }

    /**
     * Gets query for [[Unit]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUnit()
    {
        return $this->hasOne(TemplateUnit::className(), ['id' => 'unit_id']);
    }
}
