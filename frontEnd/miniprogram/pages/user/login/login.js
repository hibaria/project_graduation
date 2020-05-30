const app = getApp()
Page({
  onShareAppMessage() {
    return {
      title: '微信登录',
      path: 'pages/mine/login/login'
    }
  },

  onLoad() {
    
  },
  
  data: {
    hasLogin: app.globalData.hasLogin,
  },

  getUserInfo(e) {
    wx.showToast({
      title: '登录成功',
      icon: 'success',
      duration: 1000
    })
    const userInfo = e.detail.userInfo
    this.setData({
      userInfo: userInfo,
      hasLogin:true
    })
    app.globalData.hasLogin = true
    app.globalData.userInfo = userInfo
    wx.cloud.callFunction({
      name: 'login',
      data: {},
      success: res => {
        app.globalData.openid = res.result.openid
        const db = wx.cloud.database({});
        const table = db.collection('user');

        table.where({
          _openid: app.globalData.openid
        }).get({
          success: function (res) {
            if (res.data.length > 0) {
              var that = this
            }
            else {
              table.add({
                data: {
                  'name': app.globalData.userInfo.nickName,
                  'avatars': app.globalData.userInfo.avatarUrl,
                  'sex': app.globalData.userInfo.gender,
                }
              });
              var that = this
            }
          }
        });
      },
      fail: err => {
        console.error('[云函数] [login] 调用失败', err)
      }
    })
    
    setTimeout(function () {
      wx.navigateBack({//返回
        delta: 1
      })
    }, 1000);
    
  },


  cancel() {
    wx.navigateBack({ changed: true });//返回上一页
  },

})
