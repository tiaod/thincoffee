class Multiselect
  init:(selecter,placeholder,unit,config={})->
    #进行初始化
    $(selecter)?.multiselect
      disabledText:"没有选项..."
      buttonWidth: '100%'
      enableFiltering: config.enableFiltering ? false
      enableHTML:true
      buttonContainer: '<div class="btn-group" />'
      buttonText:(options, select)->
        if (options.length == 0)
          return "<span style='color:#999;'>#{placeholder}</span>"
        else if (options.length > 3)
          return "你选择了#{options.length}#{unit}"
        else
          labels = []
          options.each ->
            if ($(@).attr('label') != undefined)
              labels.push($(@).attr('label'))
            else
              labels.push($(@).html())
        return labels.join(', ') + ''
      # maxHeight: 400
    .multiselect('rebuild') #设置完进行刷新操作。
    return
  disable:(selecter)->
    $(selecter)?.multiselect("disable")
  enable:(selecter)->
    $(selecter)?.multiselect("enable")
thin.define "$multiselect",[],->
  return new Multiselect
