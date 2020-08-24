package com.chen.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chen.pojo.Dept;
import com.chen.service.DeptService;
import com.chen.util.LayData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {

    @Resource
    private DeptService deptService;

    @RequestMapping("/tolist")
    public String toDeptList() {
        return "dept/list";
    }


    @RequestMapping("/list")
    @ResponseBody
    public LayData toDeptList(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit,@RequestParam(value = "dname",required = false)String dname) {
        if (dname == null) {
            dname = "";
        }
        int count = deptService.count(dname);
        Page p = new Page();
        p.setCurrent(page);
        p.setSize(limit);

        Page<List<Dept>> pp = deptService.getDeptList(p,dname);
        return new LayData(0,"成功",count,pp.getRecords());
    }
}
