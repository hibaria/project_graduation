<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.dao.BarrageDao" %>
<%@ page import="com.javabean.Barrage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.javabean.Video" %>
<%@ page import="com.dao.VideoDao" %>
<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2020/2/26
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="./css/other-manage.css" type="text/css">
    <link rel="stylesheet" href="./css/input-style.css" type="text/css">
    <link rel="stylesheet" href="./css/preview-box.css" type="text/css">
    <link rel="shortcut icon" href="../img/barrage-back.ico" type="image/x-icon"/>
    <script type="text/javascript" src="./js/jQuery-3.4.1.js"></script>
    <title>弹幕管理-星弹幕,把跨界互动变为现实</title>
    <script type="text/javascript">
        var maxWidth = window.screen.width;
    </script>
</head>
<body style="margin:0">
<div class="cc-header">
    <div class="header">
        <div class="left-block">
            <a href="http://localhost:8080/BarrageProject/manage-index.jsp">
                <img herf="" src="../img/title.png" class="logo"></img>
            </a>
            <a href="http://localhost:8080/BarrageProject/index.jsp" target="_blank" class="main-site">
                <img src="../img/main-site.png" class="icon"></img>
                网站首页
            </a>
        </div>
        <div class="right-block">
            退出登录
        </div>
    </div>
</div>
<div id="root">
    <%--    左边导航栏--%>
    <div class="cc-nav-left">
        <div class="cc-nav">
            <div class="nav-upload-btn">
                <img src="../img/upload-2.png" class="nav-upload-icon"/>
                视频上传
            </div>
            <ul class="nav-wrp">
                <a href="#">
                    <div class="nav-homePage">
                    <span class="router-item">
                        <img src="../img/home-1.png" class="menu-icon"/>
                        <span class="menu-title">
                            首页
                        </span>
                    </span>
                    </div>
                </a>
                <div class="nav-manage-barrage-container">
                    <a href="#">
                        <div class="nav-manage-barrage" id="drop-down-list1">
                    <span class="router-wrap">
                        <img src="../img/speech-bubble-1.png" class="menu-icon"/>
                        <span class="menu-title">
                            弹幕管理
                        </span>
                        <img src="../img/pull.png" class="menu-icon-pull" id="drop-down-list1-img"/>
                    </span>
                        </div>
                    </a>
                    <div class="nav-manage-barrage-group is-active" id="drop-down-list1-items">
                        <a href="../barrageManage/barrage-unChecked.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                待审弹幕
                            </span>
                            </div>
                        </a>
                        <a href="../barrageManage/barrage-passed.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                已通过弹幕
                            </span>
                            </div>
                        </a>
                        <a href="../barrageManage/barrage-unpassed.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                未通过弹幕
                            </span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="nav-manage-barrage-container">
                    <a href="#">
                        <div class="nav-manage-barrage" id="drop-down-list2">
                    <span class="router-wrap">
                        <img src="../img/video-1.png" class="menu-icon"/>
                        <span class="menu-title">
                            视频管理
                        </span>
                        <img src="../img/pull.png" class="menu-icon-pull" id="drop-down-list2-img"/>
                    </span>
                        </div>
                    </a>
                    <div class="nav-manage-barrage-group is-active" id="drop-down-list2-items">
                        <a href="../videoManage/video-player.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                正在播放
                            </span>
                            </div>
                        </a>
                        <a href="../videoManage/video-list.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                视频列表
                            </span>
                            </div>
                        </a>
                        <a href="../videoManage/video-upload.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                上传视频
                            </span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="nav-manage-barrage-container">
                    <a href="#">
                        <div class="nav-manage-barrage" id="drop-down-list3">
                    <span class="router-wrap active">
                        <img src="../img/setting-2.png" class="menu-icon"/>
                        <span class="menu-title">
                            样式设计
                        </span>
                        <img src="../img/pull.png" class="menu-icon-pull" id="drop-down-list3-img"/>
                    </span>
                        </div>
                    </a>
                    <div class="nav-manage-barrage-group is-active" id="drop-down-list3-items">
                        <a href="#">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull active">
                                文字样式
                            </span>
                            </div>
                        </a>
                        <a href="./emoji-style.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                表情样式
                            </span>
                            </div>
                        </a>
                        <a href="./img-style.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                图片样式
                            </span>
                            </div>
                        </a>
                    </div>
                </div>
                <%--                <a href="./style-design.jsp">--%>
                <%--                    <div class="nav-homePage">--%>
                <%--                        <div class="router-item">--%>
                <%--                            <img src="../img/setting-2.png" class="menu-icon"/>--%>
                <%--                            <span class="menu-title active">--%>
                <%--                            样式设计--%>
                <%--                        </span>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </a>--%>
                <a href="./filter-manage.jsp">
                    <div class="nav-homePage">
                        <div class="router-item">
                            <img src="../img/filter-1.png" class="menu-icon"/>
                            <span class="menu-title">
                            过滤管理
                        </span>
                        </div>
                    </div>
                </a>
                <a href="./user-feedback.jsp">
                    <div class="nav-homePage">
                        <div class="router-item">
                            <img src="../img/speech-bubble-1.png" class="menu-icon"/>
                            <span class="menu-title">
                            用户反馈
                        </span>
                        </div>
                    </div>
                </a>
                <script>
                    // 下拉列表的显示与隐藏
                    var select = document.getElementById("drop-down-list1");
                    select.onclick = function () {
                        if (document.getElementById("drop-down-list1-items").style.display == "") {
                            document.getElementById("drop-down-list1-items").style.display = "none";
                            $("#drop-down-list1-img").attr("src", "../img/down.png")
                        } else {
                            document.getElementById("drop-down-list1-items").style.display = "";
                            $("#drop-down-list1-img").attr("src", "../img/pull.png")
                        }
                    }
                    var select = document.getElementById("drop-down-list2");
                    select.onclick = function () {
                        if (document.getElementById("drop-down-list2-items").style.display == "") {
                            document.getElementById("drop-down-list2-items").style.display = "none";
                            $("#drop-down-list2-img").attr("src", "../img/down.png")
                        } else {
                            document.getElementById("drop-down-list2-items").style.display = "";
                            $("#drop-down-list2-img").attr("src", "../img/pull.png")
                        }
                    }
                    var select = document.getElementById("drop-down-list3");
                    select.onclick = function () {
                        if (document.getElementById("drop-down-list3-items").style.display == "") {
                            document.getElementById("drop-down-list3-items").style.display = "none";
                            $("#drop-down-list3-img").attr("src", "../img/down.png")
                        } else {
                            document.getElementById("drop-down-list3-items").style.display = "";
                            $("#drop-down-list3-img").attr("src", "../img/pull.png")
                        }
                    }
                </script>
            </ul>
            <%--            垂直和水平滚动条，没做，先不管先--%>
            <%--            <div class="simplebar-horizontal" style="visibility: hidden;">--%>
            <%--                <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>--%>
            <%--            </div>--%>
            <%--            <div class="simplebar-vertical" style="visibility: hidden;">--%>
            <%--                <div class="simplebar-scrollbar" style="height: 0px; display: none;"></div>--%>
            <%--            </div>--%>
        </div>
    </div>

    <%--主体中间部分--%>
    <div class="cc-body2">
        <div class="cc-body-main">
            <div class="body-style">
                <div class="body-style-mask"></div>
                <%--演示区域--%>
                <div class="body-style-container">
                    <div id="text-emx1" class="exm-normal-text an1" name="exm-text">
                        <text>普通弹幕</text>
                    </div>
                    <div id="text-emx2" class="exm-normal-text an2" name="exm-text">
                        <text>哇哇哇哇哇</text>
                    </div>
                    <div id="text-emx3" class="exm-normal-text an3" name="exm-text">
                        <text>顺丰九大发啊！</text>
                    </div>
                    <div id="text-emx4" class="exm-normal-text an4" name="exm-text">
                        <text>表白妈妈木！</text>
                    </div>
                    <div id="text-emx5" class="exm-normal-text an5" name="exm-text">
                        <text>第一！</text>
                    </div>
                    <div id="text-emx6" class="exm-normal-text an6" name="exm-text">
                        <text>哈哈哈哈太好笑了</text>
                    </div>
                    <div id="text-emx7" class="exm-normal-text an7" style="display: none" name="exm-text">
                        <text>o sole mio</text>
                    </div>
                    <div id="text-emx8" class="exm-normal-text an8" style="display: none" name="exm-text">
                        <text>鱼糕呜呜呜</text>
                    </div>
                    <div class="bubble-preview-exm1" id="bubble-emx1" name="bubble-exm">
                        <div style="display:flex;">
                            <div style="padding:0 10px 0 10px;">
                                <img class="bubble-exm1-ava" src="../img/avater_default.png"/>
                            </div>
                            <div>
                                <text id="bubble-exm1-name" class="bubble-exm1-name">周小垂</text>
                                <div>
                                    <text id="bubble-exm1-text" class="bubble-exm1-text">小号气泡弹幕</text>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bubble-preview-exm2" id="bubble-emx2" name="bubble-exm">
                        <div style="display:flex;">
                            <div style="padding:0 10px 0 10px;">
                                <img class="bubble-exm2-ava" src="../img/avater_default.png"/>
                            </div>
                            <div style="left:40px">
                                <text id="bubble-exm2-name" class="bubble-exm2-name">周小垂</text>
                                <div>
                                    <text id="bubble-exm2-text" class="bubble-exm2-text">大号气泡弹幕</text>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="body-style-mask"></div>
            </div>

            <%--            调整区域--%>
            <div class="body-adjustment-container">
<%--                <form>--%>
                    <div>
                        <h2 style="color: #ffba5a">
                            普通弹幕
                        </h2>
                    </div>
                    <div style="display: block;padding: 10px">
                        显示区域：
                        <input style="width: 40px;border:none;color: #2c7873;font-weight: bolder" id="normal-display"
                               value="3/4屏" readonly/>
                        <div style="margin: 10px 0">
                            <input id="input-normal-area" min="0.25" max="1" value="0.75" step="0.25" type="range" oninput="changeNormalDisplayArea(value)">
                        </div>
                    </div>
                    <div style="display: block;padding: 10px">
                        字体大小：
<%--                                                <input style="width: 40px;border:none;color: #2c7873;font-weight: bolder" id="normal-fontSize"--%>
<%--                                                       value="26pt" readonly/>--%>
<%--                                                <div style="margin: 10px 0">--%>
<%--                                                    <input min="14" max="38" step="2" type="range" oninput="changeNormalFontSize(value)">--%>
<%--                                                </div>--%>
                        <input style="width: 40px;border:none;color: #2c7873;font-weight: bolder" id="normal-fontSize"
                               value="100%" readonly/>
                        <div style="margin: 10px 0">
                            <input id="input-normal-size" min="0.5" max="1.5" step="0.05" type="range" oninput="changeNormalFontSize(value)"/>
                        </div>
                    </div>
                    <div style="display: block;padding: 10px">
                        不透明度：
                        <input style="width: 40px;border:none;color: #2c7873;font-weight: bolder" id="normal-opacity"
                               value="75%" readonly/>
                        <div style="margin: 10px 0">
                            <input id="input-normal-opacity"min="0.5" max="1" step="0.05" type="range" oninput="changeNormalOpacity(value)"/>
                        </div>
                    </div>
                    <div>
                        <h2 style="color: #ffba5a">
                            气泡弹幕
                        </h2>
                    </div>
                    <div style="display: block;padding: 10px">
                        字体大小：
                        <input style="width: 40px;border:none;color: #2c7873;font-weight: bolder" id="bubble-fontSize"
                               value="90%" readonly/>
                        <div style="margin: 10px 0">
                            <input id="input-bubble-fontSize" min="0.5" max="1.3" step="0.05" type="range" oninput="changeBubbleFontSize(value)"/>
                        </div>
                    </div>
                    <div style="display: block;padding: 10px">
                        不透明度：
                        <input style="width: 40px;border:none;color: #2c7873;font-weight: bolder" id="bubble-opacity"
                               value="75%" readonly/>
                        <div style="margin: 10px 0">
                            <input id="input-bubble-opacity" min="0.5" max="1" step="0.05" type="range" oninput="changeBubbleOpacity(value)"/>
                        </div>
                    </div>
                    <div style="display: block;padding: 10px;">
                        播放价格：
                        <input style="width: 40px;border-radius:5px; color: #2c7873;font-weight: bolder;font-size: 14px;"
                               id="price-number"
                               value="1" min="1" max="5" step="0.1" type="number"
                               onchange="changePriceRange(value)"/>元/次
                        <div style="margin: 10px 0">
                            <input min="1" max="5" step="0.1" value="1" type="range"
                                   oninput="changePriceNum(value)"
                                   id="price-range"/>
                        </div>
                    </div>
                    <div style="display: flex;padding: 10px">
                        气泡颜色：
                        <ul id="select">
                            <li>
                                <div class="select-head">
                                    <div class="select-head-cont"></div>
                                    <img id="img-down" class="select-icon" src="../img/down.png"/>
                                </div>
                                <div style="z-index: 5;">
                                    <ul class="option">
                                        <li class="option-item" value="#23cd97">
                                            <span class="color-box" style="background:#23cd97;"></span>
                                            <span class="color-text">鹦 鹉 绿 色</span>
                                        </li>
                                        <li class="option-item" value="#baf1a1">
                                            <span class="color-box" style="background:#baf1a1;"></span>
                                            <span class="color-text">雾 绿 色</span>
                                        </li>
                                        <li class="option-item" value="#f6d186">
                                            <span class="color-box" style="background:#f6d186;"></span>
                                            <span class="color-text">郁 金 色</span>
                                        </li>
                                        <li class="option-item" value="#ffb6b6">
                                            <span class="color-box" style="background:#ffb6b6;"></span>
                                            <span class="color-text">一 斤 染</span>
                                        </li>
                                        <li class="option-item" value="#f18867">
                                            <span class="color-box" style="background:#f18867;"></span>
                                            <span class="color-text">柿 红 色</span>
                                        </li>
                                        <li class="option-item" value="#d89cf6">
                                            <span class="color-box" style="background:#d89cf6;"></span>
                                            <span class="color-text">薄 红 藤 色</span>
                                        </li>
                                        <li class="option-item" value="#aacfcf">
                                            <span class="color-box" style="background:#aacfcf;"></span>
                                            <span class="color-text">雾 蓝 色</span>
                                        </li>
                                        <li class="option-item" value="#6a8caf">
                                            <span class="color-box" style="background:#6a8caf;"></span>
                                            <span class="color-text">薄 群 青 色</span>
                                        </li>
                                        <li class="option-item" value="#35495e">
                                            <span class="color-box" style="background:#35495e;"></span>
                                            <span class="color-text">绀 青 色</span>
                                        </li>
                                    </ul>
                                </div>
                                <input hidden id="chosenColor" value="#23cd97"/>
                            </li>
                        </ul>
                    </div>
                    <div style="z-index: 2;">
                        <button class="button-submit" onclick="saveForm(1)">
                            保存
                        </button>
                    </div>
<%--                </form>--%>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //int
    var selectHead = document.getElementsByClassName('select-head')[0];
    var selectHeadCont = document.getElementsByClassName('select-head-cont');
    var Option = document.getElementsByClassName('option')[0];
    var optionItem = document.getElementsByClassName('option-item');
    /*默认是第一个选项*/
    selectHeadCont[0].innerHTML = optionItem[0].innerHTML;
    /*点击后出现下拉框*/
    selectHead.addEventListener('click', function () {
        if (Option.style.display === 'block') {
            Option.style.display = 'none';
            document.getElementById("img-down").src = "../img/down.png";
        } else {
            Option.style.display = 'block';
            document.getElementById("img-down").src = "../img/pull.png";
        }
    }, false);
    /*点击选项后出现在下拉框*/
    var len = optionItem.length;
    for (var i = 0; i < len; i++) {
        optionItem[i].index = i;
        optionItem[i].addEventListener('click', function () {
            selectHeadCont[0].innerHTML = optionItem[this.index].innerHTML;
            var chosenColor = optionItem[this.index].getAttribute("value");
            document.getElementById("bubble-emx1").style.background = chosenColor;
            document.getElementById("bubble-emx2").style.background = chosenColor;
            document.getElementById("chosenColor").value = chosenColor;
            Option.style.display = 'none';
            document.getElementById("img-down").src = "../img/down.png";
        }, false);
    }
</script>
</body>
<script type="text/javascript" src="./js/style-design.js"></script>
<script type="text/javascript" src="./js/submitForm.js"></script>
</html>
