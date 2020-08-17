package com.chen.controller;

import cn.hutool.core.io.FileUtil;
import com.alibaba.fastjson.JSONObject;
import com.chen.pojo.User;
import com.chen.service.UserService;
import com.chen.util.LayData;
import com.chen.util.QiNiuYunUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{

    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/dologin")
    public String login(User user, HttpSession session) {
        int count = userService.login(user.getUsername(),user.getPassword());
        //System.out.println(1/0);
        if (count > 0) {
            session.setAttribute("count",count);
            return "index";
        } else {
            return "login";
        }
    }

    @RequestMapping("/tolist")
    public String toUserList() {
        return "user/list";
    }

    //@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8")
//    @RequestMapping(value = "/list")
//    @ResponseBody
//    public Object getUserList(){
//        List<User> list = userService.getUserList();
//        return JSONObject.toJSON(list);
//
//    }
//
//    @RequestMapping(value = "/list2")
//    @ResponseBody
//    public String getUserList2(){
//        List<User> list = userService.getUserList();
//        return JSONObject.toJSONString(list);
//
//    }

    @RequestMapping(value = "/list3")
    @ResponseBody
    public LayData getUserList3(@RequestParam("page") Integer page,@RequestParam("limit") Integer limit){
        int count = userService.count();
        List<User> list = userService.getUserList(page,limit);
        return new LayData(0,"成功",count,list);
    }

    @RequestMapping("/add")
    public String toUserAdd() {
        return "user/add";
    }

    @RequestMapping("/addSave")
    @ResponseBody
    public int addSave(User user) {
        System.out.println(user);
        return userService.addSave(user);
    }


    @RequestMapping("/editSave")
    @ResponseBody
    public int editSave(User user) {
        return userService.editSave(user);
    }

    @RequestMapping("/updateStatus")
    @ResponseBody
    public int updateStatus(User user) {
        return userService.updateStatus(user);
    }



    //根据id查询用户信息
    @RequestMapping("/getUserById/{id}")
    @ResponseBody
    public User getUserById(@PathVariable("id") Integer id){
        return userService.getUserById(id);
    }




    //批量删除的操作
    @RequestMapping("/delAll/{ids}")
    @ResponseBody
    public boolean delAll(@PathVariable("ids") String ids){
        return userService.delAll(ids);
    }


    @RequestMapping(value="/uploadLocal")
    @ResponseBody
    public String uploadLocal(@RequestParam("file") MultipartFile file) throws Exception{
        FileUtil.writeBytes(file.getBytes(),"D:/upload/1.png");
        return JSONObject.toJSONString(new LayData(0,"上传成功"));
    }

    @RequestMapping(value = "/upload")
    @ResponseBody
    public String uploadPictures(@RequestParam("file") MultipartFile[] files, HttpServletRequest request) {
        if (files != null || files.length != 0) {
            for (int i = 0; i < files.length; i++) {
                //上传的文件名
                String fileName = files[i].getOriginalFilename();
                // 3. 通过req.getServletContext().getRealPath("") 获取当前项目的真实路径，然后拼接前面的文件名
                String destFileName = request.getRealPath("") + "img" + File.separator + fileName;
                //第一次运行的时候，这个文件所在的目录往往是不存在的，这里需要创建一下目录
                File destFile = new File(destFileName);
                destFile.getParentFile().mkdirs();
                try {
                    //把浏览器上传的文件复制到希望的位置
                    files[i].transferTo(destFile);
                    //上传到七牛云并返回上传到七牛云的路径,可以复制路径在浏览器访问
                    String url = QiNiuYunUtil.uploadQiniuYun(destFileName);
                    System.out.println("图片路径:" + url);
                    // 图片上传到七牛云后删除上传的文件
                    destFile.delete();
                    try {
                        //这里延迟1秒让七牛云缓一下
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    return JSONObject.toJSONString(new LayData(0,url));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "index";
    }
}
