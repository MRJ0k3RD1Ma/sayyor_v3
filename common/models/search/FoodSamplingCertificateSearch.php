<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\FoodSamplingCertificate;

/**
 * FoodSamplingCertificateSearch represents the model behind the search form of `common\models\FoodSamplingCertificate`.
 */
class FoodSamplingCertificateSearch extends FoodSamplingCertificate
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'food_id', 'sampling_site', 'verification_pupose_id', 'based_public_information', 'message_number'], 'integer'],
            [['code', 'inn', 'pnfl', 'sampling_adress', 'sampler_person_pnfl', 'sampler_person_inn', 'sampling_date', 'send_sample_date', 'created', 'updated'], 'safe'],
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
        $query = FoodSamplingCertificate::find();

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
            'food_id' => $this->food_id,
            'sampling_site' => $this->sampling_site,
            'verification_pupose_id' => $this->verification_pupose_id,
            'sampling_date' => $this->sampling_date,
            'send_sample_date' => $this->send_sample_date,
            'based_public_information' => $this->based_public_information,
            'message_number' => $this->message_number,
            'created' => $this->created,
            'updated' => $this->updated,
        ]);

        $query->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'inn', $this->inn])
            ->andFilterWhere(['like', 'pnfl', $this->pnfl])
            ->andFilterWhere(['like', 'sampling_adress', $this->sampling_adress])
            ->andFilterWhere(['like', 'sampler_person_pnfl', $this->sampler_person_pnfl])
            ->andFilterWhere(['like', 'sampler_person_inn', $this->sampler_person_inn]);

        return $dataProvider;
    }
}
