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

    </style>
</head>
<body>


    <h1>用户</h1>

    <br>
    <hr>

    <table class="layui-hide" id="userlist"></table>

<script src="/static/layui/layui.all.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form','table'], function(){
        var layer = layui.layer;
        var table = layui.table;
        var form = layui.form;

        table.render({
            elem: '#userlist'
            ,url:'list3'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'username', width:80, title: '用户名'}
                ,{field:'address', width:80, title: '地址', sort: true}
                ,{field:'birthday', width:180, title: '出生日期'}
            ]]
        });


    });
</script>
</body>
</html>
