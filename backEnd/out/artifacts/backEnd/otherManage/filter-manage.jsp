<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.dao.BarrageDao" %>
<%@ page import="com.javabean.Barrage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.javabean.Video" %>
<%@ page import="com.dao.VideoDao" %>
<%@ page import="com.dao.ShieldingDao" %>
<%@ page import="com.javabean.Shielding" %>
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
    <link rel="stylesheet" href="./css/filter-manage.css" type="text/css">
    <link rel="shortcut icon" href="../img/barrage-back.ico" type="image/x-icon"/>
    <title>弹幕管理-星弹幕,把跨界互动变为现实</title>
    <script type="text/javascript">
        var maxWidth = window.screen.width;
    </script>
</head>
<body style="margin:0">
<%--遮罩层--%>
<div id="cover" class="div-cover"></div>
<div class="cc-header">
    <div class="header">
        <div class="left-block">
            <a href="http://localhost:8080/BarrageProject/manage-index.jsp">
                <img herf="" src="../img/title.png" class="logo"/>
            </a>
            <a href="http://localhost:8080/BarrageProject/index.jsp" target="_blank" class="main-site">
                <img src="../img/main-site.png" class="icon"/>
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
                        <a href="./img-style.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
                                图片样式
                            </span>
                            </div>
                        </a>
                    </div>
                </div>
                <a href="./filter-manage.jsp">
                    <div class="nav-homePage">
                        <div class="router-item">
                            <img src="../img/filter-2.png" class="menu-icon"/>
                            <span class="menu-title active">
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

    <%--    主体中间部分--%>
    <div class="cc-body-filter">
        <div class="cc-body-main-filter">
            <%--标题--%>
            <div class="head-title">
                <h2 class="head-title-text">
                    屏蔽词汇列表
                </h2>
                <button class="button-add" onclick="showWindow()">添 加 屏 蔽 词</button>
            </div>
            <div class="table-div">
                <form>
                <table id="table" width="100%" border="0" cellspacing="0" cellpadding="0" style="border: 1px #cecece solid">
                    <tr class="table-tr">
                        <th class="table-th-1">内容</th>
                        <th class="table-th-2">操作</th>
                    </tr>
                    <%
                        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
                        ShieldingDao dao = (ShieldingDao) context.getBean("shieldingDao");
                        ArrayList<Shielding> vocabularys = dao.getAll();
                        request.setAttribute("vocabularys", vocabularys);
                    %>
                    <c:forEach items="${vocabularys}" var="thisVocabulary">
                        <tr class="table-tr-2" id="table-tr" >
                            <td class="table-td-1" width="80%" >${thisVocabulary.vocabulary}</td>
                            <td class="table-td-2" width="20%">
                                <button class="btn-del" onclick="deleteRow(this)" value="${thisVocabulary.id}">删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                </form>
            </div>

            <!-- 弹窗 -->
            <div id="showdiv" class="div-show">
                <form>
                <!-- 标题 -->
                <div class="div-show-title">
                    添加屏蔽词汇
                </div>
                <!-- 内容 -->
                <div class="div-show-content" title="最大输入10个字符">
                    <label for="shieldingVocabulary"></label>
                    <textarea class="div-show-input" maxlength="10" id="shieldingVocabulary"></textarea>
                </div>
                <!-- 按钮 -->
                <div class="div-show-button">
                    <button class="div-show-confirm" onclick="confirmSubmit()">
                        确 定
                    </button>
                    <button class="div-show-cancel" onclick="closeWindow()">
                        取 消
                    </button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<script type="text/javascript" src="./js/jQuery-3.4.1.js"></script>
<script type="text/javascript" src="./js/filter-manage.js"></script>
</html>
