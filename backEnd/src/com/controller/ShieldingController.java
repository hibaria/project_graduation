package com.controller;

import com.dao.ShieldingDao;
import com.javabean.Barrage;
import com.javabean.Shielding;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class ShieldingController {
    @RequestMapping(value = "addShieldingVocabulary.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public void addShieldingVocabulary(@RequestParam("vocabulary") String vocabulary){
        Shielding shielding=new Shielding();
        shielding.setVocabulary(vocabulary);
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        ShieldingDao dao = (ShieldingDao)context.getBean("shieldingDao");
        int k = dao.getMaxId() + 1;
        shielding.setId(k);
        dao.addVocabulary(shielding);
    }

    @RequestMapping(value = "delVocabulary.do", produces = "text/plain;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public void delVocabulary(@RequestParam("id") int id){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        ShieldingDao dao = (ShieldingDao)context.getBean("shieldingDao");
        dao.delete(id);
    }

}
