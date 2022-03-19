<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "route_sert".
 *
 * @property int $id
 * @property int|null $sender_id
 * @property int|null $reciever_id
 * @property int|null $sample_id
 * @property string|null $deadline
 * @property string|null $ads
 * @property string|null $created
 * @property int|null $state_id
 *
 * @property Employees $reciever
 * @property Samples $sample
 * @property Employees $sender
 * @property StateList $state
 */
class RouteSert extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'route_sert';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sender_id', 'reciever_id', 'sample_id', 'state_id'], 'integer'],
            [['deadline', 'created'], 'safe'],
            [['ads'], 'string', 'max' => 500],
            [['reciever_id'], 'exist', 'skipOnError' => true, 'targetClass' => Employees::className(), 'targetAttribute' => ['reciever_id' => 'id']],
            [['sample_id'], 'exist', 'skipOnError' => true, 'targetClass' => Samples::className(), 'targetAttribute' => ['sample_id' => 'id']],
            [['sender_id'], 'exist', 'skipOnError' => true, 'targetClass' => Employees::className(), 'targetAttribute' => ['sender_id' => 'id']],
            [['state_id'], 'exist', 'skipOnError' => true, 'targetClass' => StateList::className(), 'targetAttribute' => ['state_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('route', 'ID'),
            'sender_id' => Yii::t('route', 'Sender ID'),
            'reciever_id' => Yii::t('route', 'Reciever ID'),
            'sample_id' => Yii::t('route', 'Sample ID'),
            'deadline' => Yii::t('route', 'Deadline'),
            'ads' => Yii::t('route', 'Ads'),
            'created' => Yii::t('route', 'Created'),
            'state_id' => Yii::t('route', 'State ID'),
        ];
    }

    /**
     * Gets query for [[Reciever]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getReciever()
    {
        return $this->hasOne(Employees::className(), ['id' => 'reciever_id']);
    }

    /**
     * Gets query for [[Sample]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSample()
    {
        return $this->hasOne(Samples::className(), ['id' => 'sample_id']);
    }

    /**
     * Gets query for [[Sender]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSender()
    {
        return $this->hasOne(Employees::className(), ['id' => 'sender_id']);
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
