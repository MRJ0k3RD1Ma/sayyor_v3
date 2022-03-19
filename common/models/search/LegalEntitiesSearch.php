<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\LegalEntities;

/**
 * LegalEntitiesSearch represents the model behind the search form of `app\models\LegalEntities`.
 */
class LegalEntitiesSearch extends LegalEntities
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['inn', 'name', 'tshx', 'soogu'], 'safe'],
            [['soato', 'status_id'], 'integer'],
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
        $query = LegalEntities::find();

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
            'soato' => $this->soato,
            'status_id' => $this->status_id,
        ]);

        $query->andFilterWhere(['like', 'inn', $this->inn])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'tshx', $this->tshx])
            ->andFilterWhere(['like', 'soogu', $this->soogu]);

        return $dataProvider;
    }
}
