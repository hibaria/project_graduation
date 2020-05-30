function getEle(id) {
    return document.getElementById(id);
}

function setDisplay(displayEmoji1,displayEmoji2,displayEmoji3,displayEmoji4) {
    getEle("preview-exm-emoji1").style.display=displayEmoji1;
    getEle("preview-exm-emoji2").style.display=displayEmoji2;
    getEle("preview-exm-emoji3").style.display=displayEmoji3;
    getEle("preview-exm-emoji4").style.display=displayEmoji4;
}

function changeType() {
    var radios = document.getElementsByName("display-type");
    // 获取被选取的播放方式序号
    var index = 0;
    for(var i=0;i<radios.length;i++){
        if(radios[i].checked === true){
            index=i;
        }
    }
    switch (index) {
        case 0:
            setDisplay("","none","none","none");
            getEle("display-type").value="random";
            break;
        case 1:
            setDisplay("none","","none","none");
            getEle("display-type").value="right2left";
            break;
        case 2:
            setDisplay("none","none","","none");
            getEle("display-type").value="left2right";
            break;
        case 3:
            setDisplay("none","none","none","");
            getEle("display-type").value="top";
            break;
        default:
            setDisplay("","none","none","none");
            getEle("display-type").value="random";
            break;
    }
}

function changePlayingPriceNum(value) {
    getEle("playing-price-number").value=value;
}
// 更改滚动条的值
function changePlayingPriceRange(value) {
    getEle("playing-price-range").value=value;
}

function changeEmojiOpacity(val) {
    getEle('emoji-opacity').value = parseInt(val * 100) + "%";
    getEle('emoji-img1').style.opacity=val;
    getEle('emoji-img2').style.opacity=val;
    getEle('emoji-img3').style.opacity=val;
    getEle('emoji-img4').style.opacity=val;
}
function resizeEmoji(id,ratio){
    getEle(id).style.width=60*ratio+"px";
    getEle(id).style.height=60*ratio+"px";
}

function changeEmojiSize(val){
    getEle('emoji-size').value = parseInt(val * 100) + "%";
    resizeEmoji("emoji-img1",val);
    resizeEmoji("emoji-img2",val);
    resizeEmoji("emoji-img3",val);
    resizeEmoji("emoji-img4",val);
    resizeEmoji("preview-exm-emoji4",val);
}