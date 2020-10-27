package com.jxau.dao;

import com.jxau.domain.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {
    /*
    * 新增一条评论
    * */
    boolean saveComment(Comment comment);
    /*
    * 计算总评论
    * */
    Integer countComments();
    /*
    * 查询所有comment
    * */
    List<Comment> findAll();
    /*
    * 删除评论
    * */
    Integer deleteComment(Integer cid);
}
