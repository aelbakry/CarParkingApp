require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get show_form" do
    get contact_show_form_url
    assert_response :success
  end

end
