package com.chen.controller;

import cn.hutool.core.io.FileUtil;
import com.alibaba.fastjson.JSONObject;
import com.chen.pojo.User;
import com.chen.service.UserService;
import com.chen.util.LayData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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

    @RequestMapping("/list")
    public String toUserList() {
        return "user/list";
    }

    @RequestMapping("/add")
    public String toUserAdd() {
        return "user/add";
    }

    @RequestMapping("/save")
    public String addSave(User user) {
        System.out.println(user);
        return "user/add";
    }

    /*@RequestMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file) {

        return super.toString();
    }*/

    @RequestMapping(value="/upload")
    @ResponseBody
    public String upload(@RequestParam("file")MultipartFile file) throws Exception{
        FileUtil.writeBytes(file.getBytes(),"D:/upload/1.png");
        return JSONObject.toJSONString(LayData.data_upload(0L,"上传成功"));
    }
}
