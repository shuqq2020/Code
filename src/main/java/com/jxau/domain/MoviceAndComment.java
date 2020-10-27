package com.jxau.domain;

import java.io.Serializable;
import java.util.Date;

public class MoviceAndComment implements Serializable {
    private Integer mid;
    private String username;
    private String manme;
    private String movice_path;
    private String movice_cover;
    private String content;
    private Date time;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getManme() {
        return manme;
    }

    public void setManme(String manme) {
        this.manme = manme;
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
        return "MoviceAndComment{" +
                "mid=" + mid +
                ", username='" + username + '\'' +
                ", manme='" + manme + '\'' +
                ", movice_path='" + movice_path + '\'' +
                ", movice_cover='" + movice_cover + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                '}';
    }
}
