package com.util;

import com.google.gson.Gson;
import com.javabean.*;
import net.sf.json.JSONArray;

import java.util.ArrayList;

public class JsonUtil {
    private static Gson gson = new Gson();


    /**
     * @param barrageList :将要被转化的对象
     * @return :转化后的JSON串
     * @MethodName : ArrayListToJsonArray
     * @Description : 将对象数组转为JSON数组，此方法能够满足大部分需求
     */
    public static JSONArray ArrayListToJsonArray(ArrayList<Barrage> barrageList) {
        JSONArray jsonArrayRow = new JSONArray();
        for (Barrage barrage : barrageList) {
            String info=gson.toJson(barrage);
            jsonArrayRow.add(info);
            System.out.println(info);
        }
        return jsonArrayRow;
    }
}
