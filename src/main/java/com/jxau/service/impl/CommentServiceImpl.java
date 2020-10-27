package com.jxau.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxau.dao.CommentDao;
import com.jxau.domain.Comment;
import com.jxau.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;
    @Override
    public boolean saveComment(Comment comment) {

        return commentDao.saveComment(comment);
    }

    @Override
    public Integer countComments() {
        return commentDao.countComments();
    }

    @Override
    public PageInfo<Comment> findAll(Integer Page, Integer Size) {
        PageHelper.startPage(Page,Size);
        List<Comment> list = commentDao.findAll();
        PageInfo<Comment> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public boolean deleteComment(Integer cid) {
        Integer integer = commentDao.deleteComment(cid);
        if (integer>0){
            return true;
        }else{
            return false;
        }
    }
}
