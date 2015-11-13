class ImagePicker
  init:->
    $("select.image-picker").imagepicker
      show_label: true
    $("ul.thumbnails.image_picker_selector p").append(" <i class='glyphicon glyphicon-ok'/>")
    @refresh()
    return
  refresh:()->
    $('.image_picker_selector').masonry
      # options...
      itemSelector: 'li',
      # columnWidth: ".grid-sizer"
    return

thin.define "$imagepicker",[],->
  return new ImagePicker
