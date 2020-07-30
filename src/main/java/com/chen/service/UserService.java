package com.chen.service;

import com.chen.pojo.User;

import java.util.List;

public interface UserService {

    int login(String username, String password);

    List<User> getUserList(Integer page,Integer limit);

    int count();

    int addSave(User user);

    int editSave(User user);

    boolean delAll(String ids);

    User getUserById(Integer id);

    int updateStatus(User user);
}
