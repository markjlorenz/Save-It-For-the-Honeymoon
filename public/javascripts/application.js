// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//jQuery.noConflict();

jQuery(function($){
  $.datepicker.setDefaults({ dateFormat:'dd-M-yy' });
  $('.datepicker').datepicker({
    changeYear: true,
    changeMonth: true,
    onSelect: function(dateText, inst){
      if($(this).is('div')){
        $('input', $(this)).val(dateText);        
      }
    } 
  });
  $('.datepicker').each(function(i){
    var date = new Date($(this).val());
    $(this).val($.datepicker.formatDate('dd-M-yy', date));
  });

  apply_noise();

  $('input[type="submit"]').button();

  $('form[data-remote="true"]')
    .bind('ajax:beforeSend', function(e) { $(e.target).find('input[type="submit"]').loadingOverlay('show'); })
    .bind('ajax:loading', function() {;})
    .bind('ajax:success', function(e, data, status, xhr) {
    })
    .bind('ajax:error', function(e, xhr, status, error) {
      console.log('Action: ' + $(e.target).attr('action'));
      console.log('Error: ' + error);
      console.log(xhr.responseText);

      var $response = $(xhr.responseText);
      var selector = 'form[action="'+$(e.target).attr('action')+'"]';
      var $selected_response = $response.find(selector).first();
      if($selected_response.size() > 0){
        $(e.target).replaceWith($selected_response);
      }
      else{
        $(e.target).replaceWith($response);
      }
      //$(e.target).replaceWith($response.find(selector).first());
      //$(e.target).replaceWith($(xhr.responseText).find('form[action="'+$(e.target).attr('action')+'"]').first());
    })
    .bind('ajax:complete', function(e, xhr, options) {
      $(e.target).find('input[type="submit"]').loadingOverlay('hide');
      apply_noise();
    });

  if (Modernizr.input.placeholder) {
    }else{
    $('[placeholder]:not(label+br+[placeholder], label+[placeholder])').before(function(){ return '<label>'+$(this).attr('placeholder')+'</label>: ';});
  }
});

function apply_noise(){
  $('#content>.section, #header.section, .flash, #signin, #favor-redemption-input').noisy({
    intensity: 0.9, 
    size: 200, 
    opacity: 0.08,
    //fallback: '',
    monochrome: false
  });
}

