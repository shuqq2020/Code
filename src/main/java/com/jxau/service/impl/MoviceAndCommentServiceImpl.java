package com.jxau.service.impl;

import com.jxau.dao.MoviceAndCommentDao;
import com.jxau.domain.MoviceAndComment;
import com.jxau.service.MoviceAndCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("moviceAndCommentServiceImpl")
public class MoviceAndCommentServiceImpl implements MoviceAndCommentService {
    @Autowired
    private MoviceAndCommentDao moviceAndCommentDao;
    @Override
    public List<MoviceAndComment> findComment(Integer id) {
        return moviceAndCommentDao.findComment(id);
    }
}
