function getEle(id) {
    return document.getElementById(id);
}

function count()
{
    document.getElementById("time-countdown").innerHTML = start;
    if(start === 1)
        start=6;
    start += step;
    setTimeout("count()",1000);
}

function setDisplay(full,rolling,upperleft,upperright,playingtime,imgresize) {
    getEle("img-container-full").style.display=full;
    getEle("img-container-rolling").style.display=rolling;
    getEle("img-container-upperleft").style.display=upperleft;
    getEle("img-container-upperright").style.display=upperright;
    // 图片大小调整区
    getEle("playing-time").style.display=playingtime;
    getEle("img-resize").style.display=imgresize;

}

function changeType() {
    var radios = document.getElementsByName("display-type");
    // 获取被选取的播放方式序号
    var index = 0;
    for(var i=0;i<radios.length;i++){
        if(radios[i].checked == true){
            // value = radios[i].value;
            index=i;
        }
    }
    switch (index) {
        case 0:
            setDisplay("","none","none","none","flex","none");
            getEle("display-type").value="all";
            break;
        case 1:
            setDisplay("none","","none","none","none","flex");
            getEle("display-type").value="right2left";
            break;
        case 2:
            setDisplay("none","none","","none","flex","flex");
            getEle("display-type").value="upperLeft";
            break;
        case 3:
            setDisplay("none","none","none","","flex","flex");
            getEle("display-type").value="upperRight";
            break;
        default:
            getEle("display-type").value="all";
            setDisplay("","none","none","none","flex","flex");
            break;
    }
}

// 播放时长
// 更改input-number内的值
function changePlayingTimeNum(value) {
    getEle("playing-time-number").value=value;
}
// 更改滚动条的值
function changePlayingTimeRange(value) {
    getEle("playing-time-range").value=value;
}

// 播放每秒价格
// 更改input-number内的值
function changePlayingPriceNum(value) {
    getEle("playing-price-number").value=value;
}
// 更改滚动条的值
function changePlayingPriceRange(value) {
    getEle("playing-price-range").value=value;
}

// 透明度
function changeImgOpacity(val) {
    getEle('img-opacity').value = parseInt(val * 100) + "%";
    var eles = document.getElementsByName("img-exm");
    eles.forEach(function (ele) {
        ele.style.opacity = val;
    });
}
function resizeImg(id,ratio){
    // getEle(id).style.transform='scale('+ratio+')';
    getEle(id).style.width=260*ratio+"px";
    getEle(id).style.height=260*ratio+"px";
}
// 图片大小
function changeImgSize(val) {
    getEle('img-size').value = parseInt(val * 100) + "%";
    getEle("img-container-rolling").style.marginTop=-130*val+"px";
    resizeImg("img-container-rolling",val);
    resizeImg("img-container-upperleft",val);
    resizeImg("img-container-upperright",val);
}

