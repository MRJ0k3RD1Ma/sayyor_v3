<?php

namespace app\models\search\director;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\DestructionSampleAnimal;
use Yii;
/**
 * DestructionSampleAnimalSearch represents the model behind the search form of `common\models\DestructionSampleAnimal`.
 */
class DestructionSampleAnimalSearch extends DestructionSampleAnimal
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'code_id', 'sample_id', 'creator_id', 'consent_id', 'state_id', 'org_id'], 'integer'],
            [['code', 'destruction_date', 'ads', 'created', 'updated', 'approved_date'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = DestructionSampleAnimal::find()->where(['director_id'=>Yii::$app->user->id])->andWhere(['<>','state_id',3])->orderBy(['state_id'=>SORT_DESC,'created'=>SORT_DESC]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'code_id' => $this->code_id,
            'sample_id' => $this->sample_id,
            'destruction_date' => $this->destruction_date,
            'creator_id' => $this->creator_id,
            'created' => $this->created,
            'updated' => $this->updated,
            'consent_id' => $this->consent_id,
            'approved_date' => $this->approved_date,
            'state_id' => $this->state_id,
            'org_id' => $this->org_id,
        ]);

        $query->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'ads', $this->ads]);

        return $dataProvider;
    }
}
