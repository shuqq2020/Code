package com.jxau.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Movice implements Serializable {
    private Integer mid;
    private String mname;
    private String movice_path;
    private String movice_cover;
    private Date time;
    private String introduction;
    private Integer look;
    private Integer recommend;
    private List<Comment> commentList;

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMovice_path() {
        return movice_path;
    }

    public void setMovice_path(String movice_path) {
        this.movice_path = movice_path;
    }

    public String getMovice_cover() {
        return movice_cover;
    }

    public void setMovice_cover(String movice_cover) {
        this.movice_cover = movice_cover;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Integer getLook() {
        return look;
    }

    public void setLook(Integer look) {
        this.look = look;
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }

    @Override
    public String toString() {
        return "Movice{" +
                "mid=" + mid +
                ", mname='" + mname + '\'' +
                ", movice_path='" + movice_path + '\'' +
                ", movice_cover='" + movice_cover + '\'' +
                ", time=" + time +
                ", introduction='" + introduction + '\'' +
                ", look=" + look +
                ", recommend=" + recommend +
                ", commentList=" + commentList +
                '}';
    }
}
