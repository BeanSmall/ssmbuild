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
        #user_edit,#user_add {
            margin-top: 30px;
            padding-right: 80px;
        }

        .btn_status {
            margin-top: 3.5px;
            width: 50px;
        }

        .switchstatus+div  {
            margin-top: 2px!important;;
        }
    </style>
</head>
<body>
    <br>
    <hr>
    <table class="layui-hide" id="userlist" lay-filter="userlist"></table>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="getCheckData">批量删除</button>
            <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="showAdd">新增用户</button>
        </div>
    </script>

    <script type="text/html" id="switchStatus">
        <input type="checkbox" class="switchstatus" name="status" value="{{d.status}}" lay-skin="switch" lay-text="启用|禁用" lay-filter="statusDemo" {{ d.status == 0 ?'checked' : '' }}>
    </script>

    <script type="text/html" id="user_status">
        {{d.del_flag == 0 ? '<span class="btn_status layui-btn layui-btn-normal layui-btn-xs">正常</span>' : '<span class="btn_status layui-btn layui-btn-danger layui-btn-xs">已删除</span>'}}
    </script>

    <script type="text/html" id="rightBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="changeStatus">禁用</a>
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="changeStatus">启用</a>--%>
        {{d.del_flag == 0 ? '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>' : '<a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-disabled" lay-event="del">删除</a>'}}
    </script>

    <form class="layui-form" style="display: none;" id="user_add" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="username" autocomplete="off" required placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">住址</label>
            <div class="layui-input-block">
                <input type="text" name="address" autocomplete="off" required placeholder="请输入住址" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出生日期</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" autocomplete="off" id="add_birthday" required  name="birthday" placeholder="yyyy-MM-dd HH:mm:ss">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">头像</label>
            <button type="button" class="layui-btn layui-btn-danger" id="photo"><i class="layui-icon"></i>上传图片</button>
            <input type="hidden" name="imgurl" id="addphoto" />
            <div class="layui-inline layui-word-aux">
                这里以限制 500KB 为例
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    </div>
                    <div class="ibox-content no-padding">
                        <input id="noticeContent" name="content" type="hidden" />
                        <div class="summernote"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button"  class="layui-btn layui-btn-danger"  onclick="addSubmitHandler()">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

    <form class="layui-form" style="display: none;" action="save" id="user_edit" method="post">
        <input type="hidden" value="" name="id">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" id="username" name="username"   required placeholder="请输入姓名" autocomplete="off" class="layui-input">
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
                <input type="text" class="layui-input" required name="birthday"  id="birthday" placeholder="yyyy-MM-dd HH:mm:ss">
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal" onclick="submitHandler()">保存</button>
                <button type="reset" class="layui-btn layui-btn-danger">重置</button>
                <button type="button" class="layui-btn layui-btn-danger" onclick="cancleHandler()">取消</button>
            </div>
        </div>
    </form>

<script src="/static/layui/layui.all.js"></script>
<script src="/static/validate/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/validate/jquery.validate.min.js"></script>
<script src="/static/validate/messages_zh.min.js"></script>
<script src="/static/validate/jquery.validate.extend.js"></script>
<script src="/static/summernote/summernote.js"></script>
<script src="/static/summernote/summernote-zh-CN.js"></script>
<script>
    var user_edit_index;
    var render1;
    var user_add_index;
    //一般直接写在一个js文件中
    layui.use(['layer', 'jquery','laydate','upload','table'], function (layer, $, laydate,upload,table) {
        var layer = layui.layer;
        var table = layui.table;
        var laydate = layui.laydate;
        var upload = layui.upload;
        var form = layui.form;
        var $ = layui.jquery;

        //日期时间选择器
        laydate.render({
            elem: '#birthday'
            ,type: 'datetime'
        });

        //日期时间选择器
        laydate.render({
            elem: '#add_birthday'
            ,type: 'datetime'
        });


        $(document).ready(function () {
            $('.summernote').summernote({
                lang: 'zh-CN',
                height: 250
            });
        });
        /*var edit = function () {
            $("#eg").addClass("no-padding");
            $('.click2edit').summernote({
                lang: 'zh-CN',
                focus: true
            });
        };
        var save = function () {
            $("#eg").removeClass("no-padding");
            var aHTML = $('.click2edit').summernote('code');
            $('.click2edit').summernote('destroy');
        };*/

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
                $("#addphoto").val(res.msg);
            }
        });

        render1 = table.render({
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
                ,{field:'address', width:180, title: '地址', sort: true}
                ,{field:'birthday', width:160, title: '出生日期',templet:'<div>{{ d.birthday == null?"":layui.util.toDateString(d.birthday, "yyyy-MM-dd HH:mm:ss") }}</div>',sort: true,align: 'center'}
                ,{field:'status', title:'用户状态', width:105, templet: '#switchStatus',align: 'center',event: 'setStatus'}
                ,{field:'del_flag', width:120, title: '是否删除',templet: '#user_status',sort: true,align: 'center'}
                ,{fixed: 'right', title:'操作', width:250, toolbar: '#rightBar',fixed: 'right'}
            ]]
        });

        //监听性别操作
        form.on('switch(statusDemo)', function(obj){
            console.log(obj);
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
                //自定义头工具栏右侧图标 - 提示
                case 'showAdd':
                    showAdd();
                    break;
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
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

        $("#user_edit").validate({
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

        table.on('tool(userlist)', function(obj){
            var data = obj.data;
            // console.log(data.id);
            if(obj.event === 'del'){
                if(data.del_flag == 1){
                    layer.msg('用户已经被删除，不能重复操作！', {
                        icon: 2,
                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
                    });
                    return;
                }
                layer.confirm('真的删除行么', function(index){
                    $.ajax({url:"delAll/"+data.id,success:function(result){
                        if(result){
                            render1.reload({page:{curr:1}});
                            layer.close(index);
                            layer.msg('删除成功！', {
                                icon: 1,
                                time: 2000 //2秒关闭（如果不配置，默认是3秒）
                            });
                        } else {
                            layer.msg('删除失败！', {
                                icon: 1,
                                time: 2000 //2秒关闭（如果不配置，默认是3秒）
                            });
                        }
                    }});
                });
            } else if(obj.event === 'edit'){
                $.ajax({url:"getUserById/"+data.id,async:false,success:function(data) {
                        if (data) {
                            var obj = $.parseJSON(data)
                            $('#user_edit input[name=username]').val(obj.username);
                            $("#user_edit input[name=address]").val(obj.address);
                            $("#user_edit input[name=birthday]").val(obj.birthday);
                            $("#user_edit input[name=id]").val(obj.id);
                        }
                    }
                });
                var $user_edit = $('#user_edit');
                //示范一个公告层
                user_edit_index = layer.open({
                    type: 1
                    ,title: ['编辑用户信息', 'font-size:18px; background-color: #eea236;']
                    ,closeBtn: 1
                    ,area:['1380px', '680px']
                    ,shade: 0.4
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btnAlign: 'c'
                    ,content: $user_edit
                    ,cancel: function(index, layero){
                        layer.close(user_edit_index);
                        $("#user_edit").hide();
                        return false;
                    }
                });
            } else if (obj.event === 'setStatus'){
                $.ajax({url:"updateStatus",data:{id:data.id,status:data.status},success:function(result){
                        if(result){
                            layer.msg('修改成功！', {
                                icon: 1,
                                time: 2000 //2秒关闭（如果不配置，默认是3秒）
                            });
                        } else {
                            layer.msg('修改失败！', {
                                icon: 1,
                                time: 2000 //2秒关闭（如果不配置，默认是3秒）
                            });
                        }
                    }});
            }
        });
    });

    function showAdd(){
        //示范一个公告层
        user_add_index = layer.open({
            type: 1
            ,title: ['新增用户信息', 'font-size:18px; background-color: #eea236;']
            ,closeBtn: 1
            ,area:['1380px', '680px']
            ,shade: 0.4
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,btnAlign: 'c'
            ,content: $('#user_add')
            ,cancel: function(index, layero){
                layer.close(user_add_index);
                $("#user_add").hide();
                return false;
            }
        });
    }

    function submitHandler() {
        if ($("#user_edit").validate().form()) {
            var data = $("#user_edit").serializeArray();
            $.ajax({url:"editSave/",data,success:function(result){
                    if(result > 0){
                        render1.reload({page:{curr:1}});
                        layer.msg('修改成功！', {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    } else {
                        layer.msg('修改失败！', {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    }
                }});
            $("#user_edit").hide();
            layer.close(user_edit_index);
        } else {
        }
    }

    function addSubmitHandler() {
        if ($("#user_add").validate().form()) {
            var sHTML = $('.summernote').summernote('code');
            $("#noticeContent").val(sHTML);
            var data = $("#user_add").serializeArray();
            $.ajax({url:"addSave",data,success:function(result){
                    if(result > 0){
                        render1.reload({page:{curr:1}});
                        layer.msg('新增成功！', {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    } else {
                        layer.msg('新增失败！', {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    }
                }});
            $("#user_add").hide();
            layer.close(user_add_index);
        } else {
        }
    }


    function cancleHandler() {
        layer.close(user_edit_index);
        $("#user_edit").hide();
    }
</script>
</body>
</html>
