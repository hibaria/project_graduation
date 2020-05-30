package com.controller;

import com.dao.BarrageDao;
import com.dao.ShieldingDao;
import com.dao.StyleInfoDao;
import com.javabean.Barrage;
import com.javabean.Shielding;
import com.javabean.StyleInfo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Integer.parseInt;
import static java.lang.Float.parseFloat;

@Controller
public class StyleInfoController {
    @RequestMapping(value = "replaceStyleInfo.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public void replaceStyleInfo(@RequestParam("type") String type,@RequestParam("size") String size,@RequestParam("area") String area,@RequestParam("background") String background,@RequestParam("opacity") String opacity,@RequestParam("duration") String duration,@RequestParam("unitPrice") String unitPrice,@RequestParam("position") String position){
        StyleInfo styleInfo=new StyleInfo();
        styleInfo.setType(type);
        styleInfo.setSize(parseFloat(size));
        styleInfo.setArea(parseFloat(area));
        styleInfo.setBackground(background);
        styleInfo.setOpacity(parseFloat(opacity));
        styleInfo.setDuration(parseInt(duration));
        styleInfo.setUnitPrice(parseFloat(unitPrice));
        styleInfo.setPosition(position);
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StyleInfoDao dao = (StyleInfoDao)context.getBean("styleInfoDao");
        dao.replaceInto(styleInfo);
    }


    @RequestMapping(value = "getStyle.do", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public List<StyleInfo> getStyle() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StyleInfoDao dao = (StyleInfoDao) context.getBean("styleInfoDao");
        return dao.getAll();
    }

}
