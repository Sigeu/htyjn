<?php
// +----------------------------------------------------------------------
// | Ht.Memorial
// +----------------------------------------------------------------------
// | Copyright (c) 2017-2017 http://www.yn123.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: andy <290648237@qq.com>
// +----------------------------------------------------------------------

namespace app\api\controller;

use app\api\model\PictureModel;
use app\api\validate\BaseValidate;
use axios\tpr\core\Api;
use think\Db;
use think\Image;

require ROOT_PATH.'/vendorQueryList/autoload.php';

use QL\QueryList;

set_time_limit(0);

/**
 * 工具类
 * Class Tools
 * @package app\api\controller
 * @author andy <290648237@qq.com>
 * @date 2017/05/27
 */
class Tools extends Api
{
    /**
     *
     * @desc andy-采集怀恩祭祀商品信息 存入数据库表
     * @method post
     * @parameter int huaien_root_pid 怀恩一级分类id_如：行礼、供品、火供、法事等（必须）
     * @parameter int ynjn_root_pid 云纪念一级分类父id_如：行礼、供品、火供、法事等（必须）
     * @parameter string url 请求URL地址_如：http://a.jinian.huaien.com:9001/jinian/jnGetMaterialList.do（必须）
     * @parameter string password 执行密码（必须）
     * @response
     */
    public function cjMaterial()
    {

        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['huaien_root_pid', 'ynjn_root_pid', 'url', 'password'])->MustBePostiveInt(['huaien_root_pid', 'ynjn_root_pid']);

        $huaienRootCid = $this->param['huaien_root_pid'];  // 怀恩一级分类id 如：行礼、供品、火供、法事 30-11 50-12 60-13 70-14
        $ynjnRootCid = $this->param['ynjn_root_pid']; // 二级分类父id 如：点烛、花圈等
        $url = $this->param['url']; // 'http://a.jinian.huaien.com:9001/jinian/jnGetMaterialList.do'; // 请求url
        $password = $this->param['password'];

        if($password != 'zhangs0919') {
            $this->wrong(0, '执行密码错误，拒绝执行！');
        }

        $params = [
            'materialTypeApp' => $huaienRootCid
        ];

        $postData = [
            'params' => json_encode($params)
        ];

        $data = request_post($url, $postData);
        // 如果请求返回的数据为false 则终止后面的代码执行
        if(!$data){
            $this->response(null, 0, '请求数据不存在！');
        }

        $data = json_decode($data);
        $data = $data->data;
        if(empty($data)){
            $this->response(null, 0, '返回数据为空！');
        }

        foreach($data as $value) {
            if($value->dataType == 1) {
                // 如果dataType = 1 则是分类 将其加入到祭祀分类表
                if(!Db::name('mall_goods_category')->find(['id' => $value->materialTypeChildApp])){
                    $cateData = [
                        'id' => $value->materialTypeChildApp,
                        'pid' => $ynjnRootCid,
                        'name' => $value->materialName,
                        'create_at' => time()
                    ];
                    Db::name('mall_goods_category')->insert($cateData);
                }
            }else {
                // 如果dateType != 1 则是祭祀商品 将其加入到祭祀商品表
                $id = $value->materialID + 100;
                if(!Db::name('mall_goods')->find(['id' => $id])){

                    $savePath = '/static/upload/goods';
                    $imageFilename = explode('/', $value->guangPath);

                    $image = get_image($value->guangPath, $savePath, end($imageFilename));

                    $menuUrlFilename = explode('/', $value->menuUrl);
                    $menuUrl = get_image($value->menuUrl, $savePath, end($menuUrlFilename));

                    // 动画ID
                    if($value->materialTypeChildApp == '3001') {
                        $btnID = 'x_'.$value->materialTypeChildApp;
                    }elseif ($value->materialTypeChildApp == '3002') {
                        $btnID = 'lz_'.$value->materialTypeChildApp;
                    }else {
                        $btnID = '';
                    }

                    $goodsData = [
                        'id' => $id,
                        'cid' => $value->materialTypeChildApp,
                        'btn_id' => $btnID,
                        'name' => $value->materialName,
                        'summary' => $value->shouMing,
                        'price' => $value->qianChengB,
                        'user_integral' => $value->userIntegral,
                        'memorial_integral' => $value->memorialIntegral,
                        'duration' => $value->materialTime,
                        'image' => $image['save_path'],
                        'menu_url' => $menuUrl['save_path'],
                        'create_by' => 10000,
                        'create_at' => time()
                    ];

                    Db::name('mall_goods')->insert($goodsData);
                }

            }
        }
        $this->response($data);
    }

    /**
     *
     * @desc andy-采集天堂6文章 存入document 表
     * @parameter int t_cid 天堂6分类ID（必须）
     * @parameter int cid 保存到数据库的分类ID（必须）
     * @parameter string password 执行密码（必须）
     *
     * @method post
     * @response
     */
    public function cjArticle()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['t_cid', 'cid', 'password'])->MustBePostiveInt(['cid']);

        $tCid = $this->param['t_cid'];
        $cid = $this->param['cid'];
        $password = $this->param['password'];

        if($password != 'zhangs0919') {
            $this->wrong(0, '执行密码错误，拒绝执行！');
        }

        $baseUrl = 'http://www.tiantang6.com';
        $cjUrl = $baseUrl.'/culture/';
        $dataList = QueryList::Query($cjUrl.$tCid.'.html',[
            'url' => ['ul.newslist li p a', 'href'],
            'cover' => ['ul.newslist li p a img', 'src']
        ])->data;

        foreach($dataList as $item) {
            $articleUrl = $cjUrl.$item['url'];

            // 采集文章内容
            $data = QueryList::Query($articleUrl, [
                'title' => ['.articleTitle h1', 'text'],
                'content' => ['.articleCon', 'text'],
                'image' => ['.articleCon img', 'src'],
                'create_at' => ['.articleTitle p', 'text'],
            ], '', 'utf-8', 'gb2312')->data;

            if(!empty($data)){
                if (isset($item['cover'])) {
                    $image = 'http://www.tiantang6.com/'.str_replace('..//', '/', $item['cover']);
                } elseif (isset($data[0]['image'])) {
                    $image = $baseUrl.$data[0]['image'];
                } else {
                    $image = '';
                }

                if(isset($data[0]['content'])){
                    $content = str_replace(array("\r\n", "\r", "\n", " ", "&#160;"), '', $data[0]['content']);
                }else {
                    $content = '';
                }

                // 将远程图片保存到本地数据库
                $savePath = './static/upload/picture/'.date('Ymd').'/';
                // 创建目录
                if(!is_dir('./'.$savePath)) {
                    @mkdir('./'.$savePath, 0777);
                }
                $path = $savePath.md5(microtime(true)).'.jpg';
                $saveName = curl_get_img($image,$path); // 保存图片到本地


                // 保存到document表
                $documentData = [
                    'category_id' => $cid,
                    'title' => $data[0]['title'],
                    'description' => msubstr($content,0,100, false),
                    'image' => $saveName,
                    'create_at' => strtotime(substr($data[0]['create_at'],-9)),
                    'status' => 1
                ];

                $doc_id = db('document')->insert($documentData, false, true);

                // 保存到document_article表
                $documentArticleData = [
                    'doc_id' => (int)$doc_id,
                    'content' => $content
                ];
                db('document_article')->insert($documentArticleData);

            }

        }


    }

    /**
     *
     * @desc andy-采集怀恩纪念馆皮肤
     * @parameter int skin_hall_type 皮肤纪念馆类型（可选默认“guan”__名人馆/个人馆：“guan”__双人馆/家族馆：“yuan”）
     * @parameter int skin_type 皮肤类型（可选默认“putong”__个人馆/双人馆/家族馆：“putong”__事件馆/主题馆/名人馆：“gexing”）
     * @parameter int skin_id 皮肤ID（可选默认“0”）
     * @parameter int skin_start_id 批量采集皮肤开始位置ID（可选默认“1”）
     * @parameter int skin_num 批量采集皮肤数量（可选默认“10”）
     * @parameter string password 执行密码（必须）
     *
     * @method post
     * @response
     */
    public function cjSkin()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['password']);

        $password = $this->param['password'];

        if($password != 'zhangs0919') {
            $this->wrong(0, '执行密码错误，拒绝执行！');
        }

        $skinHallType = isset($this->param['skin_hall_type']) && $this->param['skin_hall_type'] != '' ? $this->param['skin_hall_type'] : 'guan';
        $skinType = isset($this->param['skin_type']) && $this->param['skin_type'] != '' ? $this->param['skin_type'] : 'putong';
        $skinNum = isset($this->param['skin_num']) && $this->param['skin_num'] != '' ? $this->param['skin_num'] : 10;
        $skinId = isset($this->param['skin_id']) && $this->param['skin_id'] != '' ? $this->param['skin_id'] : 0;
        $skinStartId = isset($this->param['skin_start_id']) && $this->param['skin_start_id'] != '' ? $this->param['skin_start_id'] : 1;
        // TODO 需确定哪个地址有用
        // $skinRootPath = 'http://res1.huaien.com/skin/'; // PC
        $skinRootPath = 'http://img2.huaien.com/jinian/skin/'; // APP

        // 限制输入皮肤数量为<=50
        if ($skinNum > 50) {
            $this->wrong(0, "皮肤数量最大为：50，你输入的数量为：". $skinNum.'，请重新输入皮肤数量！');
        }

        if ($skinId) {
            // 采集单个
            $validate->checkParamNotNull(['skin_id'])->MustBePostiveInt(['skin_id']); // 验证skin_id
            $resImgUrl = $this->_cjSkin($skinRootPath, $skinHallType, $skinType, $skinId);
        }else {
            // 批量采集
            $resImgUrl = [];
            for ($i = $skinStartId; $i < ($skinStartId + $skinNum); $i++) {
                $resImgUrl[] = $this->_cjSkin($skinRootPath, $skinHallType, $skinType, $i);
            }
        }

        $this->response($resImgUrl);
    }

    private function _cjSkin($skinRootPath, $skinHallType, $skinType, $skinId)
    {
        $staticPath = $skinRootPath.$skinHallType.'/'.$skinType.'/'.$skinId.'/';
        $cssUrl = $staticPath.'css.css';

        // 检查远程文件是否存在
        if (!check_remote_file_exists($cssUrl)) {
            $resImgUrl['css'] = "<b style='color: red;'>远程文件不存在：".$cssUrl."</b>";
            $resImgUrl['images'] = [];
            $resImgUrl['origin_images'] = [];
        }else {
            $content = file_get_contents($cssUrl);

            // 将远程css文件及images保持到本地文件夹
            $skinDir = './static/home/hall_skins/'; // 皮肤存放路径

            // 创建目录
            if(!is_dir($skinDir)) {
                @mkdir($skinDir, 0777);
            }
            if(!is_dir($skinDir.$skinHallType.'/')) {
                @mkdir($skinDir.$skinHallType.'/', 0777);
            }
            if(!is_dir($skinDir.$skinHallType.'/'.$skinType.'/')) {
                @mkdir($skinDir.$skinHallType.'/'.$skinType.'/', 0777);
            }

            $savePath = $skinDir.$skinHallType.'/'.$skinType.'/'.$skinId.'/';
            // 将css文件保存到本地
            $resImgUrl['css'] = download_file($cssUrl, $savePath);

            // TODO 需要采集下此图片
            if (check_remote_file_exists($staticPath.'jpg.jpg')) {
                $resImgUrl['app_thumb_img'] = download_file($staticPath.'jpg.jpg', $savePath); // App 端纪念馆风格缩略图
            }
            if (check_remote_file_exists($staticPath.'big.jpg')) {
                $resImgUrl['pc_thumb_img'] = download_file($staticPath.'big.jpg', $savePath); // PC 端纪念馆风格缩略图
            }
            // 单人馆
            if (check_remote_file_exists($staticPath.'app/1080/guan_bg.jpg')) {
                $resImgUrl['style_img'] = download_file($staticPath.'app/1080/guan_bg.jpg', $savePath); // App 端纪念馆风格大图
            }
            if (check_remote_file_exists($staticPath.'app/1080/kuang.png')) {
                $resImgUrl['kuang'] = download_file($staticPath.'app/1080/kuang.png', $savePath); // App 端纪念馆风格相框图
            }
            // 多人馆
            if (check_remote_file_exists($staticPath.'app/ios/yuan_bg_6.jpg')) {
                $resImgUrl['yuan_bg_6'] = download_file($staticPath.'app/ios/yuan_bg_6.jpg', $savePath); //App 端纪念馆风格大图
            }
            if (check_remote_file_exists($staticPath.'app/ios/yuan_txt.png')) {
                $resImgUrl['yuan_txt'] = download_file($staticPath.'app/ios/yuan_txt.png', $savePath); //App 端纪念馆风格石碑图
            }
            if (check_remote_file_exists($staticPath.'app/ios/yuan_title.png')) {
                $resImgUrl['yuan_title'] = download_file($staticPath.'app/ios/yuan_title.png', $savePath); //App 端纪念馆风格标题图
            }

            // 抓取css文件中的图片
            $pattern="/url(\(.?images).*\)/";
            preg_match_all($pattern, $content, $images);
            $images = array_unique($images[0]);

            foreach ($images as $image) {
                $imgUrl = get_between($image, 'url(', ')');
                if ($img = get_between($image, 'url("', '")')) {
                    $imgUrl = $img;
                }

                $originImgPath = $staticPath.$imgUrl;
                // 检查远程文件是否存在
                if (check_remote_file_exists($originImgPath)) {

                    // 将image文件保存到本地
                    $imgSavePath = $savePath.'images/';
                    // 创建目录
                    if(!is_dir($imgSavePath)) {
                        @mkdir($imgSavePath, 0777);
                    }
                    $fullImgPath = download_file($staticPath.$imgUrl, $imgSavePath);
                }else {
                    $fullImgPath = "<b style='color: red;'>远程文件不存在：".$imgUrl."</b>";
                    $originImgPath = "<b style='color: red;'>远程文件不存在：".$originImgPath."</b>";
                }

                $resImgUrl['images'][] = $fullImgPath;
                $resImgUrl['origin_images'][] = $originImgPath;
            }
        }



        return $resImgUrl;
    }


    /**
     * andy-图片上传
     * @desc 支持多图上传
     * @parameter string save_path 图片保存文件夹（可选默认为“picture”）
     * @parameter string image base64字符串[如果是base64字符串上传，则需要传递image参数，多图为image数组；如果是file文件流上传，不需要传image参数，input#name="image[]"#type="file"]
     * @method post
     * @response
     */
    public function uploadFile()
    {
        $savePath = !empty($this->request->param('save_path')) ? $this->request->param('save_path') : 'picture';
        $setting = [
            'driver' => sysconf('storage_type'),
            'root_path' => './static/upload/'.$savePath.'/' // 图片保存路径 默认为'./static/upload/picture/'
        ];
        $uploadData = $this->uploadAndSaveData($setting);
        $this->response($uploadData, 200, '上传成功');
    }

    public function uploadLayeditorFile()
    {
        $savePath = !empty($this->request->param('save_path')) ? $this->request->param('save_path') : 'picture';
        $setting = [
            'driver' => sysconf('storage_type'),
            'root_path' => './static/upload/'.$savePath.'/' // 图片保存路径 默认为'./static/upload/picture/'
        ];
        $uploadData = $this->uploadAndSaveData($setting);

        $resData = [
            'code' => 0,
            'msg' => '上传成功',
            'data' => [
                'src' => $uploadData['short_path']
            ]
        ];
        return json($resData);
    }

    /**
     * 图片上传成功保存到Picture表
     * @param $setting
     * @return array|mixed
     */
    private function uploadAndSaveData($setting)
    {

//        if (!$this->request->isPost()) {
////             单图上传
////            die('<form method=post enctype="multipart/form-data">
////                    图片（base64） :<input name="image"><br/>
////                    图片（file） :<input name="image" type="file"><br/>
////                    <input type=submit>
////                  </form>');
//
//            // 多图上传
//            die('<form method=post enctype="multipart/form-data">
//                    图片（base64） :<input name="base64[]"><br/>
//                    图片（base64） :<input name="base64[]"><br/>
//                    图片（file） :<input name="image[]" type="file"><br/>
//                    图片（file） :<input name="image[]" type="file"><br/>
//                    <input type=submit>
//                  </form>');
//        }
//
        if (!$this->request->isPost()) {
            $this->wrong(0, '未选择文件');
        }

        if ($this->request->isPost()) {
            // 创建目录
            if(!is_dir($setting['root_path'])) {
                @mkdir($setting['root_path'], 0777);
            }

            //todo base64上传方式（主要是为了处理微信不支持 input file）
//            $smeta = $this->request->post();
//            if(isset($smeta['base64'])){
////                if(implode('', $smeta['base64']) != '') {
//                if(is_array($smeta['base64']) && count($smeta['base64']) > 1) {
//                    // 多图上传
//                    $fileData = [];
//                    foreach ($smeta['base64'] as $item) {
//                        $fileData[] = $this->_uploadAndSaveBase64Data($setting, $item);
//                    }
//                    return $fileData;
//                }else {
//                    // 单图上传
//                    return $this->_uploadAndSaveBase64Data($setting, $smeta['base64']);
//                }
//            }

            // todo file文件流方式上传（input file）
            if (!request()->file('image')) {
                $file = request()->file('file');
            }else {
                $file = request()->file('image');
            }

            if(is_array($file)) {
                // 多图上传
                $fileData = [];
                foreach ($file as $item) {
                    $fileData[] = $this->_uploadAndSaveFileData($setting, $item);
                }
                return $fileData;
            }else {
                // 单图上传
                return $this->_uploadAndSaveFileData($setting, $file);
            }
        }
    }

    /**
     * 上传并保存base64 图片
     * @param $setting
     * @param $smeta
     * @return mixed
     */
    private function _uploadAndSaveBase64Data($setting, $smeta) {
//        $pictureModel = new PictureModel();

        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $smeta, $result)) {//base64上传
            $data = base64_decode(str_replace($result[1], '', $smeta));
            $saveName = md5(microtime(true)) .'.' . $result[2];
            $savePath = substr($setting['root_path'],2).date('Ymd').'/';

            $dataName = $savePath . $saveName;
            $dataName = str_replace('/', '\\', $dataName);

            // 创建目录
            if(!is_dir('./'.$savePath)) {
                @mkdir('./'.$savePath, 0777);
            }

            if (file_put_contents($dataName, $data)) {

                $savePath = substr($setting['root_path'], 1).date('Ymd').'/';
                $shortPath = $savePath.$saveName;
                $data['short_path'] = $shortPath;
                $data['path'] = get_url_with_domain($shortPath);
                return $data; //文件上传成功


                // 成功上传后 获取上传信息
//                $size = file_get_contents($dataName);
//
//                $value['path'] = $savePath.$saveName;
//                $value['type'] = $setting['driver'];
//                $value['size'] = format_bytes(strlen($size));
//                $value['create_at'] = time();
//                // $value['mid'] = 0; // todo 文章id
//                // $value['model'] = 'article'; // todo 文章模型
//
//                if($id = $pictureModel->insertGetId($value)) {
//                    $value['id'] = (int)$id;
//                    return $value; //文件上传成功
//                }else {
//                    $this->wrong(0, '数据保存失败');
//                }
            }else{
                $this->wrong(0, '上传出错');
            }
        }
    }

    /**
     * 上传并保存file 图片
     * @param $setting
     * @param $file
     * @return mixed
     */
    private function _uploadAndSaveFileData($setting, $file) {
//        $pictureModel = new PictureModel();

        $validate = [
            'size'=>sysconf('upload_image_size'),
            'ext' => sysconf('upload_image_ext'),
        ];

        $info = $file->validate([$validate])->move($setting['root_path']);

        if($info){
            // 成功上传后 获取上传信息
            $savePath = substr($setting['root_path'], 1).date('Ymd').'/';
            $saveName = $info->getFilename();
            $shortPath = $savePath.$saveName;

            // 生成缩略图
//            $saveNameInfo = explode('.', $saveName);
//            $fileMd5 = $saveNameInfo[0];
//            $fileExt = $saveNameInfo[0];
//            $thumbPath = substr($setting['root_path'], 1).'thumb/';

            // 创建目录
//            if(!is_dir($thumbPath)) {
//                @mkdir($thumbPath, 0777);
//            }

//            if(sysconf('upload_image_thumb') != '') {
//                $thumbSize = sysconf('upload_image_thumb'); // 读取配置
//            }else {
//                $thumbSize = '300,300'; // 设置默认
//            }
//            $thumbSize = explode(',', $thumbSize);

//            $thumbType = sysconf('upload_image_thumb_type');
//            $image = Image::open('.'.$shortPath);
//            $thumbSaveName = $fileMd5.'_'.$thumbSize[0].'_'.$thumbSize[1].'.'.$fileExt;
//            $thumbFullPath = $thumbPath.$thumbSaveName;

//            $image->thumb($thumbSize[0],$thumbSize[1], $thumbType)->save('.'.$thumbPath.$thumbSaveName);

            $data['short_path'] = $shortPath;
            $data['path'] = get_url_with_domain($shortPath);
//            $data['thumb_path'] = get_root_url().$thumbFullPath;
            return $data; //文件上传成功

//            $value['path'] = $savePath.$saveName;
//            $value['type'] = $setting['driver'];
//            $value['size'] = format_bytes($info->getSize());
//            $value['create_at'] = time();
            // $value['mid'] = 0; // todo 文章id
            // $value['model'] = 'article'; // todo 文章模型

//            if($id = $pictureModel->insertGetId($value)) {
//                $value['id'] = (int)$id;
//                $value['path'] = get_root_url().$value['path'];
//                return $value; //文件上传成功
//            }else {
//                $this->wrong(0, '数据保存失败');
//            }
        }else{
            // 上传失败获取错误信息
            $this->wrong(0, $file->getError());
        }
    }


    /**
     *
     * @desc andy-生成纪念馆等级数据
     * @parameter int maxLevel 最大等级（可选默认“200”）
     * @parameter string password 执行密码（必须）
     */
    public function generateLevels()
    {
        // 验证参数
        $validate = new BaseValidate();
        $validate->checkParamNotNull(['password']);
        $password = $this->param['password'];

        if($password != 'zhangs0919') {
            $this->wrong(0, '执行密码错误，拒绝执行！');
        }

        isset($this->param['max_level']) && $this->param['max_level'] != '' ? $maxLevel = $this->param['max_level'] : $maxLevel = 200;

        $data = [];
        for ($i = 1; $i <= $maxLevel; $i++) {

            if ($i == 1) {
                $exp = 0;
                $range = '0,26';
                $data[] = [
                    'level' => 0,
                    'exp' => $exp,
                    'max_exp' => 26,
                    'range' => $range
                ];
            }

            $startExp = $this->calc($i) + 1;
            $endExp =$this->calc($i+1);
            $exp = $startExp;
            $range = $startExp.','.$endExp;
            $data[] = [
                'level' => $i,
                'exp' => $exp,
                'max_exp' => $endExp,
                'range' => $range
            ];
        }

        $res = Db::name('hall_level')->insertAll($data);
        $this->response($res);
    }

    /**
     * 生成纪念馆等级 辅助函数
     * @param $level
     * @return int
     */
    private function calc($level)
    {
        return $this->sn($level) + 19;
    }

    /**
     * 生成纪念馆等级 辅助函数
     * @param $level
     * @return int
     */
    private function sn($level)
    {
        if ($level == 1) {
            return $this->an(1);
        }
        return $this->an($level) + $this->sn($level - 1);
    }

    /**
     * 生成纪念馆等级 辅助函数
     * @param $level
     * @return int
     */
    private function an($level)
    {
        return 3 * $level + ($level * ($level - 1) * 3) / 2 + 4;
    }

    /**
     *
     * @desc andy-生成姓氏
     * @method post
     * @response
     */
    public function generateSurnames()
    {
        $surnames1 = '赵 钱 孙 李 周 吴 郑 王
                    冯 陈 楮 卫 蒋 沈 韩 杨
                    朱 秦 尤 许 何 吕 施 张
                    孔 曹 严 华 金 魏 陶 姜
                    戚 谢 邹 喻 柏 水 窦 章
                    云 苏 潘 葛 奚 范 彭 郎
                    鲁 韦 昌 马 苗 凤 花 方
                    俞 任 袁 柳 酆 鲍 史 唐
                    费 廉 岑 薛 雷 贺 倪 汤
                    滕 殷 罗 毕 郝 邬 安 常
                    乐 于 时 傅 皮 卞 齐 康
                    伍 余 元 卜 顾 孟 平 黄
                    和 穆 萧 尹 姚 邵 湛 汪
                    祁 毛 禹 狄 米 贝 明 臧
                    计 伏 成 戴 谈 宋 茅 庞
                    熊 纪 舒 屈 项 祝 董 梁
                    杜 阮 蓝 闽 席 季 麻 强
                    贾 路 娄 危 江 童 颜 郭
                    梅 盛 林 刁 锺 徐 丘 骆
                    高 夏 蔡 田 樊 胡 凌 霍
                    虞 万 支 柯 昝 管 卢 莫
                    经 房 裘 缪 干 解 应 宗
                    丁 宣 贲 邓 郁 单 杭 洪
                    包 诸 左 石 崔 吉 钮 龚
                    程 嵇 邢 滑 裴 陆 荣 翁
                    荀 羊 於 惠 甄 麹 家 封
                    芮 羿 储 靳 汲 邴 糜 松
                    井 段 富 巫 乌 焦 巴 弓
                    牧 隗 山 谷 车 侯 宓 蓬
                    全 郗 班 仰 秋 仲 伊 宫
                    宁 仇 栾 暴 甘 斜 厉 戎
                    祖 武 符 刘 景 詹 束 龙
                    叶 幸 司 韶 郜 黎 蓟 薄
                    印 宿 白 怀 蒲 邰 从 鄂
                    索 咸 籍 赖 卓 蔺 屠 蒙
                    池 乔 阴 郁 胥 能 苍 双
                    闻 莘 党 翟 谭 贡 劳 逄
                    姬 申 扶 堵 冉 宰 郦 雍
                    郤 璩 桑 桂 濮 牛 寿 通
                    边 扈 燕 冀 郏 浦 尚 农
                    温 别 庄 晏 柴 瞿 阎 充
                    慕 连 茹 习 宦 艾 鱼 容
                    向 古 易 慎 戈 廖 庾 终
                    暨 居 衡 步 都 耿 满 弘
                    匡 国 文 寇 广 禄 阙 东
                    欧 殳 沃 利 蔚 越 夔 隆
                    师 巩 厍 聂 晁 勾 敖 融
                    冷 訾 辛 阚 那 简 饶 空
                    曾 毋 沙 乜 养 鞠 须 丰
                    巢 关 蒯 相 查 后 荆 红
                    游 竺 权 逑 盖 益 桓 公';

        $surnames2 = '万俟 司马 上官 欧阳
                    夏侯 诸葛 闻人 东方
                    赫连 皇甫 尉迟 公羊
                    澹台 公冶 宗政 濮阳
                    淳于 单于 太叔 申屠
                    公孙 仲孙 轩辕 令狐
                    锺离 宇文 长孙 慕容
                    鲜于 闾丘 司徒 司空
                    丌官 司寇 仉 督 子车
                    颛孙 端木 巫马 公西
                    漆雕 乐正 壤驷 公良
                    拓拔 夹谷 宰父 谷梁
                    晋 楚 阎 法 汝 鄢 涂 钦
                    段干 百里 东郭 南门
                    呼延 归 海 羊舌 微生
                    岳 帅 缑 亢 况 后 有 琴
                    梁丘 左丘 东门 西门
                    商 牟 佘 佴 伯 赏 南宫
                    墨 哈 谯 笪 年 爱 阳 佟
                    第五 言 福';

        // 生成单姓
        $surnames1 = preg_replace ( "/\s(?=\s)/","\\1", $surnames1); // 去除多余空格
        $surnames1 = explode(' ', $surnames1);
        $data1 = [];

        foreach ($surnames1 as $item) {
            $data1[] = [
                'type' => 1,
                'name' => $item,
                'create_at' => time()
            ];
        }
//        Db::name('hall_surnames')->insertAll($data1);

        // 生成复姓
        $surnames2 = preg_replace ( "/\s(?=\s)/","\\1", $surnames2); // 去除多余空格
        $surnames2 = explode(' ', $surnames2);
        $data2 = [];

        foreach ($surnames2 as $item) {
            $data2[] = [
                'type' => 2,
                'name' => $item,
                'create_at' => time()
            ];
        }

//        Db::name('hall_surnames')->insertAll($data2);
    }
}
