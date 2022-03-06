<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Sertificates;

/**
 * SertificatesSearch represents the model behind the search form of `app\models\Sertificates`.
 */
class SertificatesSearch extends Sertificates
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sert_id', 'sert_num', 'sert_date', 'pnfl', 'owner_name'], 'safe'],
            [['organization_id', 'vet_site_id', 'operator'], 'integer'],
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
        $query = Sertificates::find();

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
            'sert_date' => $this->sert_date,
            'organization_id' => $this->organization_id,
            'vet_site_id' => $this->vet_site_id,
            'operator' => $this->operator,
        ]);

        $query->andFilterWhere(['like', 'sert_id', $this->sert_id])
            ->andFilterWhere(['like', 'sert_num', $this->sert_num])
            ->andFilterWhere(['like', 'pnfl', $this->pnfl])
            ->andFilterWhere(['like', 'owner_name', $this->owner_name]);

        return $dataProvider;
    }
}
