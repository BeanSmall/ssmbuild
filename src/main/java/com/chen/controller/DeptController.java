package com.chen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dept")
public class DeptController {


    @RequestMapping("/list")
    public String toDeptList() {
        return "dept/list";
    }
}
