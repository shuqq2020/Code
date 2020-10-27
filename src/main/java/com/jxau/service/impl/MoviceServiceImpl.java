package com.jxau.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxau.dao.MoviceDao;
import com.jxau.domain.Movice;
import com.jxau.domain.User;
import com.jxau.service.MoviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("moviceServiceImpl")
public class MoviceServiceImpl implements MoviceService {
    @Autowired
    private MoviceDao moviceDao;
    @Override
    public List<Movice> showMovice() {
        return moviceDao.showMovice();
    }
    @Override
    public Movice playMovice(Integer id){
        return moviceDao.playMovice(id);
    }

    @Override
    public List<Movice> findMovice(String c) {
        return moviceDao.findMovice(c);
    }

    @Override
    public List<Movice> findAllMovice() {
        return moviceDao.findAllMovice();
    }

    @Override
    public List<Movice> findCover() {
        return moviceDao.findCover();
    }

    @Override
    public PageInfo<Movice> findPage(Integer Page, Integer Size) {
        PageHelper.startPage(Page,Size);
        List<Movice> list = moviceDao.findAllMovice();
        PageInfo<Movice> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<Movice> findSortPage(String c,Integer Page, Integer Size) {
        PageHelper.startPage(Page,Size);
        List<Movice> list = moviceDao.findMovice("%"+c+"%");
        PageInfo<Movice> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public List<Movice> playAndComment(Integer id) {
        return moviceDao.playAndComment(id);
    }

    @Override
    public Integer countMovices() {
        return moviceDao.countMovices();
    }

    @Override
    public PageInfo<Movice> findAll(Integer Page, Integer Size) {
        PageHelper.startPage(Page,Size);
        List<Movice> list = moviceDao.findAll();
        PageInfo<Movice> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public boolean deleteMovice(Integer mid) {
        if (moviceDao.deleteMovice(mid)>0) {
            return true;
        }else{
            return false;
        }

    }

    @Override
    public boolean setMovice(Integer mid) {
        return moviceDao.setMovice(mid);
    }

    @Override
    public boolean normalMovice(Integer mid) {

        return moviceDao.normalMovice(mid);
    }

    @Override
    public boolean changeMovice(Movice movice) {
        return moviceDao.changeMovice(movice);
    }

    @Override
    public Movice findMoviceById(Integer mid) {
        return moviceDao.findMoviceById(mid);
    }

}
