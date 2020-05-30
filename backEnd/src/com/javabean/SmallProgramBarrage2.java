package com.javabean;

public class SmallProgramBarrage2 {
    private String avatars;
    private String content;
    private String name;
    private String data;
    private String barrageType;

    public String getAvatars() {
        return avatars;
    }

    public void setAvatars(String avatars) {
        this.avatars = avatars;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getData() {
        return data;
    }

    public void setData(String time) {
        this.data = time;
    }

    public String getBarrageType() {
        return barrageType;
    }

    public void setBarrageType(String barrageType) {
        this.barrageType = barrageType;
    }

    @Override
    public String toString() {
        return "SmallProgramBarrage2{" +
                "avatars='" + avatars + '\'' +
                ", content='" + content + '\'' +
                ", name='" + name + '\'' +
                ", data='" + data + '\'' +
                ", barrageType='" + barrageType + '\'' +
                '}';
    }
}
