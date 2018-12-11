require 'test_helper'

class AccountControllerTest <  ActionController::TestCase
  include Devise::Test::ControllerHelpers

  # Defining fixtures to be used
  setup do
    @user = users(:one)
  end

  # Test to check that the user can sign in
  test 'users can sign_in' do
    sign_in @user
    assert_response :success

  end

  # Test to check that the user can sign out
  test 'users can sign_out' do
    sign_out @user
    assert_response :success
  end

  # Test to check that the user can view their profile
  test 'should get display' do
    get :display, params: {  :id => @user.id }
    assert_response :success
    assert_select 'h1', I18n.t('header.account')
  end


end
