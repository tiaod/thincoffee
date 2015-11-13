thin.define "$datetimepicker",["$validate"],($validate)->
  class Datetimepicker
    init:(selecter,config)->
      #初始化的接口
      target=$(selecter)
      target?.datetimepicker(config)
      target?.on "dp.change",(event)->
        # 修复验证插件不会自动刷新的问题。每次日期变更则刷新一次。
        $validate.validate(@)
      return
    data:(selecter)->
      # 修改某些设置的接口
      return $(selecter)?.data("DateTimePicker")
    lock:(dt1,dt2)->
      # 锁定两个datetimepicker。适合选择时间范围的情况。
      @data(dt1)?.useCurrent(false)
      $(dt1)?.on "dp.change",(e)->
        #选择出行日期的时候，将返回日期往后推
        #修改返回日期不用担心出行日期的问题。不限制出行日期就好。
        $datetimepicker?.data(dt2).minDate(e.date)
  return new Datetimepicker
