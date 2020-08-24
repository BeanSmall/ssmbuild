package com.chen.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chen.pojo.Dept;

import java.util.List;

public interface DeptService {

    Page<List<Dept>> getDeptList(Page page,String dname);

    int count(String dname);

}
