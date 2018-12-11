require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # Defining fixtures to be used
  setup do
    @parking = parkings(:one)
    @user = users(:one)
  end


  test 'should not save empty booking' do

    booking = Booking.new
    booking.save

    refute booking.valid?

  end

  test 'should save valid booking' do

    booking = Booking.new
    booking.date = Date.new
    booking.parking = @parking
    booking.user = @user
    booking.save

    assert booking.valid?

  end




end
