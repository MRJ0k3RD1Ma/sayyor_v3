<?php

namespace client\models\search;

use common\models\Animals;
use common\models\Sertificates;
use PhpOffice\PhpSpreadsheet\Cell\DataType;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Exception;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Yii;
use yii\base\InvalidConfigException;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use yii\db\QueryInterface;
use yii\helpers\FileHelper;

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
        }else {
            $query = Sertificates::find()->where(['pnfl' => Yii::$app->session->get('doc_pnfl')])->orWhere(['owner_pnfl' => Yii::$app->session->get('doc_pnfl')])->orderBy(['id' => SORT_DESC]);
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
    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function searchKomitet($params)
    {
        $query=Sertificates::find();

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
    /**
     * @throws \yii\base\Exception
     * @throws Exception
     * @throws InvalidConfigException
     */
    public function exportToExcel(?QueryInterface $query)
    {
        $speadsheet = new Spreadsheet();
        $sheet = $speadsheet->getActiveSheet();
        $title = "Sheet1";
        $sheet->setTitle(substr($title, 0, 31));
        $row = 1;
        $col = 1;
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "#", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Dalolatnoma", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Namuna kodlari", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Sana", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Hayvon egasi", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Vet uchastka", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Status", DataType::TYPE_STRING);
        $key = 0;
        $models = $query->all();
        foreach ($models as $item) {
            /**
             * @var Sertificates $item
             */
            $row++;
            $col = 1;
            $key++;
            $sampleout='';
            foreach (Samples::find()->where(['sert_id' => $item->id])->all() as $sample) {
                $sampleout.=$sample->status->icon." ".$sample->kod."<br>";
            }
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $key, DataType::TYPE_NUMERIC);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->sert_full, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $sampleout, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->sert_date, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, function($d){
                if ($d->owner_pnfl) {
                    return $d->owner_pnfl . '<br>' . $d->ownerPnfl->name . ' ' . $d->ownerPnfl->surname . ' ' . $d->ownerPnfl->middlename;
                } elseif ($d->owner_inn) {
                    return $d->owner_inn . '<br>' . $d->ownerInn->name;
                }else{
                    return "Hayvon egasi haqida ma'lumot kiritilmagan";
                }
            }, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->vet_site_id, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->status_id, DataType::TYPE_STRING);
        }
        $name = 'ExcelReport-' . Yii::$app->formatter->asDatetime(time(), 'php:d_m_Y_h_i_s') . '.xlsx';
        $writer = new Xlsx($speadsheet);
        $dir = Yii::getAlias('@tmp/excel');
        if (!is_dir($dir)) {
            FileHelper::createDirectory($dir, 0777);
        }
        $fileName = $dir . DIRECTORY_SEPARATOR . $name;
        $writer->save($fileName);
        return Yii::$app->response->sendFile($fileName);
    }
}
