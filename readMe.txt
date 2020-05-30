/****************backEnd目录*******************/
网页管理端。
BarrageProject\backEnd\web\barrageManage目录下，barrage-passed.jsp、barrage-unChecked.jsp、barrage-unpassed.jsp对应弹幕管理三个页面
BarrageProject\backEnd\web\otherManage目录下，包括样式设计和过滤词汇管理页面
BarrageProject\backEnd\web\videoManage目录下，包括视频上传、视频列表、视频播放
所有的图片和视频都存储在我的腾讯云中，项目对应部分有账号和密钥，对应视频、图片的链接存储在mysql中
为了防止出错，也放了样例视频在BarrageProject\backEnd\web\sampleVideo路径下


/****************frontEnd目录*******************/
微信小程序端。需要先运行backEnd后，小程序端才能正常获取数据


/****************Mask_RCNN目录*******************/
对视频做蒙版处理的文件，如果有新的视频，需要打开mask_video_danmu.py，更改其中的输入视频路径和输出路径
蒙版视频的处理没用java调用，如果要用的话，需要单独运行python文件，并将结果视频上传到腾讯云，对应链接手动存储到数据库中


/****************SentimentPolarityAnalysis目录*******************/
对得到的弹幕文本做情感分析的文件，在backEnd中用Java对其进行了调用，所以不需要单独使用


/****************barrageProject.sql*******************/
数据库文件


主要bug：
时间问题，不是主要内容的部分都没有完成。
小程序端“已发弹幕”、“消费”、“联系我们”部分没做，网页管理端“用户反馈”部分没做。
网页管理端没分多个管理员，没做登录，而是直接进入管理页面。
因为小程序支付功能需要商户号，商户号要对应营业执照，所以没做对应支付部分。


用了的相关github参考：
https://github.com/youyuge34/Mask_Danmu
https://github.com/chaoming0625/SentimentPolarityAnalysis