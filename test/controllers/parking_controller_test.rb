require 'test_helper'

class ParkingControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers



  setup do
    @parking = parkings(:one)

  end

  test "should get search" do
    get :search, params: { parking: { parking_id: @parking.id }}
    assert_response :redirect

  end

  test "should not get search" do

    get :search, params: { parking: { search: nil }}
    assert_response :redirect

  end

  test "should get book" do

    get :book, params: { id: @parking.id }
    assert_response :success


  end

end
