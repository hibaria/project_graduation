package com.javabean;

public class Shielding {
    private int id;
    private String vocabulary;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVocabulary() {
        return vocabulary;
    }

    public void setVocabulary(String vocabulary) {
        this.vocabulary = vocabulary;
    }

    @Override
    public String toString() {
        return "Shielding{" +
                "id=" + id +
                ", vocabulary='" + vocabulary + '\'' +
                '}';
    }
}
