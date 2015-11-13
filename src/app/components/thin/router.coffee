thin.define "$router",["$carousel", "$imagepicker"], ($carousel, $imagepicker)->
  class Router
    init:->
      # 此前端路由是可选的
      page '*', (state)=>
        @showPage state.path #跳转到指定的路径。这是默认行为
        return
      page({hashbang:true})
    showPage:(path)->
      #路由跳转函数
      sections = $('section')
      section = sections.filter("[data-route='#{ path }']")
      if (section.length)
        console.log "跳转到#{ path }"
        sections.hide(250)
        section.show(250)
        #路由切换完毕，延迟500ms，对masonry进行刷新。
        @refresh()#调用刷新方法
      # else
      #   console.log "#{path} 并不存在哦。"
      #   if path != "/main/" #防止无限循环
      #     @redirect("/main/")
      return
    register:->
      return page
    redirect:(path)->
      page.redirect(path)
    refresh:(timeout=500)->
      $('html, body').animate({scrollTop:0}, 500)
      setTimeout(->
        # 这里放置页面刷新需要放置的方法
        $carousel.refresh()
        $imagepicker.refresh()
      ,500)


  return  new Router
