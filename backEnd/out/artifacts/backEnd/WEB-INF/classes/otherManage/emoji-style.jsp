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
    <link rel="stylesheet" href="./css/emoji-preview-box.css" type="text/css">
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
                        <a href="./style-design.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                文字样式
                            </span>
                            </div>
                        </a>
                        <a href="#">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull active">
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
        <div class="cc-body-main-emoji">
            <div style="width:100%;display: flex">
                <div class="body-style-mask"></div>
                <%--演示区域--%>
                <div class="body-style-container-emoji">
                    <div class="preview-exm-emoji1" id="preview-exm-emoji1" >
                        <img class="preview-emoji-img" id="emoji-img1"
                             src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/237/smiling-face-with-halo_1f607.png"/>
                    </div>
                    <div class="preview-exm-emoji2" id="preview-exm-emoji2" style="display: none">
                        <img class="preview-emoji-img"  id="emoji-img2"
                             src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/237/smiling-face-with-halo_1f607.png"/>
                    </div>
                    <div class="preview-exm-emoji3" id="preview-exm-emoji3" style="display: none">
                        <img class="preview-emoji-img"  id="emoji-img3"
                             src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/237/smiling-face-with-halo_1f607.png"/>
                    </div>
                    <div class="preview-exm-emoji4" id="preview-exm-emoji4" style="display: none">
                        <img class="preview-emoji-img"  id="emoji-img4"
                             src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/237/smiling-face-with-halo_1f607.png"/>
                    </div>
                </div>
                <div class="body-style-mask"></div>
            </div>

            <%--            调整区域--%>
            <div class="body-adjustment-container2">
<%--                <form>--%>
                    <div>
                        <h2 style="color: #ffba5a">
                            表情弹幕
                        </h2>
                    </div>
                    <div style="display: block;padding: 10px">
                        <div style="display: block;padding: 20px;">
                            <span>播放方式</span>
                            <div style="padding: 10px">
                                <input type="radio" name="display-type" checked="checked" onclick="changeType()">
                                <label>全屏弹跳</label>
                                <input type="radio" name="display-type" onclick="changeType()">
                                <label>从右到左</label>
                                <input type="radio" name="display-type" onclick="changeType()">
                                <label>从左到右</label>
                                <input type="radio" name="display-type" onclick="changeType()">
                                <label>顶部摇晃</label>
                            </div>
                            <input type="hidden" id="display-type" value="random">
                        </div>
                        <div class="body-adjustment-container-emoji">
                            <div style="width: 160px">
                                <span style="padding: 0 10px 0 0">播放价格</span>
                                <input style="width: 40px;border-radius:5px; color: #2c7873;font-weight: bolder;font-size: 16px;"
                                       id="playing-price-number"
                                       value="3" min="3" max="10" step="0.1" type="number"
                                       onchange="changePlayingPriceRange(value)"/>元/次
                            </div>
                            <input min="3" max="10" step="0.1" value="3" type="range"
                                   oninput="changePlayingPriceNum(value)"
                                   id="playing-price-range">
                        </div>
                        <div class="body-adjustment-container-emoji">
                            <div style="width: 160px">
                                <span style="padding: 0 10px 0 0">不透明度</span>
                                <input style="width: 45px;border:none;color: #2c7873;font-weight: bolder"
                                       id="emoji-opacity"
                                       value="100%" readonly/>
                            </div>
                            <input id="input-emoji-opacity" min="0.5" max="1" step="0.05" type="range" value="1"
                                   oninput="changeEmojiOpacity(value)">
                        </div>
                        <div class="body-adjustment-container-emoji" id="img-resize">
                            <div style="width: 160px">
                                <span style="padding: 0 10px 0 0">表情大小</span>
                                <input style="width: 45px;border:none;color: #2c7873;font-weight: bolder" id="emoji-size"
                                       min="1" max="2" step="0.1" value="100%" readonly/>
                            </div>
                            <input id="input-emoji-size" min="1" max="2" step="0.1" type="range" value="1" oninput="changeEmojiSize(value)">
                        </div>
                        <div class="button-submit-container">
                            <button class="button-submit" onclick="saveForm(2)">
                                保存
                            </button>
                        </div>
                    </div>
<%--                </form>--%>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="./js/emoji-style.js"></script>
<script type="text/javascript" src="./js/submitForm.js"></script>
</html>
