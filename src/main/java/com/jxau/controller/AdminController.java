package com.jxau.controller;

import com.github.pagehelper.PageInfo;
import com.jxau.domain.Comment;
import com.jxau.domain.Movice;
import com.jxau.domain.User;
import com.jxau.service.CommentService;
import com.jxau.service.MoviceService;
import com.jxau.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private MoviceService moviceService;

    @Autowired
    private CommentService commentService;

    @RequestMapping("/login")
    public String adminLogin() {
        return "admin/login";
    }

    /*
     * 判断是否时管理员
     * */
    @RequestMapping("/in")
    @ResponseBody
    public boolean admin(User user,HttpSession session) {
        User admin = userService.findAdmin(user);
        if (admin!=null) {
            session.setAttribute("admin",admin);
            return true;
        } else {
            return false;
        }
    }

    /*
     * 通过控制器来显示相应的页面
     * */
    @RequestMapping("/adminIndex")
    public String index(HttpSession session) {
        session.setAttribute("userCounts",userService.countUsers());
        session.setAttribute("moviceCounts",moviceService.countMovices());
        session.setAttribute("commentCounts",commentService.countComments());
        return "admin/adminIndex";
    }

    /*
     * 访问用户管理页面
     * */
    @RequestMapping("/manage_user")
    public ModelAndView user(@RequestParam(defaultValue = "1") Integer Page,
                             @RequestParam(defaultValue = "6") Integer Size) {
        PageInfo<User> userList = userService.findAll(Page,Size);
        return new ModelAndView("admin/manage_user","userPageInfo",userList);
    }

    /*
     * 访问视频管理页面
     * */
    @RequestMapping("/manage_movice")
    public ModelAndView movice(@RequestParam(defaultValue = "1") Integer Page,
                               @RequestParam(defaultValue = "6") Integer Size) {
        PageInfo<Movice> moviceList = moviceService.findAll(Page,Size);
        return new ModelAndView("admin/manage_movice","movicePageInfo",moviceList);
    }

    /*
     * 访问评论管理页面
     * */
    @RequestMapping("/manage_comment")
    public ModelAndView comment(@RequestParam(defaultValue = "1") Integer Page,
                               @RequestParam(defaultValue = "10") Integer Size) {
        PageInfo<Comment> commentList = commentService.findAll(Page,Size);
        return new ModelAndView("admin/manage_comment","commentPageInfo",commentList);
    }
    /*
    * 管理员访问个人信息修改页面
    * */
    @RequestMapping("/admin_changeInfo")
    public String changeInfo(Integer id,HttpSession session){
        User user = userService.findById(id);
        session.setAttribute("user",user);
        return "admin/admin_changeInfo";
    }
    /*
    * 修改用户信息后接收数据
    * */
    @RequestMapping("/adminInfo")
    public String changeInfo(User user){
        userService.updateAdmin(user);
        return "admin/adminIndex";
    }
    /*
    * 管理员修改密码
    * */
    @RequestMapping("/admin_changePass")
    public String changeInfo(){
        return "admin/admin_changePass";
    }
    /*
    * admin修改密码
    * */
    @RequestMapping("/changePass")
    public String changePass(User user){
        userService.updatePass(user);
        return "admin/adminIndex";
    }
    /*
    * 删除评论
    * */
    @RequestMapping("/deleteComment")
    @ResponseBody
    public boolean deleteComment(Integer cid){
       return commentService.deleteComment(cid);
    }
    /*
    * 删除视频
    * */
    @RequestMapping("/deleteMovice")
    @ResponseBody
    public boolean deleteMovice(Integer mid){
        return moviceService.deleteMovice(mid);
    }
    /*
    * 删除用户
    * */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public boolean deleteUser(Integer uid){
        return userService.deleteUser(uid);
    }
    /*
    * 将视频设置为热门
    * */
    @RequestMapping("/setMovice")
    @ResponseBody
    public boolean setMovice(Integer mid){
        return moviceService.setMovice(mid);
    }
    /*
    * 将视频取消热门
    * */
    @RequestMapping("/normalMovice")
    @ResponseBody
    public boolean normalMovice(Integer mid){
        return moviceService.normalMovice(mid);
    }
    /*
    * 将用户设置为管理员
    * */
    @RequestMapping("/setAdmin")
    @ResponseBody
    public boolean setAdmin(Integer uid){
        return userService.setAdmin(uid);
    }
    /*
    * 将取消管理员
    * */
    @RequestMapping("/cancelAdmin")
    @ResponseBody
    public boolean cancelAdmin(Integer uid){
        if (uid==1){
            return false;
        }else{

            return userService.cancelAdmin(uid);
        }
    }
    @RequestMapping("/changeMovice")
    public String movice(Integer mid,HttpSession session){
        Movice moviceById = moviceService.findMoviceById(mid);
        session.setAttribute("movice",moviceById);
        return "admin/changeMovice";
    }
    /*
    * 修改视频信息
    * */
    @RequestMapping("/fileupload")
    public String changeMovice(Integer mid,String mname,String introduction,MultipartFile upload1,MultipartFile upload2) throws IOException {
        String path1 = "D:\\apk\\CodeProject\\Code\\src\\main\\webapp\\WEB-INF\\static\\movice\\";
        String path2 = "D:\\apk\\CodeProject\\Code\\src\\main\\webapp\\WEB-INF\\static\\movice\\cover\\";
        String apath1= "../static/movice/";
        String apath2= "../static/movice/cover/";

        //视频
        //获取上传文件的名称
        String filename1 = upload1.getOriginalFilename();
        //把文件名称设置成唯一值 通过uuid
        String uuid1 = UUID.randomUUID().toString().replace("-", "");
        filename1 = uuid1 + "_" + filename1;
        //完成文件上传
        upload1.transferTo(new File(path1, filename1));
        System.out.println(path1);
        String realPath1 = apath1 + filename1;

        //视频封面
        //获取上传文件的名称
        String filename2 = upload2.getOriginalFilename();
        //把文件名称设置成唯一值 通过uuid
        String uuid2 = UUID.randomUUID().toString().replace("-", "");
        filename2 = uuid2 + "_" + filename2;
        //完成文件上传
        upload2.transferTo(new File(path2, filename2));
        System.out.println(path2);
        String realPath2 = apath2 + filename2;

        Movice movice = new Movice();
        movice.setMid(mid);
        movice.setMname(mname);
        movice.setMovice_path(realPath1);
        movice.setMovice_cover(realPath2);
        movice.setIntroduction(introduction);
        moviceService.changeMovice(movice);


        return "admin/adminIndex";
    }

}
