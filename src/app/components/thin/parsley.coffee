class Parsley
  init:(selecter)->
    $(selecter)?.parsley({namespace: 'thin-validate-'})
  validate:(selecter)->
    # console.log "heel"
    elements=@init(selecter)
    try
      if elements.validate()==true
        return true
      else
        return false
    catch error #多个field？只能遍历咯
      # console.log error
      ret = true
      for element in elements
        if element.validate()!=true
          ret = false # 只要有一项不通过，则将返回值设置为false
      return ret




  # whenValid:()->

thin.define "$validate",[],->
  return new Parsley
