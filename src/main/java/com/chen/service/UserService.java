package com.chen.service;

import com.chen.pojo.User;

import java.util.List;

public interface UserService {

    int login(String username, String password);

    List<User> getUserList();

    int count();
}
