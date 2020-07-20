package com.chen.service;

import com.chen.mapper.UserMapper;
import com.chen.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService{


    @Resource
    private UserMapper userMapper;

    public int login(String username, String password) {
        return userMapper.login(username,password);
    }

    public List<User> getUserList() {
        return userMapper.getUserList();
    }

    public int count() {
        return userMapper.count();
    }
}
