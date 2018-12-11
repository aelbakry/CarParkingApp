require 'test_helper'

class ContactControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  # Defining fixtures to be used and signing in the user
  setup do
    @user = users(:one)
    sign_in @user
  end

  # Test to check that the show_form method displays the contact form.
  test "should get show_form" do
    get :show_form
    assert_response :success
    assert_select 'h1', I18n.t('contact.title')
    assert_select 'h2', I18n.t('contact.contact_us')
    assert_select 'a', I18n.t('contact.name')
    assert_select 'a', I18n.t('contact.email')
    assert_select 'a', I18n.t('contact.telephone')
    assert_select 'a', I18n.t('contact.message')

  end

  # Test to check that the user is redirected accordingly when form is submitted
  test "should send email" do
    get :request_contact
    assert_response :redirect
  end

end
