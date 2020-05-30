// miniprogram/pages/live/index.js

const app = getApp()
var timeUtil = require('../../utils/timeUtil.js');
var COS = require('../../lib/cos-wx-sdk-v5')
var config = require('./config')
var liveData = require('../../data/liveData.js')
var contraband = require('../data/contraband.js')

var cos = new COS({
  getAuthorization: function (params, callback) {//获取签名 必填参数
    // 方法一（推荐）服务器提供计算签名的接口
    /*
    wx.request({
        url: 'SIGN_SERVER_URL',
        data: {
            Method: params.Method,
            Key: params.Key
        },
        dataType: 'text',
        success: function (result) {
            callback(result.data);
        }
    });
    */
    // 方法二（适用于前端调试）
    var authorization = COS.getAuthorization({
      SecretId: config.SecretId,
      SecretKey: config.SecretKey,
      Method: params.Method,
      Key: params.Key
    });
    callback(authorization);
  }
});

function getRandomColor() {
  const rgb = []
  for (let i = 0; i < 3; ++i) {
    let color = Math.floor(Math.random() * 256).toString(16)
    color = color.length === 1 ? '0' + color : color
    rgb.push(color)
  }
  return '#' + rgb.join('')
}

function getJsonLength(jsonData) {
  var jsonLength = 0;
  for (var item in jsonData) {
    jsonLength++;
  }
  return jsonLength;
}
Page({

  /**
   * 页面的初始数据
   */
  data: {
    list: '',
    videoPlayingInfo: '',
    inputValue: '',
    bubbleInput:'',
    src: '',
    userInfo: app.globalData.userInfo,
    hasLogin: app.globalData.hasLogin,
    showModalStatus: false,
    showModalStatus2: false,
    shortcutList: require('../data/data-select.js').list,
    barragelistLen:0,
    //主题：0为实名，1为匿名
    themeIndex: 0,
    themeText: ['实名', '匿名'],
    themeBackground: ['#23D69E', '#363636'],
    buttonBackground: ['#ffffff', '#bdbdbd'],
    buttomBarBackground: ['#f3f3f3', '#363636'],
    mainBackground: ['#ffffff', '#646464'],
    // 底部导航栏的图片
    message_link: ["../../images/message_link.png", "../../images/message_link2.png"],
    message_select: ["../../images/message_select.png", "../../images/message_select2.png"],
    // 弹幕样式选择:0为气泡弹幕，1为大号弹幕，2为表情，3为图片
    barrageTypeIndex: 0,
    imgList: liveData.imgList,
    linkTextColor: ['#23D69E', '#252525'],
    txtList: ["气泡弹幕", "大号弹幕", "表情", "图片"],
    barrageTypeList: ["bubble", "bigBubble", "emoji", "pic"],
    imageList: ['../../images/background.png'],
    videoTime: 0,
    timesList: ['1次', '2次', '3次', '4次', '5次', '10次', '20次'],
    timesIndex: 0,
    timesArray: [1, 2, 3, 4, 5, 10, 20],
    costArray: liveData.costArray,
    imgUrl:'',
    isShow: false,//控制emoji表情是否显示
    isLoad: true,//解决初试加载时emoji动画执行一次
    content: "",//评论框的内容
    cfBg: false,
    emoji: liveData.emoji,
    choosedEmoji:"grinning-face_1f600",
    keywords:contraband.keyword
  },

  /**
   *分享页面格式
   */
  onShareAppMessage() {
    return {
      title: '星弹幕现场',
      path: 'pages/live/index'
    }
  },

  /**
   *生命周期函数
   */
  onLoad: function() {
    var that = this;
    // 获取视频信息
    wx.request({
      url: 'http://localhost:8080/BarrageProject/getPlayingVideo.do', //自己请求的服务器的地址
      method: 'GET',
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(req) {
        var list = req.data;
        that.setData({
          videoPlayingInfo: list
        })
      }
    })
    // 获取弹幕列表传输到视频当中：json格式为：{test:'',color:'',time:int}
    wx.request({
      url: 'http://localhost:8080/BarrageProject/getBarrageToSmallProgram.do', //自己请求的服务器的地址
      method: 'GET',
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function(req) {
        var list = req.data;
        that.setData({
          danmuList: list
        })
      }
    })
    wx.request({
      url: 'http://localhost:8080/BarrageProject/getBarrage2ToSmallProgram.do', //自己请求的服务器的地址
      method: 'GET',
      header: {
        'content-type': 'application/json' // 默认值
      },
      success: function (req) {
        var list = req.data;
        that.setData({
          barragelist: list,
          barragelistLen: getJsonLength(list),
          toView: "item" + (getJsonLength(list) - 1)
        })
      }
    })
    //获取屏幕宽高  
    wx.getSystemInfo({
      success: function(res) {
        var windowWidth = res.windowWidth;
        //video标签认宽度300px、高度225px，设置宽高需要通过wxss设置width和height。 
        var videoHeight = (240 / 426) * windowWidth;
        that.setData({
          videoWidth: windowWidth,
          videoHeight: videoHeight
        })
      }
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {
    this.videoContext = wx.createVideoContext('myVideo')
    this.computeScrollViewHeight()
    this.switchButtonAnimation = wx.createAnimation()
    this.switchTextAnimation = wx.createAnimation()
  },

  /**
   * 监听
   */
  onShow: function() {
    var that = this
    // 根据实名/匿名状态不同更改发送弹幕时的头像和名字
    if (this.data.themeIndex == 1) {
      this.setData({
        userInfo: {
          name: "神秘用户",
          avatarUrl: 'https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png'
        }
      })
    } else {
      this.setData({
        userInfo: {
          name: app.globalData.userInfo.nickName,
          avatarUrl: app.globalData.userInfo.avatarUrl
        }
      })
    }

    // 查看实时弹幕内容作为主内容更新（中间部分的聊天室样式的内容）,这里用云端数据的作为样本展示
    // const db = wx.cloud.database({});
    // const table = db.collection('barrageRecord');
    // var obj = new Array()
    // table.get({
    //   success: function(res) {
    //     for (var i = 0; i < res.data.length; i++) {
    //       var temp = {}
    //       temp.avatars = res.data[i].avatars
    //       temp.content = res.data[i].content
    //       temp.name = res.data[i].name
    //       temp.data = res.data[i].time
    //       obj.push(temp)
    //     }

    //     that.setData({
    //       barragelist: obj
    //     })
    //   }
    // })

    // 这里调用后台数据得到当前的弹幕列表，展示在中间部分当做聊天室样式的内容，目前还无法实时更新，只有在切换后再切换回来才能刷新
    setInterval(function () {
      wx.request({
        url: 'http://localhost:8080/BarrageProject/getBarrage2ToSmallProgram.do', //自己请求的服务器的地址
        method: 'GET',
        header: {
          'content-type': 'application/json' // 默认值
        },
        success: function(req) {
          var list = req.data;
          that.setData({
            barragelist: list,
          })
          if (getJsonLength(that.data.barragelist)  > that.data.barragelistLen){
            that.setData({
              toView: "item" + (getJsonLength(that.data.barragelist) - 1),
              barragelistLen: getJsonLength(that.data.barragelist)
            })
          }
        }
      })
    },5000)
  },

  /**
   * 前后端通信测试
   * */
  // houduanRequest: function() {
  //   var that = this;
  //   wx.request({
  //     url: 'http://localhost:8080/BarrageProject/getUser.do', //自己请求的服务器的地址
  //     method: 'GET',
  //     header: {
  //       'content-type': 'application/json' // 默认值
  //     },
  //     success: function(req) {
  //       var list = req.data;
  //       if (list == null) {
  //         wx.showToast({
  //           title: 'ErrorMessage',
  //           icon: 'false', //图标
  //           duration: 1500 //提示的延迟的时间
  //         })
  //       } else {
  //         that.setData({
  //           list: list
  //         })
  //       }
  //     }
  //   })
  // },


  /**
   *  switch:改变实名/匿名：更改themeIndex，即实名匿名状态量；更改用户头像和名称，如果为匿名，更改为“神秘用户”以及未登录头像
   * */
  changeTheme() {
    if (this.data.themeIndex == 0) {
      this.changeToAnonymous()
      this.setData({
        themeIndex: 1,
        userInfo: {
          name: "神秘用户",
          avatarUrl: 'https://hibari-1300463990.cos.ap-guangzhou.myqcloud.com/wx595e06e829c46d2f.o6zAJs7vUIrM8OO0lO3gC9ac_AIo.Efm51I7myiGeb9326ea4c8da4603126b16c0dd509b43.png'
        }
      })
    } else {
      this.changeToRealName()
      this.setData({
        themeIndex: 0,
        userInfo: {
          name: app.globalData.userInfo.nickName,
          avatarUrl: app.globalData.userInfo.avatarUrl
        }
      })
    }
  },
  changeToAnonymous() {
    this.switchButtonAnimation.translate(36, 0).step()
    this.switchTextAnimation.translate(-23, 0).step()
    this.setData({
      switchButtonAnimation: this.switchButtonAnimation.export(),
      switchTextAnimation: this.switchTextAnimation.export()
    })
  },
  changeToRealName() {
    this.switchButtonAnimation.translate(0, 0).step()
    this.switchTextAnimation.translate(0, 0).step()
    this.setData({
      switchButtonAnimation: this.switchButtonAnimation.export(),
      switchTextAnimation: this.switchTextAnimation.export()
    })
  },

  /**
   * 输入、弹幕相关
   * */
  bindInputBlur(e) {
    this.data.inputValue = e.detail.value
  },

  bindButtonTap() {
    const that = this
    wx.chooseVideo({
      sourceType: ['album', 'camera'],
      maxDuration: 60,
      camera: ['front', 'back'],
      success(res) {
        that.setData({
          src: res.tempFilePath
        })
      }
    })
  },

  bindTimeUpdate: function(timeupdate) {
    this.setData({
      videoTime: parseInt(timeupdate.detail.currentTime)
    })
  },



  // 发送普通弹幕
  bindSendDanmu(res) {
    // this.videoContext.sendDanmu({
    //   text: this.data.inputValue,
    //   color: getRandomColor()
    // })
    if (!app.globalData.userInfo.nickName) {
      wx.showModal({
        content: '请先进行登录方可发送弹幕！'
      })
    } else if (this.data.inputValue == '') {
      wx.showModal({
        content: '请确认输入内容不为空！'
      })
    }
     else {
        var keywords = this.data.keywords
        var value=this.data.inputValue;
        var contrabandnum=0;//违禁词汇数
        var j=0;//违禁词编号
        for (var i = 0; i < keywords.length; i++) {
          //全局替换
          var reg = new RegExp(keywords[i], "g");
          //判断内容中是否包括敏感词
          if (value.indexOf(keywords[i]) != -1) {
            var result = value.replace(reg, "**");
            this.setData({
              inputValue: result
            })
            contrabandnum++;
            j=i;
          }
        }
      if (contrabandnum>0){
          wx.showModal({
            content: '发送无效，禁止输入违禁词汇：' + keywords[j]
          })
        }
        else{
            var currentTime = timeUtil.formatTime(new Date())
            wx.request({
              url: 'http://localhost:8080/BarrageProject/postBarrage.do', //自己请求的服务器的地址
              method: 'POST',
              data: {
                videoId: this.data.videoPlayingInfo.id,
                userName: this.data.userInfo.name,
                content: this.data.inputValue,
                avatars: this.data.userInfo.avatarUrl,
                currentDate: currentTime,
                videoTime: this.data.videoTime,
                barrageType: 'normal',
                times: 1
              },
              header: {
                "Content-Type": "application/x-www-form-urlencoded"
              },
              success: function(res) {
                console.log(res.data)
              }
            })
            this.setData({
              inputValue: ''
            })

      }
    }
  },


  videoErrorCallback(e) {
    console.log('视频错误信息:')
    console.log(e.detail.errMsg)
  },



  /**
   * 计算 中间主要滚动内容scroll-view 的高度
   * */
  computeScrollViewHeight() {
    var that = this
    var windowHeight = wx.getSystemInfoSync().windowHeight
    var windowWidth = wx.getSystemInfoSync().windowWidth
    var scrollHeight = windowHeight - this.data.videoHeight - 46
    this.setData({
      scrollHeight: scrollHeight,
      windowHeight: windowHeight,
      windowWidth: windowWidth
    })
  },
  loadMessage: async function (page) {
    this.setData({
      isLoading: true
    })
    if (page != null) {
      this.data.currentPage = page
      this.data.systemMessage = []
      this.data.chatMessage = []
    } else {
      this.data.currentPage++
    }
    const res = await server.request('GET', 'messages', {
      page: this.data.currentPage,
      size: 10
    })
    this.setData({
      isLoading: false
    })
    if (res.statusCode !== 200) {
      this.setData({ hasUserInfo: false })
      wx.showToast({
        title: '网络错误',
        icon: '',
        image: '/images/icons/error.png',
        duration: 0,
        mask: true,
        success: function (res) { },
        fail: function (res) { },
        complete: function (res) { },
      })
      this.setData({
        noMore: true
      })
      return
    }
    if (!res.data.data || res.data.data.length === 0) {
      this.setData({ noMore: true })
      this.data.currentPage--
      return
    }
    
  },




  // 特殊弹幕：内容输入
  bindBubbleInputBlur(e) {
    this.data.bubbleInput = e.detail.value
  },
  // 特殊弹幕发送
  bindSendSpecialDanmu() {
    if (this.data.barrageTypeIndex == 0 || this.data.barrageTypeIndex == 1) {
      if (this.data.bubbleInput == '') {
        wx.showModal({
          content: '请确认输入内容不为空！'
        })
      } else {
        var currentTime = timeUtil.formatTime(new Date())
        wx.request({
          url: 'http://localhost:8080/BarrageProject/postBarrage.do', //自己请求的服务器的地址
          method: 'POST',
          data: {
            videoId: this.data.videoPlayingInfo.id,
            userName: this.data.userInfo.name,
            content: this.data.bubbleInput,
            avatars: this.data.userInfo.avatarUrl,
            currentDate: currentTime,
            videoTime: this.data.videoTime,
            barrageType: this.data.barrageTypeList[this.data.barrageTypeIndex],
            times: this.data.timesArray[this.data.timesIndex]
          },
          header: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          success: function (res) {
            console.log(res.data)
          }
        })
        wx.showToast({
          title: '发送成功',
          icon: 'success',
          duration: 1000
        })
        this.hideModal();
        console.log('发送气泡弹幕');
        this.setData({
          bubbleInput: ''
        })
      }
    }
    else if (this.data.barrageTypeIndex == 2) {
      var currentTime = timeUtil.formatTime(new Date())
      wx.request({
        url: 'http://localhost:8080/BarrageProject/postBarrage.do', //自己请求的服务器的地址
        method: 'POST',
        data: {
          videoId: this.data.videoPlayingInfo.id,
          userName: this.data.userInfo.name,
          content: this.data.choosedEmoji,
          avatars: this.data.userInfo.avatarUrl,
          currentDate: currentTime,
          videoTime: this.data.videoTime,
          barrageType: this.data.barrageTypeList[this.data.barrageTypeIndex],
          times: this.data.timesArray[this.data.timesIndex]
        },
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        success: function (res) {
          console.log(res.data)
        }
      })
      wx.showToast({
        title: '发送成功',
        icon: 'success',
        duration: 1000
      })
      this.hideModal();
      console.log('发送表情弹幕');
      this.setData({
        choosedEmoji: "grinning-face_1f600"
      })
    }
    //图片弹幕
    else if (this.data.barrageTypeIndex == 3){
      if (this.data.imageList[0] =='../../images/background.png') {
        wx.showModal({
          content: '你还未选择图片！'
        })
      } else {
        var filePath = this.data.imageList[0]
        var Key = filePath.substr(filePath.lastIndexOf('/') + 1); // 这里指定上传的文件名
        cos.postObject({
          Bucket: config.Bucket,
          Region: config.Region,
          Key: Key,
          FilePath: filePath,
          onProgress: function (info) {
            // console.log(JSON.stringify(info));
          }
        }, this.requestCallback);
        wx.showToast({ title: '发送成功', icon: 'success', duration: 3000 });
        this.hideModal();
        console.log('发送图片弹幕');
        this.setData({
          imageList: ['../../images/background.png']
        })
      }
    }
  },

  requestCallback: function (err, data) {
    if (err && err.error) {
      wx.showModal({ title: '返回错误', content: '请求失败：' + err.error.Message + '；状态码：' + err.statusCode, showCancel: false });
    } else if (err) {
      wx.showModal({ title: '请求出错', content: '请求出错：' + err + '；状态码：' + err.statusCode, showCancel: false });
    } else {
      this.setData({
        imgUrl: data.headers['Location']
      })
      var currentTime = timeUtil.formatTime(new Date())
      wx.request({
        url: 'http://localhost:8080/BarrageProject/postBarrage.do', //自己请求的服务器的地址
        method: 'POST',
        data: {
          videoId: this.data.videoPlayingInfo.id,
          userName: this.data.userInfo.name,
          content: this.data.imgUrl,
          avatars: this.data.userInfo.avatarUrl,
          currentDate: currentTime,
          videoTime: this.data.videoTime,
          barrageType: this.data.barrageTypeList[this.data.barrageTypeIndex],
          times: this.data.timesArray[this.data.timesIndex]
        },
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        success: function (res) {
          // console.log(res.data)
        }
      })
    }
  },




  /**
   *  底部弹框：link
   * */
  toShowModel() {
    var that = this
    if (!app.globalData.hasLogin) {
      wx.showModal({
        content: '请先进行登录方可发送弹幕！'
      })
    } else {
      that.showModal();
    }
  },
  //显示对话框
  showModal: function() {
    // 显示遮罩层
    var animation = wx.createAnimation({
      duration: 200,
      timingFunction: "linear",
      delay: 0
    })
    this.animation = animation
    animation.translateY(300).step()
    this.setData({
      animationData: animation.export(),
      showModalStatus: true
    })
    setTimeout(function() {
      animation.translateY(0).step()
      this.setData({
        animationData: animation.export()
      })
    }.bind(this), 200)
  },
  //更改状态：小号弹幕、大号弹幕、表情、图片
  toMyOrderList(e) {
    var index = e.currentTarget.dataset.index;
    this.setData({
      barrageTypeIndex: index
    })
    if (index == 3)
      this.chooseImage()
  },

  chooseImage() {
    var that = this;
    wx.chooseImage({
      count: 1, // 默认9  
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有  
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
      success: function(res) {
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片  
        that.setData({
          imageList: res.tempFilePaths
        })
      }
    })
  },
  previewImage(e) {
    const current = e.target.dataset.src
    wx.previewImage({
      current,
      urls: this.data.imageList
    })
  },
  bindTypeChange: function(e) {
    // console.log(e.detail.value)
    this.setData({
      timesIndex: e.detail.value
    })
  },


  // 表情
  //上拉加载
  onReachBottom: function () {
    var conArr = [], that = this;
    that.data.cfBg = false;
  },
  //文本域获得焦点事件处理
  textAreaFocus: function () {
    this.setData({
      isShow: false,
      cfBg: false
    })
  },
  //点击表情显示隐藏表情盒子
  emojiShowHide: function () {
    this.setData({
      isShow: !this.data.isShow,
      isLoad: false,
      cfBg: !this.data.false
    })
  },
  //表情选择
  emojiChoose: function (e) {
    //当前输入表情
    this.setData({
      content: e.currentTarget.dataset.url,
      choosedEmoji: e.currentTarget.dataset.url
    })
  },

  //点击emoji背景遮罩隐藏emoji盒子
  cemojiCfBg: function () {
    this.setData({
      isShow: false,
      cfBg: false
    })
  },

  /**
   *  底部弹框：快捷短语 
   * */
  toShowModel2() {
    var that = this
    that.showModal2();
  },
  showModal2: function() {
    // 显示遮罩层
    var animation = wx.createAnimation({
      duration: 200,
      timingFunction: "linear",
      delay: 0
    })
    this.animation = animation
    animation.translateY(300).step()
    this.setData({
      animationData: animation.export(),
      showModalStatus2: true
    })
    setTimeout(function() {
      animation.translateY(0).step()
      this.setData({
        animationData: animation.export()
      })
    }.bind(this), 200)
  },
  //快捷短语的选择
  typeClick: function(e) {
    var index = e.target.dataset.index;
    this.setData({
      inputValue: this.data.shortcutList[index].txt
    })
  },


  hideModal: function () {
    // 隐藏遮罩层
    var animation = wx.createAnimation({
      duration: 200,
      timingFunction: "linear",
      delay: 0
    })
    this.animation = animation
    animation.translateY(300).step()
    this.setData({
      animationData: animation.export(),
    })
    setTimeout(function () {
      animation.translateY(0).step()
      this.setData({
        animationData: animation.export(),
        showModalStatus: false,
        showModalStatus2: false
      })
    }.bind(this), 200)
  },



})