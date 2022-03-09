<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\LaboratoryTestType;

/**
 * LaboratoryTestTypeSearch represents the model behind the search form of `app\models\LaboratoryTestType`.
 * @var $q;
 */
class LaboratoryTestTypeSearch extends LaboratoryTestType
{
    public $q;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'code'], 'integer'],
            [['name_uz', 'name_ru','q'], 'safe'],
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
        $query = LaboratoryTestType::find();

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
            'code' => $this->code,
        ]);

        $query->orFilterWhere(['like', 'name_uz', $this->q])
            ->orFilterWhere(['like', 'name_ru', $this->q]);

        return $dataProvider;
    }
}
