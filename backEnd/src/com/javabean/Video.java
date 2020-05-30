package com.javabean;

public class Video {
    private int id;
    private String title;
    private String intro;
    private String videoUrl;
    private String coverUrl;
    private String maskVideo;

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getIntro() {
        return intro;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public String getCoverUrl() {
        return coverUrl;
    }

    public String getMaskVideo() {
        return maskVideo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    public void setMaskVideo(String maskVideo) {
        this.maskVideo = maskVideo;
    }

    @Override
    public String toString() {
        return "Video{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", intro='" + intro + '\'' +
                ", videoUrl='" + videoUrl + '\'' +
                ", coverUrl='" + coverUrl + '\'' +
                ", maskVideo='" + maskVideo + '\'' +
                '}';
    }
}
