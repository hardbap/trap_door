require 'rubygems'
require 'test/unit'
require 'active_support'
require 'action_controller'
require 'action_view/test_case'
require 'trap_door'

ActionController::Base.logger = nil
ActionController::Routing::Routes.reload rescue nil

ActionController::Base.send :include, TrapDoor