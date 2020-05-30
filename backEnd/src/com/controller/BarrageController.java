package com.controller;

import com.dao.BarrageDao;
import com.dao.VideoDao;
import com.javabean.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import com.util.DateUtils;
@Controller
public class BarrageController {

    public void transformAtoB(int barrageId, int from, int to) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BarrageDao dao = (BarrageDao) context.getBean("dao");
        ArrayList<Barrage> barrageList = dao.selectById(barrageId, from);
        for (Barrage barrage : barrageList) {
            dao.addBarrage(barrage, to);
            dao.deleteBarrage(barrage.getBarrageId(), from);
        }
    }

    @RequestMapping(value = "passBarrage.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public void passBarrage(int barrageId) {
        transformAtoB(barrageId, 1, 2);
    }

    @RequestMapping(value = "unPassBarrage.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public void unPassBarrage(int barrageId) {
        transformAtoB(barrageId, 1, 3);
    }

    @RequestMapping(value = "undoPass.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public void undoPass(int barrageId) {
        transformAtoB(barrageId, 2, 1);
    }

    @RequestMapping(value = "deleteUnpass.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public void deleteUnpass(int barrageId) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BarrageDao dao = (BarrageDao) context.getBean("dao");
        ArrayList<Barrage> barrageList = dao.selectById(barrageId, 3);
        for (Barrage barrage : barrageList) {
            dao.deleteBarrage(barrage.getBarrageId(), 0);
            dao.deleteBarrage(barrage.getBarrageId(), 3);
        }
    }

//    获取目前播放视频的已通过的弹幕，并且排好序
    @RequestMapping(value = "getbarrage.do", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public List<Barrage> getbarrage() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        VideoDao videodao = (VideoDao) context.getBean("videoDao");
        Video video = videodao.getPlayingVideo();
        int videoId=video.getId();
        BarrageDao dao = (BarrageDao) context.getBean("dao");
        ArrayList<Barrage> barrageList = dao.getBarrageByVideoId(2,videoId);

        List<Barrage> barrages = new ArrayList<Barrage>(barrageList);
        barrages.sort((o1, o2) -> Float.compare(
                Float.parseFloat(o1.getVideoTime() == null ? "0" : o1.getVideoTime()),
                Float.parseFloat(o2.getVideoTime() == null ? "0" : o2.getVideoTime()))
        );
        return barrages;
    }

//    获取所有弹幕（不区分视频）
    @RequestMapping(value = "getbarrages.do", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public ArrayList<Barrage> getbarrages(int k) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BarrageDao dao = (BarrageDao) context.getBean("dao");
        return dao.getAllBarrage(k);
    }

    @RequestMapping(value = "")
    @ResponseBody
    public String getText() {
        return "hello world";
    }



}