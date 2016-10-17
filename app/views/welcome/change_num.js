var ajax_change_num = function(){
  $.get("/WelcomeController/change_num",function(data){
     $("#x").html(data.integer);
  });
}
$(function(){
  setInterval(ajax_change_num, 1000);
});
