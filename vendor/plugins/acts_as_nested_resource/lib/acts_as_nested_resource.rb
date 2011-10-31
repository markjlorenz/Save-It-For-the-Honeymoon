#ActsAsNestedResource
#make a controller acts_as_nested_resource, and the @class_name_plural (i.e. @deals) class instance variables will be automatically set for you.
#So for example your #index action might now look like:
#
#def index
#  #@deals = Deal.all #not needed anymore
#
#  respond_to do |format|
#    format.html # index.html.erb
#    format.xml  { render :xml => @deals }
#  end
#end
#
require 'action_controller/base'
module ActsAsNestedResource
  extend ActiveSupport::Concern

  module ClassMethods
    def acts_as_nested_resource(options={})
      raise ArgumentError, "Hash expected, got #{options.class.name}" if not options.is_a?(Hash) and not options.empty?
      before_filter {|controller| controller.scoped_objects(options)}
    end
  end

  module InstanceMethods
    def scoped_objects(options={})
      params.delete :action; params.delete :controller
      if options[:model].nil?
        class_name = self.class.name.gsub('Controller', '').singularize
        instance_var_name = '@'+class_name.tableize
        model_class = class_name.constantize
      else
        instance_var_name = '@'+options[:model].name.tableize
        model_class = options[:model]
      end
      self.instance_variable_set(instance_var_name.to_sym, model_class.where(params))
      self.instance_variable_set(instance_var_name.to_sym, (model_class.all)) if params.blank?
    end
  end

end

class ActionController::Base
  include ActsAsNestedResource
end

