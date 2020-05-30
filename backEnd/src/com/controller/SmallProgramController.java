package com.controller;

import com.dao.BarrageDao;
import com.dao.ShieldingDao;
import com.dao.VideoDao;
import com.javabean.*;
import com.util.DateUtils;
import org.python.core.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.awt.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

import org.python.util.PythonInterpreter;

import static com.util.ColorUtils.randomColor;

@Controller
public class SmallProgramController {
    @RequestMapping(value = "postBarrage.do", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String postBarrage(int videoId,String userName, String content, String avatars, String currentDate, String videoTime, String barrageType, int times) {
        Barrage barrage = new Barrage();
        barrage.setVideoId(videoId);
        barrage.setUserName(userName);
        barrage.setContent(content);
        barrage.setCurrentDate(currentDate);
        barrage.setVideoTime(videoTime);
        barrage.setAvatars(avatars);
        barrage.setBarrageType(barrageType);
        barrage.setTimes(times);
        switch (barrageType) {
            case "normal":
                barrage.setBarrageTypeText("普通弹幕");
                break;
            case "bubble":
                barrage.setBarrageTypeText("气泡弹幕");
                break;
            case "bigBubble":
                barrage.setBarrageTypeText("大号气泡");
                break;
            case "emoji":
                barrage.setBarrageTypeText("表情");
                break;
            case "pic":
                barrage.setBarrageTypeText("图片");
                break;
            default:
                barrage.setBarrageTypeText("普通弹幕");
                break;
        }
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        BarrageDao dao = (BarrageDao) context.getBean("dao");
        int k = dao.getMaxIdInBarrageNormal() + 1;
        barrage.setBarrageId(k);
        String sendTime = DateUtils.secToTime(Integer.parseInt(videoTime));
        barrage.setVideoTimeText(sendTime);
        dao.addBarrage(barrage, 0);
//        System.out.println(barrage.toString());
//        如果是普通/气泡弹幕，遍历屏蔽词，做字符串匹配，如包含屏蔽词，则将其加入不通过，直接返回
        if(barrageType.equals("normal")|| barrageType.equals("bubble") || barrageType.equals("bigBubble")){
            ShieldingDao shieldingDao = (ShieldingDao)context.getBean("shieldingDao");
            ArrayList<Shielding> shieldingVocabulary=shieldingDao.getAll();
            for (Shielding thisShielding : shieldingVocabulary) {
                String patternStr=thisShielding.getVocabulary();
                if(barrage.getContent().contains(patternStr)){
                    dao.addBarrage(barrage, 3);
                    return barrage.getUserName() + "成功发送弹幕，出现屏蔽词汇直接屏蔽";
                }
            }

            //利用情感分析进行过滤
            Process proc;
            String sentence = barrage.getContent();
            try {
                //注意这里用的是绝对路径，如果拷到别的地方要换成对应的路径
                String[] args1 = new String[] { "python", "E:\\BarrageProject\\SentimentPolarityAnalysis\\classifiers.py", sentence};
                proc = Runtime.getRuntime().exec(args1);// 执行py文件
                //用输入输出流来截取结果
                BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream(),"GB2312"));
                String line = null;
                line = in.readLine();
                System.out.println(line);
                in.close();
                proc.waitFor();
                if(Float.parseFloat(line)>=0) {
                    dao.addBarrage(barrage, 2);
                    return barrage.getUserName() + "成功发送弹幕，弹幕通过情感分析审核";
                }
            } catch (IOException | InterruptedException e) {
                e.printStackTrace();
            }
        }
        // 如果是表情弹幕，直接通过
        else if(barrageType.equals("emoji")){
            dao.addBarrage(barrage, 2);
            return barrage.getUserName() + "成功发送弹幕，表情弹幕直接通过";
        }
//        否则，加入待审核
        dao.addBarrage(barrage, 1);
        return barrage.getUserName() + "成功发送弹幕";
    }

    @RequestMapping("getPlayingVideo.do")
    @ResponseBody
    public Video getPlayingVideo(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        VideoDao dao = (VideoDao) context.getBean("videoDao");
        Video video = dao.getPlayingVideo();
//        System.out.println(video.toString());
        return video;
    }

    @RequestMapping("getBarrageToSmallProgram.do")
    @ResponseBody
    public ArrayList<SmallProgramBarrage> getBarrageToSmallProgram(){
        ApplicationContext context = new ClassPathXmlApplicationContext("application" +
                "Context.xml");
        VideoDao videodao = (VideoDao) context.getBean("videoDao");
        Video video = videodao.getPlayingVideo();
        int videoId=video.getId();
        BarrageDao dao = (BarrageDao) context.getBean("dao");
        ArrayList<Barrage> barrageList = dao.getBarrageByVideoId(2,videoId);
        ArrayList<SmallProgramBarrage> barrages=new ArrayList<SmallProgramBarrage>();
        barrageList.sort((o1, o2) -> Float.compare(
                Float.parseFloat(o1.getVideoTime() == null ? "0" : o1.getVideoTime()),
                Float.parseFloat(o2.getVideoTime() == null ? "0" : o2.getVideoTime()))
        );
        for(Barrage thisBarrage:barrageList){
            if(thisBarrage.getBarrageType().equals("pic")||thisBarrage.getBarrageType().equals("emoji"));
            else {
                SmallProgramBarrage barrage = new SmallProgramBarrage();
                barrage.setText(thisBarrage.getContent());
                barrage.setColor(randomColor());
                barrage.setTime(Integer.parseInt(thisBarrage.getVideoTime()));
                barrages.add(barrage);
            }
        }
        return barrages;
    }

    @RequestMapping("getBarrage2ToSmallProgram.do")
    @ResponseBody
    public ArrayList<SmallProgramBarrage2> getBarrage2ToSmallProgram(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        VideoDao videodao = (VideoDao) context.getBean("videoDao");
        Video video = videodao.getPlayingVideo();
        int videoId=video.getId();
        BarrageDao dao = (BarrageDao) context.getBean("dao");
        ArrayList<Barrage> barrageList = dao.getBarrageByVideoId(2,videoId);
        Collections.sort(barrageList, new Comparator<Barrage>(){
            @Override
            public int compare(Barrage o1, Barrage o2) {
                if (o1.getCurrentDate() == null || o2.getCurrentDate() == null)
                    return 0;
                else
                    return o1.getCurrentDate().compareTo(o2.getCurrentDate());
            }
        });

        ArrayList<SmallProgramBarrage2> barrages=new ArrayList<SmallProgramBarrage2>();
        for(Barrage thisbarrage:barrageList){
            SmallProgramBarrage2 barrage=new SmallProgramBarrage2();
            barrage.setAvatars(thisbarrage.getAvatars());
            barrage.setContent(thisbarrage.getContent());
            barrage.setName(thisbarrage.getUserName());
            barrage.setData(thisbarrage.getCurrentDate());//发送日期
            barrage.setBarrageType(thisbarrage.getBarrageType());
//            System.out.println(barrage);
            barrages.add(barrage);
        }
        return barrages;
    }



}
