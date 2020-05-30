<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.dao.VideoDao" %>
<%@ page import="com.javabean.Video" %><%--
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
                            <span class="router-item-pull active">
                                正在播放
                            </span>
                            </div>
                        </a>
                        <a href="./video-list.jsp">
                            <div class="nav-manage-barrage-item">
                            <span class="router-item-pull">
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
        <a href="./video-player.jsp" class="link-top-item active">
            <span>正在播放</span>
        </a>
        <a href="./video-list.jsp" class="link-top-item">
            <span>视频列表</span>
        </a>
        <a href="./video-upload.jsp" class="link-top-item">
            <span>上传视频</span>
        </a>
    </div>
    <%--    主体中间部分--%>
        <%
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        VideoDao dao = (VideoDao) context.getBean("videoDao");
        Video video = dao.getPlayingVideo();
        request.setAttribute("video", video);
    %>
    <div class="cc-body">
        <div class="cc-body-main2">
            <%--标题--%>
            <div class="head-title">
                <h2 class="head-title-text">
                    正在播放：${video.title}
                </h2>
            </div>
            <div id="video" class="video" style="width: 940px; height: 626px;">
            </div>
            <canvas id="myCanvas2" style="border:1px solid #d3d3d3; margin-top:15px;visibility: hidden">
                Your browser does not support the HTML5 canvas tag.
            </canvas>
            <%-- 解决视频跨域导致canvas无法编辑的问题：添加useCORS和crossOrigin属性--%>
            <video id="video1" controls="" width="940" style="margin-top:15px;visibility: hidden" loop="loop" useCORS="true" crossOrigin="Anonymous">
                <source src="http://1300463990.vod2.myqcloud.com/8d6190e5vodcq1300463990/13383cc75285890801641915730/BXp2BYCDGfEA.mp4" type="video/mp4">
            </video>
            <script src="./js/barrage.min.js"></script>

            <script type="text/javascript" src="./ckplayer/ckplayer/ckplayer.js" charset="UTF-8"></script>
            <script>
                var width = window.screen.width;
                var height = window.screen.height;
                var danmuList = [];
                var danmuLen;
                var index = 0;
                var i = 0;
                var isFirst = true;
                var time = 0;
                var textstyle;
                var bubblestyle;
                var emojistyle;
                var imgstyle;
                var videoObject = {
                    container: '#video', //容器的ID或className
                    variable: 'player', //播放函数名称
                    loaded: 'loadedHandler', //当播放器加载后执行的函数
                    loop: true, //播放结束是否循环播放
                    config: '', //指定配置函数
                    debug: true, //是否开启调试模式
                    drag: 'start', //拖动的属性
                    seek: 0, //默认跳转的时间
                    video: [
                        ['${video.videoUrl}', 'video/mp4', '标清', 0]
                    ]
                };
                var player = new ckplayer(videoObject);
                var video_origin = document.getElementById("video");
                var video_parent = document.getElementsByTagName('video')[0].parentNode;
                var video_origin = document.getElementsByTagName('video')[0];
                var video_mask = document.getElementsByTagName('video')[1];//遮罩视频
                var barrageDiv=document.createElement('div');
                barrageDiv.id="barrageDiv";
                barrageDiv.className="barrage-div";
                video_parent.appendChild(barrageDiv);
                var c2 = document.getElementById("myCanvas2");
                video_origin.addEventListener('canplay', function () {
                    c2.style.width = "100%";
                    ctx2 = c2.getContext('2d');
                    var i = window.setInterval(function () {
                        c2.width = video_origin.clientWidth;
                        c2.height = video_origin.videoHeight / video_origin.videoWidth * video_origin.
                            clientWidth;
                        ctx2.drawImage(video_mask, 0, 0, c2.width, c2.height);
                        let frame = this.ctx2.getImageData(0, 0, c2.width, c2.height);
                        let l = frame.data.length / 4;
                        for (let i = 0; i < l; i++) {
                            let r = frame.data[i * 4];
                            let g = frame.data[i * 4 + 1];
                            let b = frame.data[i * 4 + 2];
                            if (r > 200 && g > 200) {//黑色则设做透明，则为不被遮挡的弹幕部分
                                frame.data[i * 4 + 3] = 0;
                            }
                        }
                        ctx2.putImageData(frame, 0, 0);
                        barrageDiv.style.maskImage = "url(\'" + c2.toDataURL() + "\')";
                        barrageDiv.style.webkitMaskImage = "url(\'" + c2.toDataURL() + "\')";
                    }, 5);
                });


                //预先加载弹幕的各个样式类型
                $.ajax({
                    url: "http://localhost:8080/BarrageProject/getStyle.do",
                    type: "get",
                    success: function (data) {
                        for (var styleInfo of data) {
                            switch (styleInfo.type) {
                                case "text":
                                    textstyle = styleInfo;
                                    break;
                                case "bubble":
                                    bubblestyle = styleInfo;
                                    break;
                                case "emoji":
                                    emojistyle = styleInfo;
                                    break;
                                case "img":
                                    imgstyle = styleInfo;
                                    break;
                            }
                        }
                        console.log("取得样式")

                    },
                    error: function (e) {
                        console.log(e);
                    },
                });


                //预先加载所有弹幕
                $.ajax({
                    url: "http://localhost:8080/BarrageProject/getbarrage.do",
                    type: "get",
                    success: function (data) {
                        danmuLen = data.length;
                        danmuList = data;
                        console.log("共取得弹幕", data.length, "条")
                    },
                    error: function (e) {
                        console.log(e);
                    },
                });
            </script>
            <script type="text/javascript" src="./ckplayer/js/player.js" charset="UTF-8"></script>

        </div>
    </div>
</body>

</html>
