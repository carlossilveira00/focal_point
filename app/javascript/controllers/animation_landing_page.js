$(function(){
  $('figure').on('click', function(){
    var nx = $(this).next().data('number') -1;
    if(nx<0){nx =0;}
    var delta =  -360 /9 * nx;

    $(this).parent().css("transform", "translateZ( -288px ) rotateY(" + delta + "deg )");

  });
})
