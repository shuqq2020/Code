package com.jxau.controller;

import com.jxau.domain.User;
import com.jxau.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/save",method = RequestMethod.POST )
    @ResponseBody
    public  boolean saveUser(User user) {
        if (user.getEmail()!=""||user.getEmail()!=null) {
            if (userService.findByEmail(user.getEmail())) {
                boolean bool = userService.saveUser(user);
                System.out.println(bool);
                return true;
            } else {
                return false;
            }
        }else{
            return false;
        }

    }
    @RequestMapping(value = "/login",method = RequestMethod.POST )
    @ResponseBody
    public boolean loginUser(User user,HttpSession session) {
        User user1 = userService.findUser(user);
        if(user1!=null){
            session.setAttribute("user",user1);
            return true;
        }else{
            return false;
        }
    }
    @RequestMapping("/clean")
    @ResponseBody
    public void cleanUser(HttpSession session){
        session.removeAttribute("user");
        return ;
    }
    @RequestMapping("/success")
    public String succ(){
        return "success";
    }
    @RequestMapping("/false")
    public String fal(){
        return "false";
    }
    @RequestMapping("/index")
    public String showindex(){
        return "index";
    }
    @RequestMapping("/introduce")
    public String showintroduce(){
        return "introduce";
    }

}
