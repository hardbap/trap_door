require 'test_helper'

class TrapDoorController < ActionController::Base
  trap_door :except => :new

  def new
    render :nothing => true
  end

  def create
    render :nothing => true
  end
end

class TrapDoorTest < ActionController::TestCase
  tests TrapDoorController

  def setup
    TrapDoor.honeypot_field_name = :affiliate_id
  end

  test "should redirect if the honeypot param is present" do
    get :create, :affiliate_id => 1
    assert_response :redirect
  end

  test "should not redirect if the honeypot param is missing" do
    get :create
    assert_response :success
  end
  
  test "should not redirect if honypot param is blank" do
    get :create, :affiliate_id => ""
    assert_response :success
  end

  test "should not redirect if action is in :except" do
    get :new, :affiliate_id => 1
    assert_response :success
  end

  test "should check for the user defined honeypot" do
    TrapDoor.honeypot_field_name = :spambot_id
    get :create, :spambot_id => 2
    assert_response :redirect
  end
end

class TrapDoorHelperTest < ActionView::TestCase
  tests TrapDoor::TrapDoorHelper
  
  def setup
    TrapDoor.honeypot_field_name = :affiliate_id
  end

  test "should render the trap door field" do
    assert_dom_equal('<input name="affiliate_id" id="affiliate_id" value="" type="hidden" />', trap_door_field)
  end

  test "should use the user defined honeypot field name" do
    TrapDoor.honeypot_field_name = :spambot_id
    assert_dom_equal('<input name="spambot_id" id="spambot_id" value="" type="hidden" />', trap_door_field)
  end
end
