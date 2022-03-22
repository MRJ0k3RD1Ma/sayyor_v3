<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\ReportFood;

/**
 * ReportFoodSearch represents the model behind the search form of `common\models\ReportFood`.
 */
class ReportFoodSearch extends ReportFood
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'rep_id', 'type_id', 'cat_id', 'soato_id', 'is_true', 'status_id', 'operator_id'], 'integer'],
            [['code', 'lat', 'long', 'phone', 'detail', 'created', 'updated'], 'safe'],
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
        $query = ReportFood::find();

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
            'rep_id' => $this->rep_id,
            'type_id' => $this->type_id,
            'cat_id' => $this->cat_id,
            'soato_id' => $this->soato_id,
            'created' => $this->created,
            'updated' => $this->updated,
            'is_true' => $this->is_true,
            'status_id' => $this->status_id,
            'operator_id' => $this->operator_id,
        ]);

        $query->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'lat', $this->lat])
            ->andFilterWhere(['like', 'long', $this->long])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'detail', $this->detail]);

        return $dataProvider;
    }
}
