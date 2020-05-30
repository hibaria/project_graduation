// miniprogram/pages/user/index.js
const app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: app.globalData.userInfo,
    hasLogin: app.globalData.hasLogin,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    var that = this
    if (!app.globalData.hasLogin) {
      that.setData({
        userInfo: {
          name: "登录",
          avatarUrl: '../../images/user/avater_default.png'
        }
      })
    } else {
      //刷新用户信息
      that.setData({
        userInfo: {
          name: app.globalData.userInfo.nickName,
          avatarUrl: app.globalData.userInfo.avatarUrl
        }
      })
    }
  },
  //去登录
  gotoLogin() {
    if (!app.globalData.hasLogin)
      wx.navigateTo({
        url: './login/login'
      })
  },

  //已发弹幕
  toHistory: function () {
    if (!app.globalData.hasLogin) {
      wx.showModal({
        content: '请先进行登录方可查看弹幕记录！'
      })
    }
    else {
      wx.navigateTo({
        url: './history/history'
      })
    }
  },
  //消费
  toCostRecord:function(){
    if (!app.globalData.hasLogin) {
      wx.showModal({
        content: '请先进行登录方可查看个人消费记录！'
      })
    }
    else {
      wx.navigateTo({
        url: './cost/cost'
      })
    }
  },
  //联系我们
  toFeedback: function (e) {
    if (!app.globalData.hasLogin) {
      wx.showModal({
        content: '请先进行登录方可反馈意见！'
      })
    }
    else {
      wx.navigateTo({
        url: './feedback/feedback',
      })
    }
  },
  //退出登录
  toLogout: function () {
    const that = this
    if (app.globalData.hasLogin) {
      wx.showModal({
        title: '提示',
        content: '是否确认退出登录？',
        success(res) {
          if (res.confirm) {
            that.setData({
              userInfo: { 
                name: "登录",
                avatarUrl: '../../images/user/avater_default.png'
              },
              hasLogin: false
            })
            app.globalData.hasLogin = false
            app.globalData.userInfo = {}
            app.globalData.openid = ""
          }
        }
      })
    }
  },

})