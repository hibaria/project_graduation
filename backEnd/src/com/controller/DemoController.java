package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

//用于测试小程序与后台连接
@Controller
public class DemoController {
//    @RequestMapping(value = "/index", method = RequestMethod.GET)
////    public String printWelcome(ModelMap model) {
////        model.addAttribute("message", "Spring MVC-Hello World");
////        return "";
////    }

    @RequestMapping("getUser.do")
    @ResponseBody
    public List<String> getUser() {
        List<String> list = new ArrayList<>();
        list.add("江南大学");
        list.add("1604");
        list.add("郑明霞");
        return list;
    }

}