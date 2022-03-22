<?php

namespace client\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\SampleRegistration;
use Yii;
/**
 * SampleRegistrationSearch represents the model behind the search form of `common\models\SampleRegistration`.
 */
class SampleRegistrationSearch extends SampleRegistration
{
    public $q;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'is_research', 'code_id', 'research_category_id', 'results_conformity_id', 'organization_id', 'emp_id', 'reg_id'], 'integer'],
            [['pnfl','q','inn', 'code', 'reg_date', 'sender_name', 'sender_phone', 'created', 'updated'], 'safe'],
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
        if(Yii::$app->session->getFlash('doc_type') == 'inn'){
            $query = SampleRegistration::find()->where(['inn'=>Yii::$app->session->get('doc_inn')]);
        }else{
            $query = SampleRegistration::find()->where(['pnfl'=>Yii::$app->session->get('doc_pnfl')]);
        }

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
            'is_research' => $this->is_research,
            'code_id' => $this->code_id,
            'research_category_id' => $this->research_category_id,
            'results_conformity_id' => $this->results_conformity_id,
            'organization_id' => $this->organization_id,
            'emp_id' => $this->emp_id,
            'reg_date' => $this->reg_date,
            'reg_id' => $this->reg_id,
            'created' => $this->created,
            'updated' => $this->updated,
        ]);

        $query->andFilterWhere(['like', 'pnfl', $this->pnfl])
            ->andFilterWhere(['like', 'inn', $this->inn])
            ->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'sender_name', $this->sender_name])
            ->andFilterWhere(['like', 'sender_phone', $this->sender_phone]);

        return $dataProvider;
    }
    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function searchKomitet($params)
    {
        $query=SampleRegistration::find();

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
            'is_research' => $this->is_research,
            'code_id' => $this->code_id,
            'research_category_id' => $this->research_category_id,
            'results_conformity_id' => $this->results_conformity_id,
            'organization_id' => $this->organization_id,
            'emp_id' => $this->emp_id,
            'reg_date' => $this->reg_date,
            'reg_id' => $this->reg_id,
            'created' => $this->created,
            'updated' => $this->updated,
        ]);

        $query->orFilterWhere(['like', 'pnfl', $this->q])
            ->orFilterWhere(['like', 'inn', $this->q])
            ->orFilterWhere(['like', 'code', $this->q])
            ->orFilterWhere(['like', 'sender_name', $this->q])
            ->orFilterWhere(['like', 'sender_phone', $this->q]);

        return $dataProvider;
    }
}
