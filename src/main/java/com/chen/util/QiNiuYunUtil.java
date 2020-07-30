package com.chen.util;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

/**
 * @Author AK47007
 * @Date 2019/6/4 21:51
 * http://www.ak47007.com/article/detail/7e4e1d4b7b6c4621834c385d0c5bbe92#/?id=%E4%B8%8A%E4%BC%A0%E5%9B%BE%E7%89%87%E5%88%B0%E4%B8%83%E7%89%9B%E4%BA%91
 * Describe:
 */
public class QiNiuYunUtil {

    /**
     * AccessKey
     */
    private static String accessKey = "";

    /**
     * SecretKey
     */
    private static String secretKey = "";

    /**
     * 储存空间名
     */
    private static String bucket = "ssmbuild";

    /**
     * 外链URL前缀
     */
    private static String fronturl = "http://qe7pmfvyb.bkt.clouddn.com/";

    /**
     * 将图片上传到七牛云
     *
     * @param filePath 图片路径
     * @return 链接
     * @throws QiniuException
     */
    public static String uploadQiniuYun(String filePath) throws QiniuException {
        Auth auth = Auth.create(accessKey, secretKey);
        // 上传凭证
        String upToken = auth.uploadToken(bucket);
        // zone0华东区域,zone1是华北区域,zone2是华南区域
        Configuration cfg = new Configuration(Region.region2());
        UploadManager uploadManager = new UploadManager(cfg);
        try {
            Response response = uploadManager.put(filePath, null, upToken);
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            return fronturl + "/" + putRet.key;
        } catch (QiniuException ex) {
            Response r = ex.response;
            System.err.println(r.toString());
            try {
                System.err.println(r.bodyString());
            } catch (QiniuException ex2) {
            }
        }
        return null;
    }

    /**
     * 删除图片
     *
     * @param fileName
     * @return
     * @throws QiniuException
     */
    public static String deleteQiniu(String fileName) throws QiniuException {
        Auth auth = Auth.create(accessKey, secretKey);
        Configuration cfg = new Configuration(Zone.zone2());
        BucketManager bucketMgr = new BucketManager(auth, cfg);
        try {
            bucketMgr.delete(bucket, fileName);
        } catch (QiniuException Q) {
            return Q.toString();
        }
        return null;
    }
}