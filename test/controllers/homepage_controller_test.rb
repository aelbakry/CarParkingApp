require 'test_helper'
require 'devise'


class HomepageControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers


  test "should get home when user logged in" do
    sign_in users(:one)
    get :home
    assert_response :success
    assert_template layout: 'application'

  end

  test "should get header when user logged in" do
    sign_in users(:one)
    get :home
    assert_response :success
    assert_template layout: 'application'

    assert_select 'a', I18n.t('header.bookings')
    assert_select 'a', I18n.t('header.profile')
    assert_select 'a', I18n.t('header.logout')
    assert_select 'a', I18n.t('header.contact')



  end

  test "should get header when user logged out" do
    sign_out users(:one)
    get :home
    assert_response :success
    assert_template layout: 'application'

    assert_select 'a', I18n.t('header.signup')
    assert_select 'a', I18n.t('header.signin')
    assert_select 'a', I18n.t('header.contact')


  end


end
