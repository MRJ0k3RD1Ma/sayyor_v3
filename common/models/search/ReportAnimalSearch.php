<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\ReportAnimal;

/**
 * ReportAnimalSearch represents the model behind the search form of `common\models\ReportAnimal`.
 */
class ReportAnimalSearch extends ReportAnimal
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'type_id', 'cat_id', 'soato_id', 'operator_id', 'is_true', 'report_status_id', 'rep_id', 'organization_id'], 'integer'],
            [['lat', 'long', 'detail', 'phone', 'created', 'updated', 'code', 'lang'], 'safe'],
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
        $query = ReportAnimal::find();

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
            'type_id' => $this->type_id,
            'cat_id' => $this->cat_id,
            'soato_id' => $this->soato_id,
            'operator_id' => $this->operator_id,
            'is_true' => $this->is_true,
            'report_status_id' => $this->report_status_id,
            'created' => $this->created,
            'updated' => $this->updated,
            'rep_id' => $this->rep_id,
            'organization_id' => $this->organization_id,
        ]);

        $query->andFilterWhere(['like', 'lat', $this->lat])
            ->andFilterWhere(['like', 'long', $this->long])
            ->andFilterWhere(['like', 'detail', $this->detail])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'lang', $this->lang]);

        return $dataProvider;
    }
}
