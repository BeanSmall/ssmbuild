<%--
  Created by IntelliJ IDEA.
  User: student
  Date: 2020/7/13
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/summernote/summernote.css">
    <link rel="stylesheet" href="/static/summernote/summernote-bs3.css">

    <style>

    </style>
</head>
<body>
<div id="box">

    <form class="layui-form" action="save" id="user_add" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="username" required placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">住址</label>
            <div class="layui-input-block">
                <input type="text" name="address" required placeholder="请输入住址" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出生日期</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="birthday" id="birthday" placeholder="yyyy-MM-dd HH:mm:ss">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">头像</label>
            <button type="button" class="layui-btn layui-btn-danger"  id="photo"><i class="layui-icon"></i>上传图片</button>
            <input type="hidden" name="photo">
            <div class="layui-inline layui-word-aux">
                这里以限制 500KB 为例
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>备注</h5>
                    </div>
                    <div class="ibox-content no-padding">
                        <div class="summernote">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit"  class="layui-btn layui-btn-danger">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>

<script src="/static/validate/jquery.min.js"></script>
<script src="/static/validate/jquery.validate.min.js"></script>
<script src="/static/validate/messages_zh.min.js"></script>
<script src="/static/validate/jquery.validate.extend.js"></script>
<script src="/static/summernote/summernote.js"></script>
<script src="/static/summernote/summernote-zh-CN.js"></script>

<%--<%@ include file=""%>--%>

<script src="/static/layui/layui.all.js"></script>
<script>
    //一般直接写在一个js文件中
    //一般直接写在一个js文件中
    layui.use(['layer', 'jquery','laydate','upload'], function (layer, $, laydate,upload) {

        var layer = layui.layer;
        var laydate = layui.laydate;
        var upload = layui.upload;

        //日期时间选择器
        laydate.render({
            elem: '#birthday'
            ,type: 'datetime'
        });

        upload.render({
            elem: '#photo'
            ,url: 'upload' //改成您自己的上传接口
            ,size: 500 //限制文件大小，单位 KB
            ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                //预读本地文件示例，不支持ie8
               layer.load(2,{time: 200});
            }
            ,done: function(res){
                layer.close();
                layer.msg('上传成功');
                console.log(res)
            }
        });
    });

    $("#user_add").validate({
        onkeyup: false,
        rules: {
            username: {
                minlength: 5,
                maxlength: 20,
            },
            address: {
                minlength: 10,
                maxlength: 50,
            }

        }
    });

</script>

<script>

</script>
</body>
</html>
