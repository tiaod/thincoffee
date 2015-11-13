class Formstone
  init:->
    @toggle("input[type=checkbox].Toggle")
    $("input[type=checkbox]")?.checkbox()
    $("input[type=number]:not(.NotRange)")?.number() #排除掉有NotRange这个类名的
    @tooltip("a.Tooltip")
  tooltip:(selector)->
    # 这个可能和bootstrap的冲突。
    $(selector)?.tooltip
      direction: "left"
  popover:(selector= "[data-toggle='popover']")->
    #这是引用自bootstrap原声的popover
    $(selector)?.popover
      placement:"bottom"
      trigger:"focus"
      template:'<div class="popover" role="tooltip" style="margin-top:50px;margin-left:10px">
                  <div class="arrow"></div>
                  <h3 class="popover-title"></h3>
                  <div class="popover-content"></div>
                </div>'
    .attr("tabindex","0") #添加tabindex才能被触发
  toggle:(selector,flag=null)->
    if flag?
      $(selector)?.checkbox(flag)
    else
      $(selector)?.checkbox
        toggle:true
        labels:
          on:"是"
          off:"否"
  dropdown:(selector)->
    $(selector).dropdown()

  number:(selector,arg)->
    $(selector).number(arg)

thin.define "$formstone",[],->
  return new Formstone
