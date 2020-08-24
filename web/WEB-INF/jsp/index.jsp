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
    <style>
        #body {
            overflow: hidden;
        }
        #iframeBox {
            width:100%;
            border:0;
            height: 100%;
            padding:0px 0px 0px 0px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" src="/user/tolist">用户查询</a></dd>
                    </dl>
                </li>
            </ul>

            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">部门管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" src="/dept/tolist">部门查询</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body" id="body">
        <!-- 内容主体区域 -->
        <iframe id="iframeBox" src="">

        </iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>



<script src="/static/layui/layui.all.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use('element', function(){
        var element = layui.element;

    });
</script>

<script>
    layui.use(['form', 'layer', 'jquery'], function (form, layer, $) {
        $(".layui-nav-child dd a").click(function () {
            var target = $(this).attr("src");
            $("iframe").attr("src", target);
        });
    });
</script>
<script type="text/javascript">
    function reinitIframe(){
        var iframe = document.getElementById("test");
        try{
            var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            var height = Math.max(bHeight, dHeight);
            iframe.height =  height;
            console.log(height);
        }catch (ex){}
    }
    window.setInterval("reinitIframe()", 200);
</script>
</body>
</html>
