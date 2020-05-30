package com.javabean;
//小程序中的弹幕的格式
public class SmallProgramBarrage {
    private String text;
    private String color;
    private int time;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "SmallProgrameBarrage{" +
                "text='" + text + '\'' +
                ", color='" + color + '\'' +
                ", time=" + time +
                '}';
    }
}
