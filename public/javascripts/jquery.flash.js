jQuery(function($){
$.widget("dbd.flash", {
  _create: function(){ 
    var self = this;
    var $ele = $(self.element);
    if ($('.message', $ele).text() == ""){
      $ele.hide();
    }else{
      $ele.delay(self.options.displayTime).slideUp();
    }
  },
  options: {
    displayTime: 1500
  }
});
});
