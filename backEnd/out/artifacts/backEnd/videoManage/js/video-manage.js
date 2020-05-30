// video-list页面
// 播放该视频
function playRow(obj) {
    var id = obj.value;
    if (id != null) {
        $.ajax(
            {
                url: "http://localhost:8080/BarrageProject/ReplacePlayingVideo.do",
                type: "post",
                data: {"id": id},
                success: function () {
                    location.replace("http://localhost:8080/BarrageProject/videoManage/video-player.jsp");
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