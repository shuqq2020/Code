package com.jxau.service;

import com.github.pagehelper.PageInfo;
import com.jxau.domain.Movice;

import java.util.List;

public interface MoviceService {
    /*
     * 查询被推荐的视频
     * */
    List<Movice> showMovice();
    /*
     * 根据id播放不同的movice
     * */
    Movice playMovice(Integer id);
    /*
    * 根据名称查询movice
    * */
    List<Movice> findMovice(String c);
    /*
     * 查询所有的movice
     * */
    List<Movice> findAllMovice();
    /*
     * 展示封面的movice
     * */
    List<Movice> findCover();
    /*
    * 分页展示
    * */
    PageInfo<Movice> findPage(Integer Page, Integer Size);
    /*
    * 分页条件展示
    * */
    PageInfo<Movice> findSortPage(String c,Integer Page, Integer Size);
    /*
     * 获取播放信息的同时获取评论信息
     * */
    List <Movice> playAndComment(Integer id);
    /*
     * 获取视频总条数
     * */
    Integer countMovices();
    /*
    * 获取所有的视频信息
    * */
    PageInfo<Movice> findAll(Integer Page,Integer Size);
    /*
    * 删除操作
    * */
    boolean deleteMovice(Integer mid);
    /*
     * 将视频设置为热门推荐
     * */
    boolean setMovice(Integer mid);
    /*
     * 将视频取消热门推荐
     * */
    boolean normalMovice(Integer mid);
    /*
    * */
    boolean changeMovice(Movice movice);
    Movice findMoviceById(Integer mid);
}
