package com.chen.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chen.mapper.DeptMapper;
import com.chen.pojo.Dept;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("deptService")
public class DeptServiceImpl implements DeptService {

    @Resource
    private DeptMapper deptMapper;

    public Page<List<Dept>> getDeptList(Page page,String dname) {
        //return deptMapper.selectList(Page<Dept> page ,new QueryWrapper<Dept>());
        return deptMapper.selectPage(page,new QueryWrapper<Dept>().like("dept_name",dname));
    }

    public int count(String dname) {
        return deptMapper.selectCount(new QueryWrapper<Dept>().like("dept_name",dname));
    }
}
