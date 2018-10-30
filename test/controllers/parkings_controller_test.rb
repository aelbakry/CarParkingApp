require 'test_helper'

class ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get view_all" do
    get parkings_view_all_url
    assert_response :success
  end

end
