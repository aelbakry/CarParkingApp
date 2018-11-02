require 'test_helper'

class ParkingControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get parking_search_url
    assert_response :success
  end

end
