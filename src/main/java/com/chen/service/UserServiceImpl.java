package com.chen.service;

import com.chen.mapper.UserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements UserService{


    @Resource
    private UserMapper userMapper;

    public int login(String username, String password) {
        return userMapper.login(username,password);
    }
}
