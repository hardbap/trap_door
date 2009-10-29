module TrapDoor
  mattr_accessor :honeypot_field_name
  
  def self.included(controller)
    self.honeypot_field_name = honeypot_field_name || :affiliate_id
    controller.extend(ClassMethods)
  end

  module ClassMethods
    def trap_door(options = {})
      send :include, InstanceMethods
      before_filter :check_params, :only => options[:only], :except => options[:except]
    end
  end

  module InstanceMethods
    private

    def check_params
      redirect_to 'http://en.wikipedia.org/wiki/User:Mike_Rosoft/Spambot' unless params[honeypot_field_name.to_sym].blank?
    end
  end
  
  module TrapDoorHelper
    def trap_door_field(options = {})
      hidden_field_tag(TrapDoor.honeypot_field_name, '', options)
    end
  end
end
