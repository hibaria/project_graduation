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
    <link rel="stylesheet" href="./css/barrage-manage.css" type="text/css">
    <link rel="stylesheet" href="./css/table.css" type="text/css">
    <link rel="shortcut icon" href="../img/barrage-back.ico" type="image/x-icon"/>
    <script type="text/javascript" src="./js/jQuery-3.4.1.js"></script>
    <title>弹幕管理-星弹幕,把跨界互动变为现实</title>
    <script type="text/javascript">
        var maxWidth = window.screen.width;
    </script>
    <style>
    </style>
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
                    <a href="./barrage-unChecked.jsp">
                        <div class="nav-manage-barrage" id="drop-down-list1">
                    <span class="router-wrap active">
                        <img src="../img/speech-bubble-2.png" class="menu-icon"/>
                        <span class="menu-title">
                            弹幕管理
                        </span>
                        <img src="../img/pull.png" class="menu-icon-pull" id="drop-down-list1-img"/>
                    </span>
                        </div>
                    </a>
                    <div class="nav-manage-barrage-group is-active" id="drop-down-list1-items">
                        <a href="./barrage-unChecked.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                待审弹幕
                            </span>
                            </div>
                        </a>
                        <a href="./barrage-passed.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull ">
                                已通过弹幕
                            </span>
                            </div>
                        </a>
                        <a href="./barrage-unpassed.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull active">
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
                    <span class="router-wrap">
                        <img src="../img/setting-1.png" class="menu-icon"/>
                        <span class="menu-title">
                            样式设计
                        </span>
                        <img src="../img/pull.png" class="menu-icon-pull" id="drop-down-list3-img"/>
                    </span>
                        </div>
                    </a>
                    <div class="nav-manage-barrage-group is-active" id="drop-down-list3-items">
                        <a href="../otherManage/style-design.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                文字样式
                            </span>
                            </div>
                        </a>
                        <a href="../otherManage/emoji-style.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                表情样式
                            </span>
                            </div>
                        </a>
                        <a href="../otherManage/img-style.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                图片样式
                            </span>
                            </div>
                        </a>
                    </div>
                </div>
                <a href="../otherManage/filter-manage.jsp">
                    <div class="nav-homePage">
                        <div class="router-item">
                            <img src="../img/filter-1.png" class="menu-icon"/>
                            <span class="menu-title">
                            过滤管理
                        </span>
                        </div>
                    </div>
                </a>
                <a href="../otherManage/user-feedback.jsp">
                    <div class="nav-homePage">
                    <span class="router-item">
                        <img src="../img/speech-bubble-1.png" class="menu-icon"/>
                        <span class="menu-title">
                            用户反馈
                        </span>
                    </span>
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
    <%--    主体顶部导航--%>
    <div class="link-top-container">
        <a href="./barrage-unChecked.jsp" class="link-top-item ">
            <span>待审核</span>
        </a>
        <a href="./barrage-passed.jsp" class="link-top-item ">
            <span>已通过</span>
        </a>
        <a href="./barrage-unpassed.jsp" class="link-top-item active">
            <span>未通过</span>
        </a>
    </div>
    <%--    主体中间部分--%>
    <div class="cc-body">
        <div class="cc-body-main">
            <div class="over"></div><!--图片预览的时候的背景层-->
            <%--标题--%>
            <div class="head-title">
                <h2 class="head-title-text">
                    待审核弹幕
                </h2>
            </div>
            <%--按钮栏，包括自动过滤/手动筛选，通过/不通过,刷新--%>
<%--            <form action="#" method="post" id="tableList">--%>
                <div class="button-bar">
                    <div class="filter-button">
                        <div id="filter-button-1" class="filter-button-item active">
                            自动过滤
                        </div>
                        <div id="filter-button-2" class="filter-button-item2">
                            手动筛选
                        </div>
                    </div>
                    <div class="operate-button">
                        <input type="submit" class="operate-button-item" value="通过">
                        </input>
                        <input type="submit" class="operate-button-item2" value="不通过">
                        </input>
                    </div>
                    <div class="refresh">
                        刷新
                    </div>
                </div>

                <table class="hovertable" id="table"
                       width="100%">
                    <tr>
                        <th style="text-align: center">选择</th>
                        <th>用户</th>
                        <th>播放时间</th>
                        <th>弹幕内容</th>
                        <th>属性</th>
                        <th>发送时间</th>
                        <th style="text-align: center">循环</th>
                        <th width="160" style="text-align: center">操作</th>
                    </tr>
                    <%
                        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
                        VideoDao videodao = (VideoDao) context.getBean("videoDao");
                        Video video = videodao.getPlayingVideo();
                        int videoId = video.getId();
                        BarrageDao dao = (BarrageDao) context.getBean("dao");
                        ArrayList<Barrage> barrages = dao.getBarrageByVideoId(3, videoId);
                        request.setAttribute("barrages", barrages);
                    %>
                    <c:forEach items="${barrages}" var="thisbarrage">
                        <tr>
                            <td width="30" style="text-align: center">
                                <input type="checkbox" name="selected" value="${thisbarrage.barrageId}">
                            </td>
                            <td width="110" style="color: #222222">${thisbarrage.userName}</td>
                            <td width="60">${thisbarrage.videoTimeText}</td>
                            <td width="300" style="color: #222222">
                                <c:if test="${thisbarrage.barrageType=='pic'}">
                                    <div class="logoImg amplifyImg">
                                        <img style="height: 100px" src="${thisbarrage.content}">
                                    </div>
                                </c:if>
                                <c:if test="${thisbarrage.barrageType=='emoji'}">
                                    <div class="logoImg amplifyImg">
                                        <img style="height: 50px"
                                             src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/72/apple/237/${thisbarrage.content}.png">
                                    </div>
                                </c:if>
                                <c:if test="${thisbarrage.barrageType=='normal'||thisbarrage.barrageType=='bubble'||thisbarrage.barrageType=='bigBubble'}">
                                    ${thisbarrage.content}
                                </c:if>
                            </td>
                            <td width="60">${thisbarrage.barrageTypeText}</td>
                            <td width="60">${thisbarrage.currentDate}</td>
                            <td width="60" style="text-align: center">${thisbarrage.times}次</td>
                            <td style="text-align: center">
                                <button onclick="delRow2(this)" value="${thisbarrage.barrageId}" class="btn3">清除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
<%--            </form>--%>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="./js/barrage-manage.js"></script>
<script type="text/javascript" src="./js/imgPreview.js"></script>
</html>
