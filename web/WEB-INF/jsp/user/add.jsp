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
    <style>
        #box{
            margin: 100px;
            width: 450px;

        }
        /** 表单验证 样式布局 **/
        label.error {
            position: absolute;
            right: 18px;
            top: 10px;
            color: #ef392b;
            font-size: 12px
        }

        .input-group label.error {
            z-index:99;
            right: 42px
        }

        .input-group.date label.error {
            z-index:99;
            right: 3px
        }

        .Validform_error,input.error,select.error {
            background-color: #fbe2e2;
            border-color: #c66161;
            color: #c00
        }

        .Validform_wrong,.Validform_right,.Validform_warning {
            display: inline-block;
            height: 20px;
            font-size: 12px;
            vertical-align: middle;
            padding-left: 25px
        }

        .i-checks label.error, .check-box label.error, .radio-box label.error {
            right: auto;
            width: 150px;
            left: 210px;
            top: 1px;
            max-width: none;
        }
    </style>
</head>
<body>
<div id="box">

    <form class="layui-form" action="" id="user_add">
        <div class="layui-form-item">
            <label class="layui-form-label">输入框</label>
            <div class="layui-input-block">
                <input type="text" name="title" required placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn layui-btn-normal">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

    </form>
</div>


<script src="/static/validate/jquery.min.js"></script>
<script src="/static/validate/jquery.validate.min.js"></script>
<script src="/static/validate/messages_zh.min.js"></script>
<script src="/static/validate/jquery.validate.extend.js"></script>
<script src="/static/layui/layui.all.js"></script>
<script>
    //一般直接写在一个js文件中
    //一般直接写在一个js文件中
    /*layui.use(['layer', 'jquery'], function (layer, $) {

    });*/

    $("#user_add").validate({
        onkeyup: false,
        rules: {
            title: {
                minlength: 5,
                maxlength: 20,
            }
        }
    });

    function submitHandler() {
        if ($.validate.form()) {


            alert(123);
            /*layer.msg("验证通过！！")*/
        }
    }
</script>

<script>

</script>
</body>
</html>
