package com.jxau.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Comment implements Serializable {
    private Integer cid;
    private Integer user_id;
    private Integer movice_id;
    private String content;
    private Date time;
    private List<User> userList;

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getMovice_id() {
        return movice_id;
    }

    public void setMovice_id(Integer movice_id) {
        this.movice_id = movice_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cid=" + cid +
                ", user_id=" + user_id +
                ", movice_id=" + movice_id +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", userList=" + userList +
                '}';
    }
}
