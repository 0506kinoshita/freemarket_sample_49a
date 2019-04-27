$(function(){
  $(".mypage__user-page__main__tab__tab1__contents__must").on('click',function(){
    $(".mypage__user-page__main__tab__tab2").css({
      display: 'block'
    });
    $(".mypage__user-page__main__tab__tab1").css({
      display: 'none'
    });
  });


  $(".mypage__user-page__main__tab__tab2__contents__info").on('click', function(){
    $(".mypage__user-page__main__tab__tab2").css({
      display: 'none'
    });
    $(".mypage__user-page__main__tab__tab1").css({
      display: 'block'
    });
  });
});

$(function(){
  $(".mypage__user-page__main__trade-information1__trade__traded").on('click',function(){
    $(".mypage__user-page__main__trade-information2").css({
      display: 'block'
    });
    $(".mypage__user-page__main__trade-information1").css({
      display: 'none'
    });
  });

  $(".mypage__user-page__main__trade-information2__trade__trading").on('click', function(){
    $(".mypage__user-page__main__trade-information2").css({
      display: 'none'
    });
    $(".mypage__user-page__main__trade-information1").css({
      display: 'block'
    });
  });
});