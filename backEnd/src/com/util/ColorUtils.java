package com.util;

import java.util.Random;

public class ColorUtils {

    /** 获取指定长度的16进制字符串. */
    public static String randomHexStr(int len) {
        try {
            StringBuffer result = new StringBuffer();
            for(int i=0;i<len;i++) {
                //随机生成0-15的数值并转换成16进制
                result.append(Integer.toHexString(new Random().nextInt(9)+6));
            }
            return result.toString().toUpperCase();
        } catch (Exception e) {
            System.out.println("获取16进制字符串异常，返回默认...");
            return "00CCCC";
        }
    }

    public static String randomColor() {
        String color = randomHexStr(6);
        return "#"+color;
    }




}
