function passRow(obj) {
    var barrageid = obj.value;
    if (barrageid != null) {
        var index = $(obj).parents("tr").index(); //这个可获取当前tr的下标
        $(obj).parents("tr").remove();
        $("#table").load(location.href + " #table");  //这里是第一次用的局部刷新
        $.ajax(
            {
                url: "http://localhost:8080/BarrageProject/passBarrage.do",
                type: "post",
                data: {"barrageId": barrageid},
                success: function () {
                    location.reload();
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("数据传输异常");
                },
            });
    } else {
        throw new Error(
            "the given object is not contained by the table");
    }
}

function unpassRow(obj) {
    var barrageid = obj.value;
    if (barrageid != null) {
        var index = $(obj).parents("tr").index(); //这个可获取当前tr的下标
        $(obj).parents("tr").remove();
        $("#table").load(location.href + " #table");  //这里是第一次用的局部刷新
        $.ajax(
            {
                url: "http://localhost:8080/BarrageProject/unPassBarrage.do",
                type: "post",
                data: {"barrageId": barrageid},
                success: function () {
                    location.reload();
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("数据传输异常");
                },
            });
    } else {
        throw new Error(
            "the given object is not contained by the table");
    }
}

function delRow(obj) {
    var barrageid = obj.value;
    if (barrageid != null) {
        var index = $(obj).parents("tr").index(); //这个可获取当前tr的下标
        $(obj).parents("tr").remove();
        $("#table").load(location.href + " #table");  //这里是第一次用的局部刷新
        $.ajax(
            {
                url: "http://localhost:8080/BarrageProject/undoPass.do",
                type: "post",
                data: {"barrageId": barrageid},
                success: function () {
                    location.reload();
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("数据传输异常");
                },
            });
    } else {
        throw new Error(
            "the given object is not contained by the table");
    }
}

function delRow2(obj) {
    var barrageid = obj.value;
    if (barrageid != null) {

        var index = $(obj).parents("tr").index(); //这个可获取当前tr的下标
        $(obj).parents("tr").remove();
        $("#table").load(location.href + " #table");  //这里是第一次用的局部刷新
        $.ajax(
            {
                url: "http://localhost:8080/BarrageProject/deleteUnpass.do",
                type: "post",
                data: {"barrageId": barrageid},
                success: function () {
                    location.reload();
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("数据传输异常");
                },
            });
    } else {
        throw new Error(
            "the given object is not contained by the table");
    }
}