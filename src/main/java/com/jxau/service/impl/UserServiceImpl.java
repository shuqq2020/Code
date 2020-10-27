package com.jxau.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxau.dao.UserDao;
import com.jxau.domain.User;
import com.jxau.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public PageInfo<User> findAll(Integer Page,Integer Size) {
        PageHelper.startPage(Page,Size);
        List<User> list = userDao.findAll();
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public boolean findByEmail(String email) {
        if(userDao.findByEmail(email)!=null){
            return false;
        }else{
            return true;
        }
    }

    @Override
    public boolean saveUser(User user) {
        return userDao.saveUser(user);
    }

    @Override
    public User findUser(User user) {
        return userDao.findUser(user);
    }

    @Override
    public User findAdmin(User user) {
        return userDao.findAdmin(user);
    }

    @Override
    public Integer countUsers() {
        return userDao.countUsers();
    }

    @Override
    public User findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public boolean updateAdmin(User user) {
        return userDao.updateAdmin(user);
    }

    @Override
    public boolean updatePass(User user) {
        return userDao.updatePass(user);
    }

    @Override
    public boolean deleteUser(Integer uid) {
        Integer integer = userDao.deleteUser(uid);
        if (integer>0){
            return true;
        }else{

            return false;
        }
    }

    @Override
    public boolean setAdmin(Integer uid) {

        return userDao.setAdmin(uid);
    }

    @Override
    public boolean cancelAdmin(Integer uid) {
        return userDao.cancelAdmin(uid);
    }


}
