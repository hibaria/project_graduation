<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.dao.BarrageDao" %>
<%@ page import="com.javabean.Barrage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.VideoDao" %>
<%@ page import="com.javabean.Video" %>
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
    <link rel="stylesheet" href="./css/video-manage.css" type="text/css">
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
                    <span class="router-wrap active">
                        <img src="../img/video-2.png" class="menu-icon"/>
                        <span class="menu-title ">
                            视频管理
                        </span>
                        <img src="../img/pull.png" class="menu-icon-pull" id="drop-down-list2-img"/>
                    </span>
                        </div>
                    </a>
                    <div class="nav-manage-barrage-group is-active" id="drop-down-list2-items">
                        <a href="./video-player.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull ">
                                正在播放
                            </span>
                            </div>
                        </a>
                        <a href="./video-list.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull active">
                                视频列表
                            </span>
                            </div>
                        </a>
                        <a href="./video-upload.jsp">
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
        <a href="./video-player.jsp" class="link-top-item ">
            <span>正在播放</span>
        </a>
        <a href="./video-list.jsp" class="link-top-item active">
            <span>视频列表</span>
        </a>
        <a href="./video-upload.jsp" class="link-top-item">
            <span>上传视频</span>
        </a>
    </div>
    <%--    主体中间部分--%>
    <div class="cc-body">
        <div class="cc-body-main2">
            <%--标题--%>
            <div class="head-title">
                <h2 class="head-title-text">
                    视频列表
                </h2>
            </div>
            <%
                ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
                VideoDao dao = (VideoDao) context.getBean("videoDao");
                ArrayList<Video> video = dao.getAllVideo();
                request.setAttribute("video", video);
            %>
            <c:forEach items="${video}" var="thisvideo">
                <div class="list-container">
                    <div>
                        <img class="list-cover" src="${thisvideo.coverUrl}">
                    </div>
                    <div>
                        <div class="list-title">${thisvideo.title}</div>
                        <div class="list-intro">${thisvideo.intro}</div>
                    </div>
                    <div class="list-button-container">
                        <button class="list-button1" onclick="playRow(this)" value="${thisvideo.id}">
                            播放</button>
                        <button class="list-button2">删除</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script type="text/javascript" src="./js/video-manage.js"></script>

</body>

</html>
