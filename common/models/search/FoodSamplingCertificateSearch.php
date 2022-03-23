<?php

namespace common\models\search;

use common\models\FoodSamplingCertificate;
use PhpOffice\PhpSpreadsheet\Cell\DataType;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Exception;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use yii\base\InvalidConfigException;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use yii\db\QueryInterface;
use yii\helpers\FileHelper;

/**
 * FoodSamplingCertificateSearch represents the model behind the search form of `common\models\FoodSamplingCertificate`.
 */
class FoodSamplingCertificateSearch extends FoodSamplingCertificate
{
    public $q;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'food_id', 'sampling_site', 'verification_pupose_id', 'based_public_information', 'message_number'], 'integer'],
            [['q', 'code', 'inn', 'pnfl', 'sampling_adress', 'sampler_person_pnfl', 'sampler_person_inn', 'sampling_date', 'send_sample_date', 'created', 'updated'], 'safe'],
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

        $query->orFilterWhere(['like', 'code', $this->q])
            ->orFilterWhere(['like', 'inn', $this->q])
            ->orFilterWhere(['like', 'pnfl', $this->q])
            ->orFilterWhere(['like', 'sampling_adress', $this->q])
            ->orFilterWhere(['like', 'sampler_person_pnfl', $this->q])
            ->orFilterWhere(['like', 'sampler_person_inn', $this->q]);

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
//        $speadsheet->getDefaultStyle()->getAlignment()->setWrapText(true);
        $row = 1;
        $col = 1;
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "#", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Code", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Food ID", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "INN", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "Shoshilinch tekshiruv", DataType::TYPE_STRING);
        $sheet->setCellValueExplicitByColumnAndRow($col++, $row, "PNFL", DataType::TYPE_STRING);
        $key = 0;
        $models = $query->all();
        foreach ($models as $item) {
            /**
             * @var FoodSamplingCertificate $item
             */
            $row++;
            $col = 1;
            $key++;


            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $key, DataType::TYPE_NUMERIC);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->code, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->food_id, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->inn, DataType::TYPE_STRING);
            $sheet->setCellValueExplicitByColumnAndRow($col++, $row, $item->pnfl, DataType::TYPE_STRING);
        }
        $name = 'ExcelReport-' . \Yii::$app->formatter->asDatetime(time(), 'php:d_m_Y_h_i_s') . '.xlsx';
        $writer = new Xlsx($speadsheet);
        $dir = \Yii::getAlias('@tmp/excel');
        if (!is_dir($dir)) {
            FileHelper::createDirectory($dir, 0777);
        }
        $fileName = $dir . DIRECTORY_SEPARATOR . $name;
        $writer->save($fileName);
        return \Yii::$app->response->sendFile($fileName);
    }
}
