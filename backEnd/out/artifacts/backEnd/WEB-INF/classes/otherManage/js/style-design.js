function getEle(id) {
    return document.getElementById(id);
}

function setDisplay(normalDisplayArea,bubble1,bubble2,text1,text2,text3,text4,text5,text6,text7,text8) {
    getEle('normal-display').value =normalDisplayArea;
    getEle('bubble-emx1').style.display = bubble1;
    getEle('bubble-emx2').style.display =bubble2;
    getEle('text-emx1').style.display = text1;
    getEle('text-emx2').style.display = text2;
    getEle('text-emx3').style.display =text3;
    getEle('text-emx4').style.display = text4;
    getEle('text-emx5').style.display = text5;
    getEle('text-emx6').style.display = text6;
    getEle('text-emx7').style.display = text7;
    getEle('text-emx8').style.display = text8;
}

function changeNormalDisplayArea(val) {
    // console.log(typeof val)
    switch (val) {
        case('0.25'):
            getEle('normal-display').value ="1/4屏";
            setDisplay( "1/4屏","none","none","","","none","none","none","none","none","none");
            break;
        case('0.5'):
            setDisplay( "半屏","","none","","","","","none","none","none","none");
            break;
        case('0.75'):
            setDisplay( "3/4屏","","","","","","","","","none","none");
            break;
        case('1'):
            setDisplay( "满屏","","","","","","","","","","");
            break;
        default:
            setDisplay( "3/4屏","","","","","","","","","none","none");
            break;
    }
}

function changeNormalFontSize(val) {
    getEle('normal-fontSize').value = parseInt(val * 100) + "%";
    var eles = document.getElementsByName("exm-text");
    eles.forEach(function (ele) {
        ele.style.fontSize = 24 * val+"pt";
    });
}

function changeNormalOpacity(val) {
    getEle('normal-opacity').value = parseInt(val * 100) + "%";
    var eles = document.getElementsByName("exm-text");
    eles.forEach(function (ele) {
        ele.style.opacity = val;
    });
}

function changeBubbleFontSize(val) {
    getEle('bubble-fontSize').value = parseInt(val * 100) + "%";
    getEle('bubble-exm1-name').style.fontSize = 14 * val+"pt";
    getEle('bubble-exm1-text').style.fontSize = 20 * val+"pt";
    getEle('bubble-exm2-name').style.fontSize = 20 * val+"pt";
    getEle('bubble-exm2-text').style.fontSize = 24 * val+"pt";
}

function changeBubbleOpacity(val) {
    getEle('bubble-opacity').value = parseInt(val * 100) + "%";
    var eles = document.getElementsByName("bubble-exm");
    eles.forEach(function (ele) {
        ele.style.opacity = val;
    });
}

// 播放每秒价格
// 更改input-number内的值
function changePriceNum(value) {
    getEle("price-number").value=value;
}
// 更改滚动条的值
function changePriceRange(value) {
    getEle("price-range").value=value;
}