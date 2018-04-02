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

namespace app\admin\controller;

use app\admin\service\FileService;
use app\api\model\PictureModel;

/**
 * 插件助手控制器
 * Class Plugs
 * @package app\admin\controller
 * @author andy <290648237@qq.com>
 * @date 2017/02/21
 */
class Plugs extends BasicAdmin {

    /**
     * 默认检查用户登录状态
     * @var bool
     */
    protected $checkLogin = false;

    /**
     * 默认检查节点访问权限
     * @var bool
     */
    protected $checkAuth = false;

    /**
     * 文件上传
     * @return \think\response\View
     */
    public function upfile() {
        $types = $this->request->param('type', 'jpg,png');
        $mode = $this->request->param('mode', 'one');

        $this->assign('mode', $mode);
        $this->assign('types', $types);
        if (!in_array(($uptype = $this->request->get('uptype')), ['local', 'qiniu'])) {
            $uptype = sysconf('storage_type');
        }
        $this->assign('uptype', $uptype);
        $this->assign('mimes', FileService::getFileMine($types));
        $this->assign('field', $this->request->get('field', 'file'));
        return view();
    }

    /**
     * 通用文件上传
     * @return string
     */
    public function upload() {
        if ($this->request->isPost()) {

            // 设置文件上传目录
            $fileType = explode('.', $this->request->post('key'));
            $fileType = $fileType[1];
            if ($fileType == 'mp3') {
                // 音乐
                $savePath = 'music';
            }elseif ($fileType == 'mp4') {
                // 视频
                $savePath = 'videos';
            }elseif ($fileType == 'apk') {
                // 文件
                $savePath = 'files';
            }else {
                $savePath = 'picture';
            }

            $setting = [
                'driver' => sysconf('storage_type'),
                'root_path' => './static/upload/'.$savePath.'/' // 图片保存路径 默认为'./static/upload/picture/'
            ];
            // 创建目录
            if(!is_dir($setting['root_path'])) {
                @mkdir($setting['root_path'], 0777);
            }

            $info = $this->request->file('file')->move($setting['root_path']);
            if($info){
                // 成功上传后 获取上传信息
                $savePath = substr($setting['root_path'], 1).date('Ymd').'/';
                $saveName = $info->getFilename();
                return json(['data' => ['site_url' => $savePath.$saveName], 'code' => 'SUCCESS']);
            }else{
                // 上传失败获取错误信息
                return json(['code' => 'ERROR', 'message' => $this->request->file('file')->getError()]);
            }
        }

        return json(['code' => 'ERROR']);
    }


    public function upload_backup() {
        if ($this->request->isPost()) {
//            $md5s = str_split($this->request->post('md5'), 16);
//            if (($info = $this->request->file('file')->move('static' . DS . 'upload' . DS . $md5s[0], $md5s[1], true))) {
//                $filename = join('/', $md5s) . '.' . $info->getExtension();
//                $site_url = FileService::getFileUrl($filename, 'local');
//                if ($site_url) {
//                    return json(['data' => ['site_url' => $site_url], 'code' => 'SUCCESS']);
//                }
//            }

            // 设置文件上传目录
            $fileType = explode('.', $this->request->post('key'));
            $fileType = $fileType[1];
            if ($fileType == 'mp3') {
                // 音乐
                $savePath = 'music';
            }elseif ($fileType == 'mp4') {
                // 视频
                $savePath = 'videos';
            }else {
                $savePath = 'picture';
            }

//            $savePath = !empty($this->request->param('save_path')) ? $this->request->param('save_path') : 'picture';
            $setting = [
                'driver' => sysconf('storage_type'),
                'root_path' => './static/upload/'.$savePath.'/' // 图片保存路径 默认为'./static/upload/picture/'
            ];
            // 创建目录
            if(!is_dir($setting['root_path'])) {
                @mkdir($setting['root_path'], 0777);
            }

            $pictureModel = new PictureModel();
            $info = $this->request->file('file')->move($setting['root_path']);
            if($info){
                // 成功上传后 获取上传信息
                $savePath = substr($setting['root_path'], 1).date('Ymd').'/';
                $saveName = $info->getFilename();
                $value['path'] = $savePath.$saveName;
                $value['type'] = $setting['driver'];
                $value['size'] = format_bytes($info->getSize());
                $value['create_at'] = time();
//                $value['mid'] = 0; // todo 文章id
//                $value['model'] = 'article'; // tod 文章模型

                if($id = $pictureModel->insertGetId($value)) {
                    $value['id'] = (int)$id;
//                    $value['path'] = get_url_with_domain($value['path']);
//                    return json(['data' => $value, 'code' => 'SUCCESS']); //文件上传成功
                    return json(['data' => ['image_id' => $value['id'], 'site_url' => $value['path']], 'code' => 'SUCCESS']);
                }else {
                    return json(['code' => 'ERROR', 'message' => '数据保存失败']);
                }
            }else{
                // 上传失败获取错误信息
                return json(['code' => 'ERROR', 'message' => $this->request->file('file')->getError()]);
            }
        }

        return json(['code' => 'ERROR']);
    }


    /**
     * 文件状态检查
     */
    public function upstate() {
        $post = $this->request->post();
        $filename = join('/', str_split($post['md5'], 16)) . '.' . pathinfo($post['filename'], PATHINFO_EXTENSION);
        // 检查文件是否已上传 todo 可以重复上传图片
//        if (($site_url = FileService::getFileUrl($filename))) {
//            $this->result(['site_url' => $site_url], 'IS_FOUND');
//        }
        // 需要上传文件，生成上传配置参数
        $config = ['uptype' => $post['uptype'], 'file_url' => $filename];
        switch (strtolower($post['uptype'])) {
            case 'qiniu':
                $config['server'] = FileService::getUploadQiniuUrl(true);
                $config['token'] = $this->_getQiniuToken($filename);
                break;
            case 'local':
                $config['server'] = FileService::getUploadLocalUrl();
                break;
        }
        $this->result($config, 'NOT_FOUND');
    }

    /**
     * 生成七牛文件上传Token
     * @param string $key
     * @return string
     */
    protected function _getQiniuToken($key) {
        empty($key) && exit('param error');
        $accessKey = sysconf('storage_qiniu_access_key');
        $secretKey = sysconf('storage_qiniu_secret_key');
        $bucket = sysconf('storage_qiniu_bucket');
        $host = sysconf('storage_qiniu_domain');
        $protocol = sysconf('storage_qiniu_is_https') ? 'https' : 'http';
        $params = [
            "scope"      => "{$bucket}:{$key}",
            "deadline"   => 3600 + time(),
            "returnBody" => "{\"data\":{\"site_url\":\"{$protocol}://{$host}/$(key)\",\"file_url\":\"$(key)\"}, \"code\": \"SUCCESS\"}",
        ];
        $data = str_replace(['+', '/'], ['-', '_'], base64_encode(json_encode($params)));
        return $accessKey . ':' . str_replace(['+', '/'], ['-', '_'], base64_encode(hash_hmac('sha1', $data, $secretKey, true))) . ':' . $data;
    }

    /**
     * 字体图标
     */
    public function icon() {
        $this->assign('field', $this->request->get('field', 'icon'));
        return view();
    }

}
