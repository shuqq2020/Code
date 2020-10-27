package com.jxau.service;

import com.github.pagehelper.PageInfo;
import com.jxau.domain.Comment;

public interface CommentService {
    /*
    * 插入一条评论
    * */
    boolean saveComment(Comment comment);
    /*
     * 计算总评论
     * */
    Integer countComments();
    /*
    * 查询所有评论
    * */
    PageInfo<Comment> findAll(Integer Page,Integer Size);
    /*
     * 删除评论
     * */
    boolean deleteComment(Integer cid);
}
