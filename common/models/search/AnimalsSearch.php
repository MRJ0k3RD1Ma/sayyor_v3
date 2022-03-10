<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Animals;
use yii\helpers\VarDumper;

/**
 * AnimalsSearch represents the model behind the search form of `app\models\Animals`.
 * @var $q
 */
class AnimalsSearch extends Animals
{
    /**
     * {@inheritdoc}
     */
    public  $q;
    public function rules()
    {
        return [
            [['id', 'cat_id', 'gender', 'vet_site_id', 'type_id'], 'integer'],
            [['name', 'birthday', 'inn', 'pnfl', 'adress', 'bsual_tag','q'], 'safe'],
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
        $query = Animals::find();

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
            'cat_id' => $this->cat_id,
            'gender' => $this->gender,
            'birthday' => $this->birthday,
            'vet_site_id' => $this->vet_site_id,
            'type_id' => $this->type_id,
        ]);
//        VarDumper::dump($this->q);exit();
        $query->orFilterWhere(['like', 'name', $this->q])
            ->orFilterWhere(['like', 'inn', $this->q])
            ->orFilterWhere(['like', 'birthday', $this->q])
            ->orFilterWhere(['like', 'pnfl', $this->q])
            ->orFilterWhere(['like', 'adress', $this->q])
            ->orFilterWhere(['like', 'bsual_tag', $this->q]);

        return $dataProvider;
    }
}
