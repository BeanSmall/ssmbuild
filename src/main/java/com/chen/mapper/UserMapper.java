package com.chen.mapper;

import com.chen.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int login(@Param("username") String username, @Param("password") String password);

    // vo        qo       dto                 pojo

    // VIEW     QUERY    DATA TRANSFORM


    //int login2(User user);

    List<User> getUserList(@Param("from") Integer from, @Param("pageSize") Integer pageSize);

    int count();

    int editSave(User user);

    int delById(@Param("id") Integer id);

    User getUserById(@Param("id") Integer id);

    int updateStatus(User user);
}
