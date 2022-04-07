<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\FoodRegistration;

/**
 * FoodRegistrationSearch represents the model behind the search form of `common\models\FoodRegistration`.
 */
class FoodRegistrationSearch extends FoodRegistration
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'organization_id', 'is_research', 'code_id', 'research_category_id', 'results_conformity_id', 'emp_id', 'status_id'], 'integer'],
            [['inn', 'pnfl', 'code', 'reg_date', 'sender_name', 'sender_phone', 'created', 'updated', 'ads'], 'safe'],
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
        $query = FoodRegistration::find();

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
            'organization_id' => $this->organization_id,
            'is_research' => $this->is_research,
            'code_id' => $this->code_id,
            'research_category_id' => $this->research_category_id,
            'results_conformity_id' => $this->results_conformity_id,
            'emp_id' => $this->emp_id,
            'created' => $this->created,
            'updated' => $this->updated,
            'status_id' => $this->status_id,
        ]);

        $query->andFilterWhere(['like', 'inn', $this->inn])
            ->andFilterWhere(['like', 'pnfl', $this->pnfl])
            ->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'reg_date', $this->reg_date])
            ->andFilterWhere(['like', 'sender_name', $this->sender_name])
            ->andFilterWhere(['like', 'sender_phone', $this->sender_phone])
            ->andFilterWhere(['like', 'ads', $this->ads]);

        return $dataProvider;
    }
}
