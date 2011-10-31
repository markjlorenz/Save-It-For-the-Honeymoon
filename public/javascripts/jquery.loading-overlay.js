  //plugin to add and remove a loading overlay box to elements
jQuery(function($){
var methods = {
  init : function( options ) { },
  show : function( ) {
    var self = this;
    self.attr('disabled', 'disabled');
    var $wrapper = $('<div style="display:inline-block; position:relative; vertical-align:middle;" />');
    self.wrap($wrapper); //this.wrap('<div style="display:inline-block; position:relative;" />');
    self.parent().append('<img src="/images/ajax-loader.gif" class="loading-overlay"/>');
  },
  hide : function( ) {
    this.removeAttr('disabled');
    this.parent().find(".loading-overlay").remove();
    this.unwrap();
  }
};

$.fn.loadingOverlay = function( method ) {

  // Method calling logic
  if ( methods[method] ) {
    return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
  } else if ( typeof method === 'object' || ! method ) {
    return methods.init.apply( this, arguments );
  }else {
    $.error( 'Method ' +  method + ' does not exist on jQuery.loadingOverlay' );
  }
};
});
