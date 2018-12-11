require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  # Defining fixtures to be used and signing in the user
  setup do
    @parking = parkings(:one)
    @user = users(:one)
    @booking = bookings(:one)
    sign_in @user
  end

  # Test to check that index method returns the correct booking
  test "should get index" do
    get :index
    assert_response :success
  end

  # Test to check that new method creates a new booking using the parking session provided.
  test "should get new" do
    get :new, session: { parking_id: @parking.id }
    assert_response :success
  end

  # Test to check that create method performs the correct post statement and creates
  # the required booking. Also testing that the user is redirected accordingly.
  test "should create booking" do
    assert_difference('Booking.count') do
      post :create,  params: {booking: { user_id: @user,parking_id: @parking, date: @booking.date }}, session: { parking_id: @parking.id }
    end
    assert_redirected_to booking_url(Booking.last)
  end

  # Test to check that the user could view an individual booking separately.
  test "should show booking" do
    get :show, params: {  :id => @booking.id },session: {  parking_id: @parking.id}
    assert_response :success
  end

  # Test to check that the user can edit the booking
  test "should get edit" do
    get :edit, params: {  :id => @booking.id },session: { parking_id: @parking.id}
    assert_response :success
  end

  # Test to check that user can update booking, and correct patch request is sent.
  test "should update booking" do
    patch :update, params: {  id:  @booking.id , booking: { user_id: @user,parking_id: @parking, date: @booking.date }}, session: { parking_id: @parking.id}
    assert_response :success
  end

  # Test to check that the user can destroy the booking. Also testing that the user is redirected accordingly.
  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete :destroy, params: { :id => @booking.id}, session: { parking_id: @parking.id, booking_id: @booking.id}
    end
    assert_redirected_to bookings_url
  end
end
