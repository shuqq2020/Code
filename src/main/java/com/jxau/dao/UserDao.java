package com.jxau.dao;

import com.jxau.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
*用户的Dao接口
* */
@Repository
public interface UserDao {
    /*
     * 查询所有用户信息
     * */
    List<User> findAll();
    /*
    * 判断邮箱是否以及存在
    * */
    User findByEmail(String email);
    /*
    * 注册用户
    * */
    boolean saveUser(User user);
    /*
    * 登录判定
    * */
    User findUser(User user);
    /*
    * 判定是否为管理源
    * */
    User findAdmin(User user);
    /*
    * 计算用户数量
    * */
    Integer countUsers();
    /*
    * 根据id查询用户
    * */
    User findById(Integer id);
    /*
    * 更新Admin信息
    * */
    boolean updateAdmin(User user);
    /*
    * admin修改密码
    * */
    boolean updatePass(User user);
    /*
    * 删除user
    * */
    Integer deleteUser(Integer uid);
    /*
    * 将用户设置为管理员
    * */
    boolean setAdmin(Integer uid);
    /*
    * 将管理员设置为用户
    * */
    boolean cancelAdmin(Integer uid);

}