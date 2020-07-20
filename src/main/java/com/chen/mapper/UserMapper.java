package com.chen.mapper;

import com.chen.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int login(@Param("username") String username, @Param("password") String password);

    // vo        qo       dto                 pojo

    // VIEW     QUERY    DATA TRANSFORM


    //int login2(User user);

    List<User> getUserList();

    int count();
}
