class ListSelect
  init:()->
    list =$(".ListSelect li")
    list?.click ->
      list?.removeAttr("selected")
      $(@).attr("selected","")


thin.define "$listSelect",[],->
  return new ListSelect()
