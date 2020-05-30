// pages/mine/history/history.js
const app = getApp()

Page({

  /**
   * 页面的初始数据
   */
  data: {
    barragelist: []
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
    const db = wx.cloud.database({});
    const table = db.collection('record');
    var obj = new Array()
    table.where({
      _openid: app.globalData.openid
    }).get({
      success: function (res) {
        for (var i = 0; i < res.data.length; i++) {
          var temp = {}
          temp.content = res.data[i].content
          temp.date = res.data[i].date
          temp.times = res.data[i].content
          temp.type = res.data[i].content
          obj.push(temp)
        }

        that.setData({
          barragelist: obj
        })
      }
    })

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})