package com.chen.controller;

import com.chen.pojo.User;
import com.chen.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

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
}
