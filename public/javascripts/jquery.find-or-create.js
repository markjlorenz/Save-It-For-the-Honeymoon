jQuery.fn.equals = function(compareTo) {
//from http://stackoverflow.com/questions/3176962/jquery-object-equality
  if (!compareTo || this.length != compareTo.length) {
    return false;
  }
  for (var i = 0; i < this.length; ++i) {
    if (this[i] !== compareTo[i]) {
      return false;
    }
  }
  return true;
};


jQuery(function($){
    $.widget("dbd.findOrCreate", {
  _create: function(){ 
    var self = this;
    var $ele = $(self.element);
    var inputAttributes = ""

    //scope the fields only to ones that are within this widget
    self.$findField = $ele.find(self.options.$findField); 
    self.$createField = $ele.find(self.options.$createField); 

    $.each(self.options.inputAttributes, function(i, attrPair){ 
      for (var attrName in attrPair){
        if(i>0){inputAttributes += ", ";}
        inputAttributes += attrName+'="'+attrPair[attrName]+'"'
      }
    });
    self.$target = $('<div class="find-or-create-wrapper"><label>'+self.options.label+'</label><input '+inputAttributes+' /></div>');
    self.selected = false; //use this var to store the select state, on click both select and change are fired, on new text entry only change is called by ui.autocomplete
    if(!$().equals(self.options.$before)){
      self.$target.insertBefore($ele.find(self.options.$before));
    }else{
      self.$target.appendTo($ele);
    }
    self.$wrapper = $('.find-or-create-wrapper', $ele);
    self.options.$secondaryCreateFields.appendTo(self.$wrapper).hide();
    //$ele.append(self.$target);
    self.$inputFields = $('input', $ele);

    if(!self.options.debug){
      self.$findField.hide();
      self.$createField.hide();
    }

    self.targetInput().val( self.$createField.val() );

    self.targetInput().change(function(e){self._changed(e, self);});
    self.targetInput().blur(function(e){self._blured(e, self);});
    //self.$target.closest('form').submit(function(e){self._submitted(e, self);});
    self.targetInput().autocomplete({
      source:self.options.source, 
      select:function(e, ui){self._selected(e, ui, self);}
    });
    $.each(self.options.autocompleteOptions, function(key, value){ 
        self.targetInput().autocomplete("option", key, value);
    });

    return self;
  },
  _init: function(){
    return this;
  },
  _selected:function(e, ui, self){ 
    self.$findField.val(''); 
    self.$createField.val('');
    self.options.$secondaryFindFields.val('');
    self.$findField.val(ui.item[self.options.sourceKeyName]);
    self.selected = true;
  },
  _changed:function(e, self){
    //changed doesn't fire when an autocomplete is selected, on blur after text is typed
    self.$findField.val(''); 
    self.$createField.val('');
    self.$createField.val(self.targetInput().val());

    self.selected = false;
  },
  _blured:function(e, self){
    if(!self.selected){
      self.options.$secondaryCreateFields.show();
    }
    self._trigger('blur');
  },
  _setOption: function( key, value ) {
    var self = this;
    switch ( key ) {
      case "source":
        self.$target.autocomplete('option', 'source', value);
      break;
    }
    self.options.key = value; //ui.dialog had "this._super( "_setOption", key, value );" but console was telling me that "this" didn't have a "._super"
  },
  targetInput: function(){
    var self = this;
    //return self.$target.last();
    return $('input', self.$target);
  },
  inputFields: function(){
    var self = this;
    return $('input', self.element);
  },
  options: {
    label: '',
    inputAttributes: [],
    $findField: $(),
    $createField: $(),
    $secondaryFindFields: $(),
    $secondaryCreateFields: $(),
    $before: $(),
    sourceKeyName: 'key', //don't actually use this option
    sourceValueName: 'value', //don't actually use this option
    source: '',
    autocompleteOptions:{},
    debug: false
  }
});
});
