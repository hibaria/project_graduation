function loadedHandler() {
    player.addListener('error', errorHandler); //监听视频加载出错
    player.addListener('loadedmetadata', loadedMetaDataHandler); //监听元数据
    player.addListener('duration', durationHandler); //监听播放时间
    player.addListener('time', timeHandler); //监听播放时间
    player.addListener('play', playHandler); //监听播放
    player.addListener('pause', pauseHandler); //监听暂停播放
    player.addListener('buffer', bufferHandler); //监听缓冲状态
    player.addListener('seek', seekHandler); //监听跳转播放完成
    player.addListener('seekTime', seekTimeHandler); //监听跳转播放完成
    player.addListener('volume', volumeChangeHandler); //监听音量改变
    player.addListener('full', fullHandler); //监听全屏/非全屏切换
    player.addListener('ended', endedHandler); //监听播放结束
    player.addListener('screenshot', screenshotHandler); //监听截图功能
    player.addListener('mouse', mouseHandler); //监听鼠标坐标
    player.addListener('frontAd', frontAdHandler); //监听前置广告的动作
    player.addListener('wheel', wheelHandler); //监听视频放大缩小
    player.addListener('controlBar', controlBarHandler); //监听控制栏显示隐藏事件
    player.addListener('clickEvent', clickEventHandler); //监听点击事件
    player.addListener('definitionChange', definitionChangeHandler); //监听清晰度切换事件
    player.addListener('speed', speedHandler); //监听加载速度
}

function errorHandler() {
    console.log('出错')
    changeText('.playerstate', '状态：视频加载错误，停止执行其它动作，等待其它操作');
}

function loadedMetaDataHandler() {
    var metaData = player.getMetaDate();
    //console.log(metaData)
    var html = ''
    //console.log(metaData);
    if (parseInt(metaData['videoWidth']) > 0) {
        changeText('.playerstate', '状态：获取到元数据信息，如果数据错误，可以使用延迟获取');
        html += '总时间：' + metaData['duration'] + '秒，';
        html += '音量：' + metaData['volume'] + '（范围0-1），';
        html += '播放器的宽度：' + metaData['width'] + 'px，';
        html += '播放器的高度：' + metaData['height'] + 'px，';
        html += '视频宽度：' + metaData['videoWidth'] + 'px，';
        html += '视频高度：' + metaData['videoHeight'] + 'px，';
        html += '视频原始宽度：' + metaData['streamWidth'] + 'px，';
        html += '视频原始高度：' + metaData['streamHeight'] + 'px，';
        html += '是否暂停状态：' + metaData['paused'];
    } else {
        changeText('.playerstate', '状态：未正确获取到元数据信息');
        html = '没有获取到元数据';
    }
    changeText('.metadata', html);
}

function playHandler() {
    player.animateResume();//继续播放所有弹幕
    changeText('.playstate', getHtml('.playstate') + ' 播放');
    window.setTimeout(function () {
        loadedMetaDataHandler();
    }, 1000);
    loadedMetaDataHandler();
}

function pauseHandler() {
    player.animatePause();//暂停所有弹幕
    changeText('.playstate', getHtml('.playstate') + ' 暂停');
    loadedMetaDataHandler();
}

//获得依次从上到下对应的位置
function getRandomOffset(index) {
    return ((index % 6 + 1) * 15) + "%";
}

//获得依次从上到下对应的位置
function getTextRandomOffset(index, range) {
    return (index % (10 * range)) * 10 + "%";
}

function getImgX(position) {
    switch (position) {
        case "all":
            return 1;
        case "right2left":
            return 2;
        case "upperLeft":
            return 0;
        case "upperRight":
            return 2;
        default:
            return 1;

    }
}

function getImgY(position) {
    switch (position) {
        case "all":
            return 1;
        case "right2left":
            return 1;
        case "upperLeft":
            return 0;
        case "upperRight":
            return 0;
        default:
            return 1;
    }
}

function getEmojiX(position) {
    switch (position) {
        case "random":
            return "0%";
        case "left2right":
            return 0;
        case "right2left":
            return 2;
        case "top":
            return 1;
        default:
            return 2;
    }
}

function getEmojiY(position) {
    switch (position) {
        case "random":
            return "40%";
        case "right2left":
        case "left2right":
            return 1;
        case "top":
            return 0;
        default:
            return 1;
    }
}

function timeHandler(t) {
    changeText('.currenttimestate', '当前播放时间（秒）：' + t);
    time = t
    if (t < 0.25) {
        //从头播放的时候，重新加载所有弹幕，并且令弹幕列表从0开始轮询
        //重新加载弹幕各个类型的样式
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
        //ajax请求获取数据库中所有弹幕
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

        index = 0;
    }
    while (index < danmuLen) {
        if (danmuList[index].videoTime + 0.3 < t) {
            index++;
            continue;
        }
        if ((Math.abs(danmuList[index].videoTime - t)) < 1) {
            switch (danmuList[index].barrageType) {
                case "normal":
                    newDanmu(danmuList[index].avatars, danmuList[index].userName, danmuList[index].content,
                        '100%', getTextRandomOffset(index, textstyle.area), textstyle.opacity,
                        textstyle.size);break;
                case "bubble":
                    newbubbleDanmu(danmuList[index].avatars, danmuList[index].userName,
                        danmuList[index].content, '100%', getRandomOffset(index),
                        bubblestyle.size, bubblestyle.background, bubblestyle.opacity);break;
                case "bigBubble":
                    newbigBubbleDanmu(danmuList[index].avatars, danmuList[index].userName,
                        danmuList[index].content, '100%', getRandomOffset(index),
                        bubblestyle.size, bubblestyle.background, bubblestyle.opacity);break;
                case "emoji":
                    newEmojiDanmu("https://emojipedia-us.s3.dualstack.us-west-1." +
                        "amazonaws.com/thumbs/72/apple/237/" + danmuList[index].content + ".png",
                        getEmojiX(emojistyle.position), getEmojiY(emojistyle.position), emojistyle.size,
                        emojistyle.opacity, emojistyle.position);break;
                case"pic":
                    newPicDanmu(danmuList[index].avatars, danmuList[index].userName,
                        danmuList[index].content, getImgX(imgstyle.position), getImgY(imgstyle.position),
                        imgstyle.size, imgstyle.opacity, imgstyle.position, imgstyle.duration);break;
                default:
                    break;
            }
            index++;
            continue;
        }
        break;
    }
}

function durationHandler(duration) {
    changeText('.duration', '总时间（秒）：' + duration);
}

function seekHandler(state) {
    if (state)
        index = 0
    changeText('.seekstate', getHtml('.seekstate') + ' ' + state);
}

function seekTimeHandler(time) {
    changeText('.seekstate', getHtml('.seekstate') + ' seekTime:' + time);
}

function bufferHandler(buffer) {
    //console.log(buffer);
    changeText('.bufferstate', '缓冲：' + buffer);
}

function volumeChangeHandler(vol) {
    changeText('.volumechangestate', '当前音量：' + vol);
}

function speedHandler(n) {
    changeText('.speed', '当前加载速率：' + n);
}

function screenshotHandler(obj) {
    changeText('.screenshot', '图片名称：' + obj['name'] + ',截图对象：' + obj['object'] + ',是否用户保存：' + obj['save'] + ',图片：<img src="' + obj['base64'] + '">');
}

function fullHandler(b) {
    if (b) {
        html = ' 全屏';
    } else {
        html = ' 否';
    }
    changeText('.fullstate', getHtml('.fullstate') + html);

}

function endedHandler() {
    changeText('.endedstate', '播放结束');
}

function mouseHandler(obj) {
    changeText('.mouse', '鼠标位置，x：' + obj['x'] + '，y：' + obj['y']);
}

function frontAdHandler(status) {
    changeText('.frontad', getHtml('.frontad') + ' ' + status);
}

var zoomNow = 1;

function wheelHandler(n) {
    if (n > 0) {
        if (zoomNow < 5) {
            zoomNow += 0.1;
        }
    } else {
        if (zoomNow > 0) {
            zoomNow -= 0.1;
        }
    }
    player.videoZoom(zoomNow);//支持鼠标滚轮控制放大缩小
}

function controlBarHandler(show) {
    if (show) {
        html = ' 显示';
    } else {
        html = ' 隐藏';
    }
    changeText('.controlBar', getHtml('.controlBar') + html);
}

function clickEventHandler(eve) {
    changeText('.clickEvent', getHtml('.clickEvent') + ' ' + eve);
}

function definitionChangeHandler(num) {
    changeText('.definitionChange', getHtml('.definitionChange') + ',切换清晰度编号' + num);
}

var videoChangeNum = 0;

function seekTime() {
    var time = parseInt(player.getByElement('.seektime').value);
    var metaData = player.getMetaDate();
    var duration = metaData['duration'];
    if (time < 0) {
        alert('请填写大于0的数字');
        return;
    }
    if (time > duration) {
        alert('请填写小于' + duration + '的数字');
        return;
    }
    player.videoSeek(time);
}

function changeVolume() {
    var volume = player.getByElement('.changevolume').value;
    volume = Math.floor(volume * 100) / 100
    if (volume < 0) {
        alert('请填写大于0的数字');
        return;
    }
    if (volume > 1) {
        alert('请填写小于1的数字');
        return;
    }
    player.changeVolume(volume);
}

//增加一个普通弹幕
function newDanmu(avaterUrl, userName, barrage, xOffset, yOffset, backAlpha, size) {
    //弹幕说明
    var danmuObj = {
        list: [{
            type: 'image', //定义元素类型：只有二种类型，image=使用图片，text=文本
            file: avaterUrl, //图片地址
            radius: 30, //图片圆角弧度
            width: 30 * size, //定义图片宽，必需要定义
            height: 30 * size, //定义图片高，必需要定义
            alpha: 1, //图片透明度(0-1)
            marginLeft: 10, //图片离左边的距离
            marginRight: 10, //图片离右边的距离
            marginTop: 10, //图片离上边的距离
            marginBottom: 10, //图片离下边的距离
            // clickEvent: "link->http://"
        },
            {
                type: 'text', //说明是文本
                text: userName + '  ' + barrage, //文本内容
                color: '0xFFF', //文本颜色
                size: 26 * size, //文本字体大小，单位：px
                font: 'Microsoft YaHei', //文本字体
                leading: 30, //文字行距
                alpha: 1, //文本透明度(0-1)
                paddingLeft: 0, //文本内左边距离
                paddingRight: 10, //文本内右边距离
                paddingTop: 0, //文本内上边的距离
                paddingBottom: 0, //文本内下边的距离
                marginLeft: 0, //文本离左边的距离
                marginRight: 10, //文本离右边的距离
                marginTop: 10, //文本离上边的距离
                marginBottom: 0, //文本离下边的距离
                backgroundColor: '0xFF0000', //文本的背景颜色
                backAlpha: 0, //文本的背景透明度(0-1)
                backRadius: 30, //文本的背景圆角弧度
                // clickEvent: "actionScript->videoPlay"
            }],
        x: xOffset, //x轴坐标
        y: yOffset, //y轴坐标
        //position:[2,1,0],//位置[x轴对齐方式（0=左，1=中，2=右），y轴对齐方式（0=上，1=中，2=下），x轴偏移量（不填写或null则自动判断，第一个值为0=紧贴左边，1=中间对齐，2=贴合右边），y轴偏移量（不填写或null则自动判断，0=紧贴上方，1=中间对齐，2=紧贴下方）]
        alpha: backAlpha,
        //backgroundColor:'#FFFFFF',
        backAlpha: backAlpha,
        backRadius: 30 //背景圆角弧度
    }
    var danmu = player.addElement(danmuObj, "normal");
    var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
    var obj = {
        element: danmu,
        parameter: 'x',
        static: true, //是否禁止其它属性，true=是，即当x(y)(alpha)变化时，y(x)(x,y)在播放器尺寸变化时不允许变化
        effect: 'None.easeOut',
        start: null,
        end: -danmuAttribute['width'],
        speed: 10,
        overStop: true,
        pauseStop: true,
        callBack: 'deleteChild'
    };
    var danmuAnimate = player.animate(obj);
}

// 增加小号气泡弹幕
function newbubbleDanmu(avaterUrl, userName, barrage, xOffset, yOffset, size, background, opacity) {
    //弹幕说明
    var danmuObj = {
        list: [{
            type: 'image', //定义元素类型：只有二种类型，image=使用图片，text=文本
            file: avaterUrl, //图片地址
            radius: 30, //图片圆角弧度
            width: 30, //定义图片宽，必需要定义
            height: 30, //定义图片高，必需要定义
            alpha: 1, //图片透明度(0-1)
            marginLeft: 10, //图片离左边的距离
            marginRight: 10, //图片离右边的距离
            marginTop: 10, //图片离上边的距离
            marginBottom: 10, //图片离下边的距离
            // clickEvent: "link->http://"
        },
            {
                type: 'bubble_name', //说明是文本
                text: userName, //文本内容
                color: '0xFFF', //文本颜色
                size: 18 * size, //文本字体大小，单位：px
                font: 'Microsoft YaHei', //文本字体
                leading: 20, //文字行距
                alpha: 1, //文本透明度(0-1)
                paddingLeft: 0, //文本内左边距离
                paddingRight: 10, //文本内右边距离
                paddingTop: 5, //文本内上边的距离
                paddingBottom: 0, //文本内下边的距离
                marginLeft: 50, //文本离左边的距离
                marginRight: 10, //文本离右边的距离
                marginTop: 0, //文本离上边的距离
                marginBottom: 0, //文本离下边的距离
                backgroundColor: '0xFF0000', //文本的背景颜色
                backAlpha: 0, //文本的背景透明度(0-1)
                backRadius: 30, //文本的背景圆角弧度
                // clickEvent: "actionScript->videoPlay"
            },
            {
                type: 'bubble_content', //说明是文本
                text: barrage, //文本内容
                color: '0xFFF', //文本颜色
                size: 20 * size, //文本字体大小，单位：px
                font: 'Microsoft YaHei', //文本字体
                leading: 30, //文字行距
                alpha: 1, //文本透明度(0-1)
                paddingLeft: 0, //文本内左边距离
                paddingRight: 10, //文本内右边距离
                paddingTop: 0, //文本内上边的距离
                paddingBottom: 0, //文本内下边的距离
                marginLeft: 50, //文本离左边的距离
                marginRight: 10, //文本离右边的距离
                marginTop: 0, //文本离上边的距离
                marginBottom: 5, //文本离下边的距离
                backgroundColor: '0xFF0000', //文本的背景颜色
                backAlpha: 0, //文本的背景透明度(0-1)
                backRadius: 30, //文本的背景圆角弧度
                // clickEvent: "actionScript->videoPlay"
            }],
        x: xOffset, //x轴坐标
        y: yOffset, //y轴坐标
        //position:[2,1,0],//位置[x轴对齐方式（0=左，1=中，2=右），y轴对齐方式（0=上，1=中，2=下），x轴偏移量（不填写或null则自动判断，第一个值为0=紧贴左边，1=中间对齐，2=贴合右边），y轴偏移量（不填写或null则自动判断，0=紧贴上方，1=中间对齐，2=紧贴下方）]
        alpha: 1,
        backgroundColor: background,
        backAlpha: opacity,
        backRadius: 10 //背景圆角弧度
    }
    var danmu = player.addElement(danmuObj, "bubble");
    var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
    var obj = {
        element: danmu,
        parameter: 'x',
        static: true, //是否禁止其它属性，true=是，即当x(y)(alpha)变化时，y(x)(x,y)在播放器尺寸变化时不允许变化
        effect: 'None.easeOut',
        start: null,
        end: -danmuAttribute['width'],
        speed: 10,
        overStop: true,
        pauseStop: true,
        callBack: 'deleteChild'
    };
    var danmuAnimate = player.animate(obj);
}

// 增加大号气泡弹幕
function newbigBubbleDanmu(avaterUrl, userName, barrage, xOffset, yOffset, size, background, opacity) {
    //弹幕说明
    var danmuObj = {
        list: [{
            type: 'image', //定义元素类型：只有二种类型，image=使用图片，text=文本
            file: avaterUrl, //图片地址
            radius: 50, //图片圆角弧度
            width: 50, //定义图片宽，必需要定义
            height: 50, //定义图片高，必需要定义
            alpha: 1, //图片透明度(0-1)
            marginLeft: 10, //图片离左边的距离
            marginRight: 10, //图片离右边的距离
            marginTop: 10, //图片离上边的距离
            marginBottom: 10, //图片离下边的距离
            // clickEvent: "link->http://"
        },
            {
                type: 'bubble_name', //说明是文本
                text: userName, //文本内容
                color: '0xFFF', //文本颜色
                size: 20 * size, //文本字体大小，单位：px
                font: 'Microsoft YaHei', //文本字体
                leading: 24, //文字行距
                alpha: 1, //文本透明度(0-1)
                paddingLeft: 0, //文本内左边距离
                paddingRight: 10, //文本内右边距离
                paddingTop: 10, //文本内上边的距离
                paddingBottom: 0, //文本内下边的距离
                marginLeft: 70, //文本离左边的距离
                marginRight: 10, //文本离右边的距离
                marginTop: 0, //文本离上边的距离
                marginBottom: 0, //文本离下边的距离
                backgroundColor: '0xFF0000', //文本的背景颜色
                backAlpha: 0, //文本的背景透明度(0-1)
                backRadius: 30, //文本的背景圆角弧度
                // clickEvent: "actionScript->videoPlay"
            },
            {
                type: 'bubble_content', //说明是文本
                text: barrage, //文本内容
                color: '0xFFF', //文本颜色
                size: 26 * size, //文本字体大小，单位：px
                font: 'Microsoft YaHei', //文本字体
                leading: 32, //文字行距
                alpha: 1, //文本透明度(0-1)
                paddingLeft: 0, //文本内左边距离
                paddingRight: 10, //文本内右边距离
                paddingTop: 0, //文本内上边的距离
                paddingBottom: 0, //文本内下边的距离
                marginLeft: 70, //文本离左边的距离
                marginRight: 10, //文本离右边的距离
                marginTop: 5, //文本离上边的距离
                marginBottom: 10, //文本离下边的距离
                backgroundColor: '0xFF0000', //文本的背景颜色
                backAlpha: 0, //文本的背景透明度(0-1)
                backRadius: 30, //文本的背景圆角弧度
                // clickEvent: "actionScript->videoPlay"
            }],
        x: xOffset, //x轴坐标
        y: yOffset, //y轴坐标
        //position:[2,1,0],//位置[x轴对齐方式（0=左，1=中，2=右），y轴对齐方式（0=上，1=中，2=下），x轴偏移量（不填写或null则自动判断，第一个值为0=紧贴左边，1=中间对齐，2=贴合右边），y轴偏移量（不填写或null则自动判断，0=紧贴上方，1=中间对齐，2=紧贴下方）]
        alpha: 1,
        backgroundColor: background,
        backAlpha: opacity,
        backRadius: 10 //背景圆角弧度
    }
    var danmu = player.addElement(danmuObj, "bubble");
    var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
    var obj = {
        element: danmu,
        parameter: 'x',
        static: true, //是否禁止其它属性，true=是，即当x(y)(alpha)变化时，y(x)(x,y)在播放器尺寸变化时不允许变化
        effect: 'None.easeOut',
        start: null,
        end: -danmuAttribute['width'],
        speed: 10,
        overStop: true,
        pauseStop: true,
        callBack: 'deleteChild'
    };
    var danmuAnimate = player.animate(obj);
}

// 增加表情弹幕
function newEmojiDanmu(imgUrl, x, y, size, opacity, position) {
    //弹幕说明
    var danmuObj;
    if(position==="random"){
        danmuObj = {
            list: [{
                type: 'image', //定义元素类型：只有二种类型，image=使用图片，text=文本
                file: imgUrl, //图片地址
                radius: 0, //图片圆角弧度
                width: 100 * size, //定义图片宽，必需要定义
                height: 100 * size, //定义图片高，必需要定义
                alpha: 1, //图片透明度(0-1)
                marginLeft: 0, //图片离左边的距离
                marginRight: 0, //图片离右边的距离
                marginTop: 0, //图片离上边的距离
                marginBottom: 0, //图片离下边的距离
            }],
            x: x, //x轴坐标
            y: y, //y轴坐标
            // position: [x, y],
            //position:[2,1,0],//位置[x轴对齐方式（0=左，1=中，2=右），y轴对齐方式（0=上，1=中，2=下），x轴偏移量（不填写或null则自动判断，第一个值为0=紧贴左边，1=中间对齐，2=贴合右边），y轴偏移量（不填写或null则自动判断，0=紧贴上方，1=中间对齐，2=紧贴下方）]
            alpha: opacity,
            backAlpha: 1,
            backRadius: 0 //背景圆角弧度
        };
    }
    else{
        danmuObj = {
            list: [{
                type: 'image', //定义元素类型：只有二种类型，image=使用图片，text=文本
                file: imgUrl, //图片地址
                radius: 0, //图片圆角弧度
                width: 100 * size, //定义图片宽，必需要定义
                height: 100 * size, //定义图片高，必需要定义
                alpha: 1, //图片透明度(0-1)
                marginLeft: 0, //图片离左边的距离
                marginRight: 0, //图片离右边的距离
                marginTop: 0, //图片离上边的距离
                marginBottom: 0, //图片离下边的距离
            }],
            // x: xOffset, //x轴坐标
            // y: yOffset, //y轴坐标
            position: [x, y],
            //position:[2,1,0],//位置[x轴对齐方式（0=左，1=中，2=右），y轴对齐方式（0=上，1=中，2=下），x轴偏移量（不填写或null则自动判断，第一个值为0=紧贴左边，1=中间对齐，2=贴合右边），y轴偏移量（不填写或null则自动判断，0=紧贴上方，1=中间对齐，2=紧贴下方）]
            alpha: opacity,
            backAlpha: 1,
            backRadius: 0 //背景圆角弧度
        };
    }
    switch (position) {
        case "left2right":
            var danmu = player.addElement(danmuObj, "emoji");
            var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
            var obj = {
                element: danmu,
                parameter: 'x',
                static: true, //是否禁止其它属性，true=是，即当x(y)(alpha)变化时，y(x)(x,y)在播放器尺寸变化时不允许变化
                effect: 'None.easeOut',
                start: null,
                end: '100%',
                speed: 10,
                overStop: true,
                pauseStop: true,
                callBack: 'deleteChild'
            };
            var danmuAnimate = player.animate(obj);
            break;
        case "right2left":
            var danmu = player.addElement(danmuObj, "emoji");
            var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
            var obj = {
                element: danmu,
                parameter: 'x',
                static: true, //是否禁止其它属性，true=是，即当x(y)(alpha)变化时，y(x)(x,y)在播放器尺寸变化时不允许变化
                effect: 'None.easeOut',
                start: null,
                end: -danmuAttribute['width'],
                speed: 10,
                overStop: true,
                pauseStop: true,
                callBack: 'deleteChild'
            };
            var danmuAnimate = player.animate(obj);
            break;
        case "random":
            var danmu = player.addElement(danmuObj, "emoji_random");
            var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
            const timeId2 = setInterval(() => {
                if (player.V.paused === false) {
                    clearInterval(this.timeId2);
                    danmu.style.animation= 'emoji_random 5s infinite';
                    setTimeout(function () {
                        player.deleteChild(danmu);
                    }, 5000);
                }
            }, 1000);
            break;
        case "top":
            var danmu = player.addElement(danmuObj, "emoji_top");
            // 轮询等待到没有暂停的时候开始计时（以防止出现图片大屏显示的时候表情5秒已经过去的情况），5秒后清掉该表情弹幕
            const timeId = setInterval(() => {
                if (player.V.paused === false) {
                    clearInterval(this.timeId);
                    danmu.style.animation= 'emoji-top 5s infinite';
                        setTimeout(function () {
                        player.deleteChild(danmu);
                    }, 5000);
                }
            }, 1000);
            break;
    }
}

// 增加图片弹幕
function newPicDanmu(avaterUrl, userName, imgUrl, x, y, size, opacity, position, duration) {
    //弹幕说明
    var danmuObj = {
        list: [{
            type: 'image_border', //定义元素类型：只有二种类型，image=使用图片，text=文本
            file: avaterUrl, //图片地址
            radius: 30, //图片圆角弧度
            width: 30 * size, //定义图片宽，必需要定义
            height: 30 * size, //定义图片高，必需要定义
            alpha: 1, //图片透明度(0-1)
            marginLeft: 10, //图片离左边的距离
            marginRight: 10, //图片离右边的距离
            marginTop: 10, //图片离上边的距离
            marginBottom: 5, //图片离下边的距离
            border: '3px #23d69e solid'
            // clickEvent: "link->http://"
        },
            {
                type: 'img_name', //说明是文本
                text: userName, //文本内容
                color: '0xFFF', //文本颜色
                size: 16 * size, //文本字体大小，单位：px
                font: 'Microsoft YaHei', //文本字体
                leading: 24, //文字行距
                alpha: 1, //文本透明度(0-1)
                paddingLeft: 50 * size, //文本内左边距离
                paddingRight: 10, //文本内右边距离
                paddingTop: 20, //文本内上边的距离
                paddingBottom: 0, //文本内下边的距离
                marginLeft: 5, //文本离左边的距离
                marginRight: 10, //文本离右边的距离
                marginTop: 0, //文本离上边的距离
                marginBottom: 0, //文本离下边的距离
                backgroundColor: '0xFF0000', //文本的背景颜色
                backAlpha: 0, //文本的背景透明度(0-1)
                backRadius: 30, //文本的背景圆角弧度
                // clickEvent: "actionScript->videoPlay"
            },
            {
                type: 'image_border', //定义元素类型：只有二种类型，image=使用图片，text=文本
                file: imgUrl, //图片地址
                radius: 20 * size, //图片圆角弧度
                width: 200 * size, //定义图片宽，必需要定义
                height: 200 * size, //定义图片高，必需要定义
                alpha: 1, //图片透明度(0-1)
                marginLeft: 0, //图片离左边的距离
                marginRight: 0, //图片离右边的距离
                marginTop: 0, //图片离上边的距离
                marginBottom: 0, //图片离下边的距离
                border: '5px #23d69e solid'

            }],
        // x: xOffset-200*size, //x轴坐标
        // y: yOffset, //y轴坐标
        position: [x, y],//位置[x轴对齐方式（0=左，1=中，2=右），y轴对齐方式（0=上，1=中，2=下），x轴偏移量（不填写或null则自动判断，第一个值为0=紧贴左边，1=中间对齐，2=贴合右边），y轴偏移量（不填写或null则自动判断，0=紧贴上方，1=中间对齐，2=紧贴下方）]
        alpha: opacity,
        backAlpha: 1,
        backRadius: 0 //背景圆角弧度
    }
    switch (position) {
        case "all":
            danmuObj.list[2].width = 400;
            danmuObj.list[2].height = 400;
            var danmu = player.addElement(danmuObj, "img_center", duration);
            var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
            player.playOrPause();
            setTimeout(function () {
                player.playOrPause();
                player.deleteChild(danmu);
            }, duration * 1000);
            break;
        case "upperLeft":
        case "upperRight":
            var danmu = player.addElement(danmuObj, "img");
            var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
            setTimeout(function () {
                player.deleteChild(danmu);
            }, duration * 1000);
            break;
        case "right2left":
            var danmu = player.addElement(danmuObj, "img");
            var danmuAttribute = player.getElement(danmu); //获取元件的属性，包括x,y,width,height,alpha
            var obj = {
                element: danmu,
                parameter: 'x',
                static: true, //是否禁止其它属性，true=是，即当x(y)(alpha)变化时，y(x)(x,y)在播放器尺寸变化时不允许变化
                effect: 'None.easeOut',
                start: null,
                end: -danmuAttribute['width'],
                speed: 10,
                overStop: true,
                pauseStop: true,
                callBack: 'deleteChild'
            };
            var danmuAnimate = player.animate(obj);
            break;
    }
}

function deleteChild(ele) {
    if (player) {
        player.deleteElement(ele);

    }
}

function changeText(div, text) {
    player.getByElement(div).innerHTML = text;
}

function getHtml(div) {
    return player.getByElement(div).innerHTML;
}