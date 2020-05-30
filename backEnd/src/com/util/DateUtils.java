package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期处理
 * @author liangkesai
 * @date 2018/8/13 12:41
 */
public class DateUtils {


    /**
     * 秒转时分
     * 28800 ->  08:00
     * @param time
     * @return
     */
    public static String secToTime(int time) {
        StringBuilder stringBuilder = new StringBuilder();
        Integer hour = time / 3600;
        Integer minute = time / 60 % 60;
        Integer second = time % 60;
        if(hour<10){
            stringBuilder.append("0");
        }
        stringBuilder.append(hour);
        stringBuilder.append(":");
        if(minute < 10){
            stringBuilder.append("0");
        }
        stringBuilder.append(minute);
        stringBuilder.append(":");
        if(second<10){
            stringBuilder.append("0");
        }
        stringBuilder.append(second);
        return stringBuilder.toString();
    }


    /**
     * 时分转秒
     * 08:00 -> 28800
     * @param time
     * @return
     */
    public static int secToTime(String time) {
        String[] str = time.split(":");
        Integer hour = Integer.valueOf(str[0]);
        Integer minute = Integer.valueOf(str[1]);
        Integer second = 0;
        second = second + hour * 3600;
        second = second + minute * 60;
        return second;
    }

}