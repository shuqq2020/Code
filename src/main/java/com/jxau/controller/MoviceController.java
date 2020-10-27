package com.jxau.controller;

import com.github.pagehelper.PageInfo;
import com.jxau.domain.Movice;
import com.jxau.domain.MoviceAndComment;
import com.jxau.service.MoviceAndCommentService;
import com.jxau.service.MoviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/movice")
public class MoviceController {
    @Autowired
    private MoviceService moviceService;
    @Autowired
    private MoviceAndCommentService moviceAndCommentService;

    @RequestMapping("/show")
    public String showMovice(HttpSession session) {
        List<Movice> movices = moviceService.showMovice();
        List<Movice> covers = moviceService.findCover();
        session.setAttribute("movices", movices);
        session.setAttribute("covers", covers);
        return "index";
    }
    /*
    * 获取播放页面的所有信息     视频路径   评论等等
    * */
    @RequestMapping("/play")
    public String playMovice(Integer id, HttpSession session) {
        if (session.getAttribute("play") != null) {
            session.removeAttribute("play");
        }
        Movice play = moviceService.playMovice(id);
        List<MoviceAndComment> moviceAndComments = moviceAndCommentService.findComment(id);
        session.setAttribute("moviceAndComments",moviceAndComments);
        session.setAttribute("play", play);
        return "movicePlay";
    }


/*    @RequestMapping("/list")
    public String sortMovice(String c, HttpSession session) {
        List<Movice> alls;
        if (c == null) {
            alls = moviceService.findAllMovice();
        } else {
            alls = moviceService.findMovice("%" + c + "%");
        }
        session.setAttribute("alls", alls);
        return "list";
    }*/


    @RequestMapping("/findPage")
    public ModelAndView findPage(
                                 @RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "12") Integer pageSize,
    @RequestParam(defaultValue = "") String c) {
        System.out.println("pageNum"+pageNum+"----------------");
        PageInfo<Movice> pageInfo;
        if (c==null||c=="") {
            pageInfo = moviceService.findPage(pageNum, pageSize);
        }else{
            pageInfo = moviceService.findSortPage(c,pageNum,pageSize);
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("list");
        modelAndView.addObject("pageInfo",pageInfo);
        return modelAndView;
    }
    @RequestMapping("findSearch")
    public String findSearch(String search,HttpSession session){
        List<Movice> list = moviceService.findMovice("%"+search+"%");
        session.setAttribute("list",list);
        return "search";
    }

}
