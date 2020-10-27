package com.jxau.service;

import com.github.pagehelper.PageInfo;
import com.jxau.domain.User;

import java.util.List;

public interface UserService {
    /*
     * 查询所有用户信息
     * */
    PageInfo<User> findAll(Integer Page, Integer Size);
    /*
     * 判断邮箱是否以及存在
     * */
    boolean findByEmail(String email);
    /*
     * 注册用户
     * */
    boolean saveUser(User user);
    /*
     * 登录判定
     * */
    User findUser(User user);
    /*
     * 登录判定
     * */
    User findAdmin(User user);

    /*
     * 计算用户的数量
     * */
    Integer countUsers();
    /*
    * 通过id查询用户
    * */
    User findById(Integer id);

    boolean updateAdmin(User user);

    /*
     * admin修改密码
     * */
    boolean updatePass(User user);
    /*
     * 删除user
     * */
    boolean deleteUser(Integer uid);
    /*
    * 将用户设置为管理员
    * */
    boolean setAdmin(Integer uid);
    /*
    * 将用户设置为管理员
    * */
    boolean cancelAdmin(Integer uid);
}
