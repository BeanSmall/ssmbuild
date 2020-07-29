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

    public List<User> getUserList(Integer page,Integer limit) {

        return userMapper.getUserList((page-1) * limit,limit);
    }

    public int count() {
        return userMapper.count();
    }


    public User getUserById(Integer id) {
        return userMapper.getUserById(id);
    }

    public int editSave(User user) {
        return userMapper.editSave(user);
    }

    public boolean delAll(String ids) {
        boolean flag = true;
        if(ids != null){
            String[] arr = ids.split("-");
            for (int i = 0; i < arr.length; i++) {
                int status = userMapper.delById(Integer.parseInt(arr[i]));
                if(status <= 0){
                    flag = false;
                    return flag;
                }
            }
        }
        return flag;
    }

    public int updateStatus(User user) {
        return userMapper.updateStatus(user);
    }
}
