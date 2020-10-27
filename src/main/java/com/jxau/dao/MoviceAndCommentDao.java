package com.jxau.dao;

import com.jxau.domain.MoviceAndComment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MoviceAndCommentDao {
    /*
    * 查询电影及其下面的评论
    * */
    List<MoviceAndComment> findComment(Integer id);
}
