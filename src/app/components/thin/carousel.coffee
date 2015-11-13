class Carousel
  init:(selecter)->
    $(selecter).carousel
      show: 1
      autoAdvance :true
  initBanner:(selecter)->
    $(selecter).carousel
      show: 1
      infinite :true
      autoAdvance :true #自动轮播
      autoTime:5000
      controls:false
  refresh:()->
    #刷新有FormstoneCarousel类名的实例。
    $(".FormstoneCarousel").carousel("resize")



thin.define "$carousel",[],->
  return new Carousel
