<?php

namespace client\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Sertificates;
use Yii;
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
            [['sert_id', 'sert_num', 'sert_date', 'pnfl', 'owner_name','status_id'], 'safe'],
            [[ 'vet_site_id', ], 'integer'],
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
        if(Yii::$app->session->get('doc_type') == 'inn'){
            $query = Sertificates::find()->where(['inn'=>Yii::$app->session->get('doc_inn')])->orWhere(['owner_inn'=>Yii::$app->session->get('doc_inn')])->orderBy(['id'=>SORT_DESC]);
        }else{
            $query = Sertificates::find()->where(['inn'=>Yii::$app->session->get('doc_pnfl')])->orWhere(['owner_pnfl'=>Yii::$app->session->get('doc_pnfl')])->orderBy(['id'=>SORT_DESC]);
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
            'sert_date' => $this->sert_date,
            'vet_site_id' => $this->vet_site_id,
            'status_id' => $this->status_id,
        ]);

        $query->andFilterWhere(['like', 'sert_id', $this->sert_id])
            ->andFilterWhere(['like', 'sert_num', $this->sert_num])
            ->andFilterWhere(['like', 'pnfl', $this->pnfl]);

        return $dataProvider;
    }
}
