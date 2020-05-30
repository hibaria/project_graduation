function getEle(id) {
    return document.getElementById(id);
}

function saveForm(type) {
    switch (type) {
        case 1:
            replaceText();
            replaceBubble();
            alert("修改成功!");
            break;
        case 2:
            replaceEmoji();
            alert("修改成功!");
            break;
        case 3:
            replaceImg();
            alert("修改成功!");
            break;
    }
}

function replaceText() {
    var sizeText = getEle("input-normal-size").value;
    var areaText = getEle("input-normal-area").value;
    var opacityText = getEle("input-normal-opacity").value;
    $.ajax(
        {
            url: "http://localhost:8080/BarrageProject/replaceStyleInfo.do",
            type: "get",
            data: {
                "type": "text",
                "size": sizeText,
                "area": areaText,
                "background": "",
                "opacity": opacityText,
                "duration": 0,
                "unitPrice": 0,
                "position": ""
            },
            success: function () {
                // location.reload();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("数据传输异常");
            },
        });
}

function replaceBubble() {
    // console.log(getEle("chosenColor").value);
    var areaBubble = getEle("input-normal-area").value;
    var fontSizeBubble = getEle("input-bubble-fontSize").value;
    var opacityBubble = getEle("input-bubble-opacity").value;
    var unitPriceBubble = getEle("price-number").value;
    var chosenColorBubble = getEle("chosenColor").value;
    $.ajax(
        {
            url: "http://localhost:8080/BarrageProject/replaceStyleInfo.do",
            type: "get",
            data: {
                "type": "bubble",
                "size": fontSizeBubble,
                "area": areaBubble,
                "background": chosenColorBubble,
                "opacity": opacityBubble,
                "duration": 0,
                "unitPrice": unitPriceBubble,
                "position": ""
            },
            success: function () {
                // location.reload();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("数据传输异常");
            },
        });
}

function replaceEmoji() {
    var positionEmoji = getEle("display-type").value;
    var unitPriceEmoji = getEle("playing-price-number").value;
    var opacityEmoji = getEle("input-emoji-opacity").value;
    var sizeEmoji = getEle("input-emoji-size").value;
    $.ajax(
        {
            url: "http://localhost:8080/BarrageProject/replaceStyleInfo.do",
            type: "get",
            data: {
                "type": "emoji",
                "size": sizeEmoji,
                "area": 1,
                "background": "",
                "opacity": opacityEmoji,
                "duration": 0,
                "unitPrice": unitPriceEmoji,
                "position": positionEmoji
            },
            success: function () {
                // location.reload();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("数据传输异常");
            },
        });
}

function replaceImg() {
    var positionImg = getEle("display-type").value;
    var unitPriceImg = getEle("playing-price-number").value;
    var opacityImg = getEle("input-img-opacity").value;
    var durationImg = getEle("playing-time-number").value;
    var sizeImg = getEle("input-img-size").value;
    $.ajax(
        {
            url: "http://localhost:8080/BarrageProject/replaceStyleInfo.do",
            type: "get",
            data: {
                "type": "img",
                "size": sizeImg,
                "area": 1,
                "background": "",
                "opacity": opacityImg,
                "duration": durationImg,
                "unitPrice": unitPriceImg,
                "position": positionImg
            },
            success: function () {
                // location.reload();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("数据传输异常");
            },
        });
}