<?php

namespace app\modules\district;

use common\models\EmpPosts;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use Yii;

/**
 * komitet module definition class
 */
class Module extends \yii\base\Module
{
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'app\modules\district\controllers';

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action) {
                            $u = false;
                            $u = true;
                            /*foreach (EmpPosts::find()->where(['state_id'=>1])->andWhere(['emp_id'=>Yii::$app->user->id])->all() as $item){
                                if($item->post_id==5){
                                    $u = true; break;
                                }
                            }*/
                            return $u;
                        }
                    ],
                ],
            ],

        ];
    }

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();
        \Yii::$app->layoutPath = "@app/modules/district/views/layouts";

        // custom initialization code goes here
    }
}
