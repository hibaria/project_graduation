package com.controller;

import com.dao.BarrageDao;
import com.dao.VideoDao;
import com.javabean.Barrage;
import com.javabean.Signature;
import com.javabean.Video;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Random;

@Controller
public class VideoController {
    @RequestMapping(value = "GetUgcUploadSign.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public String GetUgcUploadSign() {
        Signature sign = new Signature();
        sign.setSecretId("AKIDIMBmX3uUN1PYQ2okjTxBAu42kDQdscDZ");
        sign.setSecretKey("aw2sSt4ze3WkhP0d0KC2cx2C6uSkpfGc");
        sign.setCurrentTime(System.currentTimeMillis() / 1000);
        sign.setRandom(new Random().nextInt(java.lang.Integer.MAX_VALUE));
        sign.setSignValidDuration(3600 * 24 * 2);
        try {
            return sign.getUploadSignature();
        } catch (Exception e) {
            System.out.print("获取签名失败");
            e.printStackTrace();
            return "";
        }
    }

    @RequestMapping(value = "SubmitUpload.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.GET)
    public String SubmitUpload(@RequestParam("title") String title, @RequestParam("introduction") String introduction, @RequestParam("videoUrl") String videoUrl,@RequestParam("coverUrl") String coverUrl) {
        Video video=new Video();
        video.setTitle(title);
        video.setIntro(introduction);
        video.setVideoUrl(videoUrl);
        video.setCoverUrl(coverUrl);
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        VideoDao dao = (VideoDao)context.getBean("videoDao");
        int k = dao.getMaxIdInVideoList() + 1;
        video.setId(k);
        dao.addVideo(video);
//        重定向
        return "redirect:http://localhost:8080/BarrageProject//videoManage/video-list.jsp";
    }

    @RequestMapping(value = "ReplacePlayingVideo.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public void ReplacePlayingVideo(int id){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        VideoDao dao = (VideoDao)context.getBean("videoDao");
        ArrayList<Video> videoList = dao.selectById(id);
        for (Video video : videoList) {
            dao.deletePlayingVideo();
            dao.addPlayingVideo(video);
        }
    }

}