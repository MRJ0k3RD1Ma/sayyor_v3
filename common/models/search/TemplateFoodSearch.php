<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\TemplateFood;

/**
 * TemplateFoodSearch represents the model behind the search form of `common\models\TemplateFood`.
 */
class TemplateFoodSearch extends TemplateFood
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'laboratory_test_type_id', 'type_id', 'creator_id', 'consept_id'], 'integer'],
            [['tasnif_code', 'name_uz', 'name_ru', 'unit_uz', 'unit_ru', 'min', 'min_1', 'max', 'max_1', 'ads', 'created', 'updated'], 'safe'],
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
        $query = TemplateFood::find();

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
            'laboratory_test_type_id' => $this->laboratory_test_type_id,
            'type_id' => $this->type_id,
            'creator_id' => $this->creator_id,
            'consept_id' => $this->consept_id,
            'created' => $this->created,
            'updated' => $this->updated,
        ]);

        $query->andFilterWhere(['like', 'tasnif_code', $this->tasnif_code])
            ->andFilterWhere(['like', 'name_uz', $this->name_uz])
            ->andFilterWhere(['like', 'name_ru', $this->name_ru])
            ->andFilterWhere(['like', 'unit_uz', $this->unit_uz])
            ->andFilterWhere(['like', 'unit_ru', $this->unit_ru])
            ->andFilterWhere(['like', 'min', $this->min])
            ->andFilterWhere(['like', 'min_1', $this->min_1])
            ->andFilterWhere(['like', 'max', $this->max])
            ->andFilterWhere(['like', 'max_1', $this->max_1])
            ->andFilterWhere(['like', 'ads', $this->ads]);

        return $dataProvider;
    }
}
