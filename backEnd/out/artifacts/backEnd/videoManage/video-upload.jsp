<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="com.dao.BarrageDao" %>
<%@ page import="com.javabean.Barrage" %>
<%@ page import="java.util.ArrayList" %><%--
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
    <script src="./js/vod-js-sdk-v6.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>弹幕管理-星弹幕,把跨界互动变为现实</title>
    <script type="text/javascript">
        var maxWidth = window.screen.width;
    </script>
    <style>
        /*{#    隐藏#}*/
        .hide {
            display: none;
        }

        /*{#        遮罩层#}*/
        .shade {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: black;
            opacity: 0.6;
            z-index: 6;
        }
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
                            <span class="router-item-pull">
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
                            <span class="router-item-pull active">
                                上传视频
                            </span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="nav-manage-barrage-container">
                    <a href="../otherManage/style-design.jsp">
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
        <a href="./video-list.jsp" class="link-top-item ">
            <span>视频列表</span>
        </a>
        <a href="./video-upload.jsp" class="link-top-item active">
            <span>上传视频</span>
        </a>
    </div>
    <%--    主体中间部分--%>
    <div class="cc-body">
        <div class="cc-body-main">
            <div id="main-area">
                <form id="myForm" action="http://localhost:8080/BarrageProject/SubmitUpload.do" method="get"
                      onsubmit="return check()">
                    <%--                    <form ref="vExample">--%>
                    <%--                        <input type="file" style="display:none;" ref="vExampleFile" @change="vExampleUpload"/>--%>
                    <%--                    </form>--%>
                    <%--                    <div class="upload-container1">--%>
                    <%--                        <a href="javascript:void(0);" class="btn btn-default" @click="vExampleAdd">--%>
                    <%--                            <img class="upload-img" src="../img/upload.png">--%>
                    <%--                        </a>--%>
                    <%--                        <div style="color: #23d69e">--%>
                    <%--                            点击选取上传视频--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <div class="upload-container1">
                        <a href="javascript:void(0);" onclick="showUploadBox()">
                            <img class="upload-img" src="../img/upload.png">
                        </a>
                        <div style="color: #23d69e">
                            点击选取上传视频和封面
                        </div>
                    </div>
                    <div class="shade hide"></div>
                    <%-- 弹出框选择视频和封面上传--%>
                    <div class="upload-box" id="upload-box" style="display: none;">
                        <div class="upload-box-input-container">
                            <label>
                                添加视频
                                <input readonly="readonly" class="upload-box-input"
                                       @click="vcExampleAddVideo" v-model="vcExampleVideoName">
                            </label>
                            <div id="warning-text1" style="display: none;color: red">请先添加视频方可上传</div>
                        </div>
                        <div class="upload-box-input-container">
                            添加封面
                            <label>
                                <input readonly="readonly" class="upload-box-input"
                                       @click="vcExampleAddCover" v-model="vcExampleCoverName">
                            </label>
                            <div id="warning-text2" style="display: none;color: red">请先添加封面图片方可上传</div>
                        </div>
                        <div class="upload-box-input-container2">
                            <button class="upload-box-confirm"
                                    @click="vcExampleAddUpload">开始上传
                            </button>
                            <button class="upload-box-cancel"
                                    @click="vcExampleCancelUpload">取消
                            </button>
                        </div>
                    </div>
                    <%-- 显示最新上传的视频的相关信息--%>
                    <div v-if="(uploaderInfos.length)>0" style="color: #6d757a;margin-bottom: 20px;">
                        <span style="padding:10px">
                                视频上传进度:&nbsp&nbsp&nbsp&nbsp
                                {{Math.floor(uploaderInfos[uploaderInfos.length-1].progress * 100) + '%'}}
                           </span>
                        <span style="padding:10px">
                            封面上传进度:&nbsp&nbsp&nbsp&nbsp
                            {{Math.floor(uploaderInfos[uploaderInfos.length-1].coverProgress * 100) + '%'}}
                        </span>
                        <span style="padding:10px">
                                <a href="javascript:void(0);"
                                   v-if="!uploaderInfos[uploaderInfos.length-1].isVideoUploadSuccess
                                   && !uploaderInfos[uploaderInfos.length-1].isVideoUploadCancel"
                                   @click="uploaderInfos[uploaderInfos.length-1].cancel()">取消上传</a>
                        </span>
                        <label for="videoUrl"></label>
                        <input id="videoUrl" name="videoUrl" style="display:none;"
                               v-model="uploaderInfos[uploaderInfos.length-1].videoUrl">
                        <label for="coverUrl"></label>
                        <input id="coverUrl" name="coverUrl" style="display:none;"
                               v-model="uploaderInfos[uploaderInfos.length-1].coverUrl">
                    </div>
                    <div class="upload-container2">
                        <div class="upload-text">
                            <span style="color: #6d757a">标题</span>
                            <span style="color: red">*</span>
                        </div>
                        <input class="upload-inputBox" id="title" name="title">
                    </div>
                    <div style="display: none;color: red" id="warning-2">
                        请先确认是否已经填写标题！
                    </div>
                    <div class="upload-container2">
                        <div class="upload-text">
                            <span style="color: #6d757a">简介</span>
                        </div>
                        <textarea class="upload-inputBox2" name="introduction" id="introduction"></textarea>
                    </div>
                    <input type="submit" id="btn" class="upload-button">
                </form>
                <form ref="vcExample">
                    <input type="file" style="display:none;" ref="vcExampleVideo" @change="setVcExampleVideoName()"/>
                    <input type="file" style="display:none;" ref="vcExampleCover" @change="setVcExampleCoverName()"/>
                </form>
            </div>

            <div style="display: none;color: red" id="warning-1">
                您还未上传视频！请先上传完毕视频方可提交
            </div>
            <div style="display: none;color: red" id="warning-3">
                您还未上传封面！请先上传完毕封面方可提交
            </div>
            <div class="info-container">
                <a class="info-item" href="javascript:void(0)" title="不得上传未经授权的他人作品，以及色情、反动等违法视频">
                    禁止发布的视频内容
                </a>

                <a class="info-item" href="javascript:void(0)" title="建议上传常用的在线流媒体格式，如mp4、flv、f4v、webm">
                    视频格式
                </a>
                <a class="info-item" href="javascript:void(0)" title="不支持1秒以下或大于10小时的视频文件">
                    视频时长
                </a>
                <a class="info-item" href="javascript:void(0)"
                   title="流程：将视频上传至服务器；上传成功后服务器将视频转码成播放器可识别格式；转码完成视频可查看">
                    视频处理流程
                </a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        // 提交表单时检查是否已经上传视频、封面、填写标题
        function check() {
            var videoUrl = $("#videoUrl").val();
            if (videoUrl == null || videoUrl == "") {
                document.getElementById("warning-1").style.display = "";
                document.getElementById("warning-2").style.display = "none";
                document.getElementById("warning-3").style.display = "none";
                return false;
            }
            var videoUrl = $("#coverUrl").val();
            if (coverUrl == null || coverUrl == "") {
                document.getElementById("warning-1").style.display = "none";
                document.getElementById("warning-2").style.display = "none";
                document.getElementById("warning-3").style.display = "";
                return false;
            }
            var title = $("#title").val();
            if (title == null || title == "") {
                document.getElementById("warning-2").style.display = "";
                document.getElementById("warning-1").style.display = "none";
                document.getElementById("warning-3").style.display = "none";
                return false;
            }
            return true;
        }

        function showUploadBox() {
            document.getElementById("upload-box").style.display = "";
            $('.shade,.mode').removeClass('hide')
        }

        // function hideUploadBox() {
        //     document.getElementById("upload-box").style.display = "none";
        // }
    </script>
    <script type="text/javascript" src="./js/video-manage.js"></script>
    <script src="./js/es6-promise.auto.js"></script>
    <script src="./js/vue.js"></script>
    <script src="./js/axios.js"></script>
    <script type="text/javascript" src="./js/video-upload.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="./js/gtag.js"></script>
</body>
</html>
