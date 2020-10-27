package com.jxau.service;

import com.jxau.domain.MoviceAndComment;

import java.util.List;

public interface MoviceAndCommentService {
    /*查询电影以及下面的评论
    * */
    List<MoviceAndComment> findComment(Integer id);
}
