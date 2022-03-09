<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Samples;

/**
 * SamplesSearch represents the model behind the search form of `app\models\Samples`.
 * @var $q
 */
class SamplesSearch extends Samples
{
    public $q;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'sample_type_is', 'sample_box_id', 'animal_id', 'sert_id'], 'integer'],
            [['kod', 'label','q'], 'safe'],
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
        $query = Samples::find();

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
            'sample_type_is' => $this->sample_type_is,
            'sample_box_id' => $this->sample_box_id,
            'animal_id' => $this->animal_id,
            'sert_id' => $this->sert_id,
        ]);

        $query->orFilterWhere(['like', 'kod', $this->q])
            ->orFilterWhere(['like', 'label', $this->q]);

        return $dataProvider;
    }
}
