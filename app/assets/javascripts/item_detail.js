$(function(){
  var slider = "#slider";
  var thumbnailItem = "#thumbnail-list .thumbnail-item";
  $(thumbnailItem).each(function(){
   var index = $(thumbnailItem).index(this);
   $(this).attr("data-index",index);
  });
  
  $(slider).on('init',function(slick){
   var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
   $(thumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
  });

  $(slider).slick({
    autoplay: false,
    arrows: false,
    fade: false,
    infinite: false
  });
  $(thumbnailItem).on('mouseover',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });
  
  //サムネイル画像のカレントを切り替え
  $(slider).on('beforeChange',function(event,slick, currentSlide,nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });
});
