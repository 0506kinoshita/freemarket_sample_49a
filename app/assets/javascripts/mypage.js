$(function(){
  $(".mypage-must").on('click',function(){
    $(".mypage-tab2").css({
      display: 'block'
    });
    $(".mypage-tab1").css({
      display: 'none'
    });
  });


  $(".mypage-info").on('click', function(){
    $(".mypage-tab2").css({
      display: 'none'
    });
    $(".mypage-tab1").css({
      display: 'block'
    });
  });
});

$(function(){
  $(".mypage-traded").on('click',function(){
    $(".trade-information2").css({
      display: 'block'
    });
    $(".trade-information1").css({
      display: 'none'
    });
  });

  $(".mypage-trading").on('click', function(){
    $(".trade-information2").css({
      display: 'none'
    });
    $(".trade-information1").css({
      display: 'block'
    });
  });
});