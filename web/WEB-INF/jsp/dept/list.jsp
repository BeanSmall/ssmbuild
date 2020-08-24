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
        .dname {
            margin-bottom: 0px!important;
        }
    </style>
</head>
<body>
<br>
<div class="layui-form-item">
    <div class="layui-inline dname" >
        <label class="layui-form-label">部门名称</label>
        <div class="layui-input-inline">
            <input type="text" id="dname" name="dname" autocomplete="off" class="layui-input">
        </div>
    </div>
    <button type="button" class="layui-btn" onclick="btnSearch()">查询</button>
</div>
    <table class="layui-hide" id="deptlist" lay-filter="deptlist"></table>

<script src="/static/layui/layui.all.js"></script>
<script>
    var render;
    var $;
        //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
            ,form = layui.form
            ,table = layui.table;
        $ = layui.jquery;

        render = table.render({
            elem: '#deptlist'
            ,url:'list'
            ,page: true
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', width:80, title: 'ID', sort: true,fixed:'left'}
                ,{field:'dname', width:120, title: '部门名称',align: 'center'}
            ]]
        });
    });

    function btnSearch() {
        render.reload({
            where: { //设定异步数据接口的额外参数，任意设
                dname: $("#dname").val()
            }
            ,page: {
                curr: 1 //重新从第 1 页开始
            }
        });
    }
</script>
</body>
</html>
