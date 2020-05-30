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
    <link rel="stylesheet" href="./css/img-preview-box.css" type="text/css">
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
                        <a href="./emoji-style.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                表情样式
                            </span>
                            </div>
                        </a>
                        <a href="#">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull active">
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
        <div class="cc-body-main-img">
            <div style="width:100%;display: flex">
                <div class="body-style-mask"></div>
                <%--演示区域--%>
                <div class="body-style-container-img">
                    <%--                    全屏播放--%>
                    <div class="img-container-full" name="img-exm" id="img-container-full" style="display: block">
                        <div class="img-ava-name">
                            <img class="img-ava" src="../img/avater_test.jpg"/>
                            <div class="img-username">testname</div>
                            <div class="img-time" id="time-countdown"></div>
                        </div>
                        <img class="img-img" src="../img/sample-pic.png"/>
                    </div>
                    <div class="img-container-rolling" name="img-exm" id="img-container-rolling" style="display: none">
                        <div class="img-ava-name-rolling">
                            <img class="img-ava-rolling" src="../img/avater_test.jpg"/>
                            <div class="img-username-rolling">testname</div>
                        </div>
                        <img class="img-img-rolling" src="../img/sample-pic.png"/>
                    </div>
                    <div class="img-container-upperleft" name="img-exm" id="img-container-upperleft"
                         style="display: none">
                        <div class="img-ava-name-upperleft">
                            <img class="img-ava-upperleft" src="../img/avater_test.jpg"/>
                            <div class="img-username-upperleft">testname</div>
                        </div>
                        <img class="img-img-upperleft" src="../img/sample-pic.png"/>
                    </div>
                    <div class="img-container-upperright" name="img-exm" id="img-container-upperright"
                         style="display: none">
                        <div class="img-ava-name-upperright">
                            <img class="img-ava-upperright" src="../img/avater_test.jpg"/>
                            <div class="img-username-upperright">testname</div>
                        </div>
                        <img class="img-img-upperright" src="../img/sample-pic.png"/>
                    </div>
                </div>
                <div class="body-style-mask"></div>
            </div>

            <%--            调整区域--%>
            <div class="body-adjustment-container2">
<%--                <form>--%>
                    <div>
                        <h2 style="color: #ffba5a;">
                            图片弹幕
                        </h2>
                    </div>
                    <div style="display: block;padding: 20px;">
                        <span>播放方式</span>
                        <div style="padding: 10px">
                            <input type="radio" name="display-type" checked="checked" onclick="changeType()">
                            <label>全屏播放</label>
                            <input type="radio" name="display-type" onclick="changeType()">
                            <label>滚动播放</label>
                            <input type="radio" name="display-type" onclick="changeType()">
                            <label>固定左上角</label>
                            <input type="radio" name="display-type" onclick="changeType()">
                            <label>固定右上角</label>
                        </div>
                        <input type="hidden" id="display-type" value="all">
                    </div>
                    <div class="body-adjustment-container-img" id="playing-time">
                        <div style="width: 160px"><span style="padding: 0 10px 0 0">播放时长</span>
                            <input style="width: 40px;border-radius:5px; color: #2c7873;font-weight: bolder;font-size: 16px;"
                                   id="playing-time-number"
                                   value="5" min="5" max="30" step="1" type="number"
                                   onchange="changePlayingTimeRange(value)"/>秒
                        </div>
                        <input min="5" max="30" step="1" value="5" type="range" oninput="changePlayingTimeNum(value)"
                               id="playing-time-range">
                    </div>
                    <div class="body-adjustment-container-img">
                        <div style="width: 160px">
                            <span style="padding: 0 10px 0 0">播放价格</span>
                            <input style="width: 40px;border-radius:5px; color: #2c7873;font-weight: bolder;font-size: 16px;"
                                   id="playing-price-number"
                                   value="5" min="5" max="10" step="0.1" type="number"
                                   onchange="changePlayingPriceRange(value)"/>元/次
                        </div>
                        <input min="5" max="10" step="0.1" value="5" type="range" oninput="changePlayingPriceNum(value)"
                               id="playing-price-range">
                    </div>
                    <div class="body-adjustment-container-img">
                        <div style="width: 160px">
                            <span style="padding: 0 10px 0 0">不透明度</span>
                            <input style="width: 45px;border:none;color: #2c7873;font-weight: bolder" id="img-opacity"
                                   value="100%" readonly/>
                        </div>
                        <input id="input-img-opacity" min="0.5" max="1" step="0.05" type="range" value="1" oninput="changeImgOpacity(value)">
                    </div>
                    <div class="body-adjustment-container-img" id="img-resize" style="display: none">
                        <div style="width: 160px">
                            <span style="padding: 0 10px 0 0">图片大小</span>
                            <input style="width: 45px;border:none;color: #2c7873;font-weight: bolder" id="img-size"
                                   min="1" max="2" step="0.1" value="100%" readonly/>
                        </div>
                        <input id="input-img-size" min="1" max="2" step="0.1" type="range" value="1" oninput="changeImgSize(value)">
                    </div>
                    <div class="button-submit-container">
                        <button class="button-submit" onclick="saveForm(3)">
                            保存
                        </button>
                    </div>
<%--                </form>--%>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="./js/img-style.js"></script>
<script type="text/javascript" src="./js/submitForm.js"></script>

<script type="text/javascript">
    // 设置倒计时时长
    var start = 5;
    var step = -1;
    window.onload = count;

</script>
</html>
