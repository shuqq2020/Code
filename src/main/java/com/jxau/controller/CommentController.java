package com.jxau.controller;

import com.jxau.domain.Comment;
import com.jxau.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
/*    @RequestMapping("/save")
    public String saveComment(Comment comment) {

        if (comment.getUser_id() == null) {
            return "false";
        } else {
            comment.setTime(new Date());
            commentService.saveComment(comment);
            return "movicePlay";
        }
    }*/

    @RequestMapping("/save")
    public ModelAndView saveComment(Comment comment) {

            comment.setTime(new Date());
            commentService.saveComment(comment);
            return new ModelAndView("redirect:/movice/play?id="+comment.getMovice_id());
    }


}
