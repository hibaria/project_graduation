package com.javabean;

public class Barrage {
    private int barrageId;
    private int videoId;
    private String userName;
    private String content;
    private String currentDate;
    private String videoTime;
    private String videoTimeText;
    private String avatars;
    private String barrageType;
    private String barrageTypeText;
    private int times;

    public Barrage() {
    }


    public int getBarrageId() {
        return barrageId;
    }

    public int getVideoId() {
        return videoId;
    }

    public String getUserName() {
        return userName;
    }

    public String getContent() {
        return content;
    }

    public String getCurrentDate() {
        return currentDate;
    }

    public String getVideoTime() {
        return videoTime;
    }

    public String getVideoTimeText() {
        return videoTimeText;
    }

    public String getAvatars() {
        return avatars;
    }

    public String getBarrageType() {
        return barrageType;
    }

    public String getBarrageTypeText() {
        return barrageTypeText;
    }

    public int getTimes() {
        return times;
    }


    public void setBarrageId(int barrageId) {
        this.barrageId = barrageId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCurrentDate(String currentDate) {
        this.currentDate = currentDate;
    }

    public void setVideoTime(String videoTime) {
        this.videoTime = videoTime;
    }

    public void setVideoTimeText(String videoTimeText) {
        this.videoTimeText = videoTimeText;
    }

    public void setAvatars(String avatars) {
        this.avatars = avatars;
    }

    public void setBarrageType(String barrageType) {
        this.barrageType = barrageType;
    }

    public void setBarrageTypeText(String barrageTypeText) {
        this.barrageTypeText = barrageTypeText;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    @Override
    public String toString() {
        return "Barrage{" +
                "barrageId=" + barrageId +
                ", videoId=" + videoId +
                ", userName='" + userName + '\'' +
                ", content='" + content + '\'' +
                ", currentDate='" + currentDate + '\'' +
                ", videoTime='" + videoTime + '\'' +
                ", videoTimeText='" + videoTimeText + '\'' +
                ", avatars='" + avatars + '\'' +
                ", barrageType='" + barrageType + '\'' +
                ", barrageTypeText='" + barrageTypeText + '\'' +
                ", times=" + times +
                '}';
    }
}
