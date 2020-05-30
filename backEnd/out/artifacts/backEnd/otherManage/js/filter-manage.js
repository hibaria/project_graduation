function confirmSubmit() {
    var vocabulary=document.getElementById("shieldingVocabulary").value;
    if (vocabulary != null) {
        closeWindow();
        alert("提交成功！");
        $.ajax(
            {
                url: "http://localhost:8080/BarrageProject/addShieldingVocabulary.do",
                type: "post",
                data: {"vocabulary": vocabulary},
                success: function () {
                    // location.reload();
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

function deleteRow(obj){
    var id = obj.value;
    if (id != null) {
        $.ajax(
            {
                url: "http://localhost:8080/BarrageProject/delVocabulary.do",
                type: "post",
                data: {"id": id},
                success: function () {
                    // location.reload();
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


// 弹窗
function showWindow() {
    $('#showdiv').show();  //显示弹窗
    $('#cover').css('display', 'block'); //显示遮罩层
    $('#cover').css('height', document.body.clientHeight + 'px'); //设置遮罩层的高度为当前页面高度
}

// 关闭弹窗
function closeWindow() {
    $('#showdiv').hide();  //隐藏弹窗
    $('#cover').css('display', 'none');   //显示遮罩层
}