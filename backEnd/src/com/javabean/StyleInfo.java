package com.javabean;

public class StyleInfo {
    private String type;
    private float size;
    private float area;
    private String background;
    private float opacity;
    private int duration;
    private float unitPrice;
    private String position;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getSize() {
        return size;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public float getArea() {
        return area;
    }

    public void setArea(float area) {
        this.area = area;
    }

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public float getOpacity() {
        return opacity;
    }

    public void setOpacity(float opacity) {
        this.opacity = opacity;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return "StyleInfo{" +
                "type='" + type + '\'' +
                ", size=" + size +
                ", area=" + area +
                ", background='" + background + '\'' +
                ", opacity=" + opacity +
                ", duration=" + duration +
                ", unitPrice=" + unitPrice +
                ", position='" + position + '\'' +
                '}';
    }
}
