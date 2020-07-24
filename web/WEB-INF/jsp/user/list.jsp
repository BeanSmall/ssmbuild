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
        #user_edit {
            margin-top: 30px;
            padding-right: 80px;
        }
    </style>
</head>
<body>


    <h1>用户</h1>

    <br>
    <hr>

    <table class="layui-hide" id="userlist" lay-filter="userlist"></table>

    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="getCheckData">批量删除</button>
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
            <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        </div>
    </script>


    <script type="text/html" id="rightBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="changeStatus">禁用</a>
        <a class="layui-btn layui-btn-xs" lay-event="changeStatus">启用</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <form class="layui-form" action="save" id="user_edit" method="post">

        <input type="hidden" value="" name="id">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" id="username" name="username"  required placeholder="请输入姓名" autocomplete="off" class="layui-input">
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
    </form>

<script src="/static/layui/layui.all.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form','table','jquery'], function(){
        var layer = layui.layer;
        var table = layui.table;
        var form = layui.form;
        var $ = layui.jquery;

        var render1 = table.render({
            elem: '#userlist'
            ,url:'list3'
            ,page: true
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', width:80, title: 'ID', sort: true,fixed:'left'}
                ,{field:'username', width:120, title: '用户名',align: 'center'}
                ,{field:'address', width:80, title: '地址', sort: true}
                ,{field:'birthday', title: '出生日期',sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#rightBar', width:250}
            ]]
        });

        //头工具栏事件
        table.on('toolbar(userlist)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    layer.confirm('确认删除这'+checkStatus.data.length+'条数据吗?', {icon: 3, title:'提示'}, function(index){
                        var data = checkStatus.data;
                        var arr = JSON.parse(JSON.stringify(data));
                        var ids = new Array();
                        for (var i = 0; i < arr.length;i++) {
                            ids.push(arr[i].id);
                        }
                        var str = ids.join("-");
                        console.log(str);
                        $.ajax({url:"delAll/"+str,success:function(result){
                                if(result){
                                    render1.reload({page:{curr:1}});
                                }
                            }});
                        layer.close(index);
                        layer.msg('删除成功！', {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    });


                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        table.on('tool(userlist)', function(obj){
            var data = obj.data;
            // console.log(data.id);
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({url:"delAll/"+data.id,success:function(result){
                            if(result){
                                render1.reload({page:{curr:1}});
                            }
                        }});
                    layer.close(index);
                    layer.msg('删除成功！', {
                        icon: 1,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    });
                });
            } else if(obj.event === 'edit'){

                $.ajax({url:"getUserById/"+data.id,success:function(data) {
                        if (data) {
                            var obj = $.parseJSON(data)
                            $('input[name=username]').val(obj.username);
                            $("input[name=address]").val(obj.address);
                            $("input[name=birthday]").val(obj.birthday);
                            $("input[name=id]").val(obj.id);
                        }
                    }
                });
                var $user_edit = $('#user_edit');
                //示范一个公告层
                layer.open({
                    type: 1
                    ,title: ['编辑用户信息', 'font-size:18px; background-color: #eea236;']
                    ,closeBtn: 1
                    ,area:['500px', '400px']
                    ,shade: 0.4
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['火速围观', '残忍拒绝']
                    ,btnAlign: 'c'
                    ,content: $user_edit
                    ,success: function(layero){
                        // var name = $('input[name=username]').val();
                        var data = $user_edit.serializeArray();
                        console.log(data);
                    }
                });

            }
        });
    });
</script>
</body>
</html>
