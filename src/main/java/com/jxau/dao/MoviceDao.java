package com.jxau.dao;


import com.jxau.domain.Movice;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface MoviceDao {
    /*
    * 查询被推荐的视频
    * */
    List<Movice> showMovice();
    /*
    * 根据id播放不同的movice
    * */
    Movice playMovice(Integer id);
    /*
    * 根据不同的名称查询不同的movice
    * */
    List<Movice> findMovice(String name);
    /*
    * 查询所有的movice
    * */
    List<Movice> findAllMovice();
    /*
    * 展示封面的movice
    * */
    List<Movice> findCover();
    /*
    * 获取播放信息的同时获取评论信息
    * */
    List <Movice> playAndComment(Integer id);
    /*
     * 获取评论总条数
     * */
    Integer countMovices();
    /*
    * 获取所有的movice
    * */
    List<Movice> findAll();
    /*
    * 删除视频
    * */
    Integer deleteMovice(Integer mid);
    /*
    * 将视频设置为热门推荐
    * */
    boolean setMovice(Integer mid);
    /*
    * 将视频取消热门推荐
    * */
    boolean normalMovice(Integer mid);
    /*
    *修改视频
    * */
    boolean changeMovice(Movice movice);
    /*
    * 通过id获取movice
    * */
    Movice findMoviceById(Integer mid);
}
