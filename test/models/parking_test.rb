require 'test_helper'

class ParkingTest < ActiveSupport::TestCase
  
  # Model test to check that parkings can be saved
  test 'should save valid parking' do

    parking = Parking.new
    parking.parkingRef = 22
    parking.name = "MyString"
    parking.location = "MyString"
    parking.postcode = "MyString"
    parking.address = "MyText"
    parking.notes = "MyText"
    parking.telephone = "MyString"
    parking.empty_spaces = 22
    parking.cost = 1.5
    parking.save

    assert parking.valid?

  end

end
